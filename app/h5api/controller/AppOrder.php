<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppOrder extends BaseController {

	/**
	 * h5端--订单列表
	 */
	public function getOrderList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $memberid = intval(input('get.memberid'));
		$state = intval(input('get.state'));
        $pagesize = max(1, intval(input('get.page')));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['order_list'] = array();
        
        $order_model = model('order');
        $condition = array();
        $condition[] = array('buyer_id', '=', $memberid);

        if($state == 1){
            $condition[] = array('order_state', '=', ORDER_STATE_NEW);
        }else if($state == 2){
            $condition[] = array('order_state', '=', ORDER_STATE_PAY);   
        }else if($state == 3){
            $condition[] = array('order_state', '=', ORDER_STATE_SEND);   
        }else if($state == 4){
            $condition[] = array('order_state', '=', ORDER_STATE_SUCCESS);   
        }else if($state == 5){
            $condition[] = array('order_state', '=', ORDER_STATE_SUCCESS);   
        }else if($state == 7){
            $condition[] = array('order_state', '=', ORDER_STATE_CANCEL);   
        }
        //待评价
        if ($state == 4) {
            $condition[] = array('evaluation_state', '=', 0);
            $condition[] = array('refund_state', '=', 0);
        }
        //退换货
        if ($state == 6) {
            $condition[] = array('order_state', '>', ORDER_STATE_PAY);
            $condition[] = array('refund_state', '>', 0);
        }

        //回收站
        if ($state == 8) {
            $condition[] = array('delete_state', '>', 0);
        }
        $order_list = $order_model->getMobileOrderList($condition, '', $pagesize, 10, 'order_id desc', array('order_goods'));

        $refundreturn_model = model('refundreturn');
        // $order_list = $refundreturn_model->getGoodsRefundList($order_list);
        
        $payment_model = model('payment');
        //获取数据库中已安装的支付方式
        $payment_list = $payment_model->getPaymentList(array(array('payment_code', '<>', ' '), array('payment_platform', '=', 'pc'), array('payment_state', '=', '1')));
        if(!empty($payment_list)){
            foreach ($payment_list as &$value) {
                $value['payment_config'] = unserialize($value['payment_config']);
                $value['payment_desc'] = $value['payment_name'];
                if(!empty($value['payment_config'])){
                    $value['payment_desc'] = $value['payment_config']['bankname'] . ' ' . $value['payment_config']['banksn'];
                }
            }
            unset($value);
        }

        foreach ($order_list as &$order) {
            $order['add_time'] = date('Y-m-d H:i',$order['add_time']);
            if (isset($order['order_state'])) {
                switch ($order['order_state']) {
                    case ORDER_STATE_CANCEL:
                        $order['state_desc'] = 'cancelado';
                        $order['stateTipColor'] = '#909399';
                        break;
                    case ORDER_STATE_NEW:
                        $order['state_desc'] = 'en espera de pago';
                        $order['stateTipColor'] = '#fa436a';
                        break;
                    case ORDER_STATE_PAY:
                        $order['state_desc'] = 'en espera de envio';
                        $order['stateTipColor'] = '#fa436a';
                        break;
                    case ORDER_STATE_SEND:
                        $order['state_desc'] = 'en espera de recibido';
                        $order['stateTipColor'] = '#fa436a';
                        break;
                    case ORDER_STATE_SUCCESS:
                        if($order['evaluation_state'] == 0){
                            $order['state_desc'] = 'en espera de su opinion';
                            $order['stateTipColor'] = '#04ab02';
                        }else{
                            $order['state_desc'] = 'trasac cion completado';
                            $order['stateTipColor'] = '#909399';
                        }
                        break;
                }
            }
            //显示取消订单
            $order['if_cancel'] = $order_model->getOrderOperateState('buyer_cancel', $order);
            //显示退款取消订单
            $order['if_refund_cancel'] = $order_model->getOrderOperateState('refund_cancel', $order);
            //显示投诉
            $order['if_complain'] = $order_model->getOrderOperateState('complain', $order);
            //显示收货
            $order['if_receive'] = $order_model->getOrderOperateState('receive', $order);
            //显示删除订单(放入回收站)
            $order['if_delete'] = $order_model->getOrderOperateState('delete', $order);
            //显示永久删除
            $order['if_drop'] = $order_model->getOrderOperateState('drop', $order);
            //显示还原订单
            $order['if_restore'] = $order_model->getOrderOperateState('restore', $order);

            $order['payment_list'] = $payment_list;

        }


        $result['state'] = 1;
        $result['page'] = $pagesize;
        $result['pagesize'] = 10;
        $result['order_list'] = $order_list;
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

    /**
     * h5端--订单详情
     */
    public function getOrderDetail()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        $pay_sn = trim(input('get.pay_sn'));
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $order_model = model('order');
            $condition = array();
            if(!empty($order_id)){
                $condition[] = array('order_id', '=', $order_id);
            }
            if(!empty($pay_sn)){
                $condition[] = array('pay_sn', '=', $pay_sn);
            }
            $condition[] = array('buyer_id', '=', $memberid);
            $order_info = $order_model->getOrderInfo($condition, array('order_goods', 'order_common', 'store'));
            if (empty($order_info) || $order_info['delete_state'] == ORDER_DEL_STATE_DROP) {
                $result['msg'] = 'pedido no existe';
            }else{
                $refundreturn_model = model('refundreturn');
                $order_list = array();
                $order_list[$order_id] = $order_info;
                $order_list = $refundreturn_model->getGoodsRefundList($order_list, 1); //订单商品的退款退货显示
                $order_info = $order_list[$order_id];
                $refund_all = isset($order_info['refund_list'][0]) ? $order_info['refund_list'][0] : '';
                if (!empty($refund_all) && $refund_all['seller_state'] < 3) {//订单全部退款商家审核状态:1为待审核,2为同意,3为不同意
                    $result['refund_all'] = $refund_all;
                }

                $order_info['create_time'] = date('Y-m-d H:i',$order_info['add_time']);
                if (isset($order_info['order_state'])) {
                    switch ($order_info['order_state']) {
                        case ORDER_STATE_CANCEL:
                            $order_info['state_desc'] = 'cancelado';
                            break;
                        case ORDER_STATE_NEW:
                            $order_info['state_desc'] = 'en espera de pago';
                            break;
                        case ORDER_STATE_PAY:
                            $order_info['state_desc'] = 'en espera de envio';
                            break;
                        case ORDER_STATE_SEND:
                            $order_info['state_desc'] = 'en espera de recibido';
                            break;
                        case ORDER_STATE_SUCCESS:
                            if($order_info['evaluation_state'] == 0){
                                $order_info['state_desc'] = 'en espera de su opinion';
                            }else{
                                $order_info['state_desc'] = 'trasac cion completado';
                            }
                            break;
                    }
                }

                //显示取消订单
                $order_info['if_cancel'] = $order_model->getOrderOperateState('buyer_cancel', $order_info);

                //显示退款取消订单
                $order_info['if_refund_cancel'] = $order_model->getOrderOperateState('refund_cancel', $order_info);

                //显示投诉
                $order_info['if_complain'] = $order_model->getOrderOperateState('complain', $order_info);

                //显示收货
                $order_info['if_receive'] = $order_model->getOrderOperateState('receive', $order_info);

                //显示评价
                $order_info['if_evaluation'] = $order_model->getOrderOperateState('evaluation', $order_info);

                //显示系统自动取消订单日期
                if ($order_info['order_state'] == ORDER_STATE_NEW) {
                    $order_info['order_cancel_day'] = $order_info['add_time'] + config('ds_config.order_auto_cancel_day') * 24 * 3600;
                }

                //显示系统自动收获时间
                if ($order_info['order_state'] == ORDER_STATE_SEND) {
                    $order_info['order_confirm_day'] = $order_info['delay_time'] + config('ds_config.order_auto_receive_day') * 24 * 3600;
                }

                //如果订单已取消，取得取消原因、时间，操作人
                if ($order_info['order_state'] == ORDER_STATE_CANCEL) {
                    $order_info['close_info'] = $order_model->getOrderlogInfo(array('order_id' => $order_info['order_id']), 'log_id desc');
                }

                foreach ($order_info['extend_order_goods'] as &$value) {
                    if(!empty($value['goods_image'])){
                        $value['goods_image'] = goods_cthumb($value['goods_image']);
                    }
                }

                $payment_model = model('payment');
                //获取数据库中已安装的支付方式
                $payment_list = $payment_model->getPaymentList(array(array('payment_code', '<>', ' '), array('payment_platform', '=', 'pc'), array('payment_state', '=', '1')));
                if(!empty($payment_list)){
                    foreach ($payment_list as &$value) {
                        $value['payment_config'] = unserialize($value['payment_config']);
                        $value['payment_desc'] = $value['payment_name'];
                        if(!empty($value['payment_config'])){
                            $value['payment_desc'] = $value['payment_config']['bankname'] . ' ' . $value['payment_config']['banksn'];
                        }
                    }
                    unset($value);
                }
                $order_info['payment_list'] = $payment_list;

                $result['state'] = 1;
                $result['order_info'] = $order_info;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

	/**
	 * h5端--订单创建
	 */
	public function create()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $fromcart = intval(input('get.fromcart'));
        $goods_id = intval(input('get.goods_id'));
        $goods_num = intval(input('get.goods_num'));
        $option_name = input('get.option_name');
        $goods = input('get.goods');
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $isbuy = true;
            $buy_logic = model('buy','logic');
            $logic_buy_1 = model('buy_1','logic');
            if(empty($fromcart)){
                //商品信息[得到最新商品属性及促销信息]
                $goods_info = $logic_buy_1->getGoodsOnlineInfo($goods_id, $goods_num,array(),$memberid);
                if (empty($goods_info)) {
                    $result['msg'] = 'producto agotado o no existe';
                    $isbuy = false;
                }
                if($isbuy){
                    //进一步处理数组
                    $store_cart_list = array();
                    $goods_list = array();
                    $goods_info['chain_id'] = 0;
                    $goods_info['option_name'] = $option_name;
                    $goods_list[0] = $store_cart_list[$goods_info['store_id']][0] = $goods_info;
                }
            }else{
                $cart_model = model('cart');
                //购物车列表
                $cartcondition = array();
                $cartcondition[] = array('goods_selected','=', 1);
                $cartcondition[] = array('buyer_id','=', $memberid);
                $cart_list = $cart_model->getCartList('db', $cartcondition);
                //购物车列表 [得到最新商品属性及促销信息]
                $cart_list = $logic_buy_1->getGoodsCartList($cart_list);
                //商品列表 [优惠套装子商品与普通商品同级罗列]
                $goods_list = $buy_logic->_getGoodsList($cart_list);
                //以店铺下标归类
                $store_cart_list = $buy_logic->_getStoreCartList($cart_list);
            }
            //定义返回数组
            $list = array();
            if($isbuy){
                //得到页面所需要数据：收货地址、发票、代金券、预存款、商品列表等信息
                //商品金额计算(分别对每个商品/优惠套装小计、每个店铺小计)
                list($store_cart_list, $store_goods_total, $store_goods_original_total, $store_goods_discount_total) = $logic_buy_1->calcCartList($store_cart_list);
                $new_store_goods_list = array();
                $goods_totalprice = 0;//商品总价
                $all_totalprice = 0;//订单总价格
                $goods_discount_totalprice = 0;//优惠金额
                if(!empty($store_cart_list)){
                    foreach ($store_cart_list as $key => $value) {
                        $new_store_goods_list[] = array('store_id' => $key, 'store_name' => $store_cart_list[$key][0]['store_name'], 'goods_list' => $store_cart_list[$key]);

                        $goods_original_totalprice = 0;
                        foreach ($value as &$row) {
                            $goods_original_totalprice += ds_price_format($row['goods_original_price'] * $row['goods_num']);
                            $goods_totalprice += ds_price_format($row['goods_price'] * $row['goods_num']);
                            $goods_discount_totalprice += $goods_original_totalprice - $goods_totalprice;
                        }
                        $all_totalprice += $goods_totalprice;
                    }
                }
                $list['new_store_goods_list'] = $new_store_goods_list;
                // $list['store_cart_list'] = $store_cart_list;
                $list['goods_totalprice'] = ds_price_format($goods_totalprice);
                $list['all_totalprice'] = ds_price_format($all_totalprice);
                $list['goods_discount_totalprice'] = ds_price_format($goods_discount_totalprice);
                //取得店铺优惠 - 满即送(赠品列表，店铺满送规则列表)
                list($store_premiums_list, $store_mansong_rule_list) = $logic_buy_1->getMansongruleCartListByTotal($store_goods_total);
                $list['store_premiums_list'] = $store_premiums_list;
                $list['store_mansong_rule_list'] = $store_mansong_rule_list;
                //重新计算优惠后(满即送)的店铺实际商品总金额
                $store_goods_total = $logic_buy_1->reCalcGoodsTotal($store_goods_total, $store_mansong_rule_list, 'mansong');
                //返回店铺可用的代金券
                $store_voucher_list = $logic_buy_1->getStoreAvailableVoucherList($store_goods_total, $memberid);
                $list['store_voucher_list'] = $store_voucher_list;
                //返回需要计算运费的店铺ID数组 和 不需要计算运费(满免运费活动的)店铺ID及描述
                list($need_calc_sid_list, $cancel_calc_sid_list) = $logic_buy_1->getStoreFreightDescList($store_goods_total);
                $list['need_calc_sid_list'] = $need_calc_sid_list;
                $list['cancel_calc_sid_list'] = $cancel_calc_sid_list;
                //将商品ID、数量、售卖区域、运费序列化，加密，输出到模板，选择地区AJAX计算运费时作为参数使用
                $freight_list = $logic_buy_1->getStoreFreightList($goods_list, array_keys($cancel_calc_sid_list));
                $list['freight_list'] = $buy_logic->buyEncrypt($freight_list, $memberid);
                //输出用户默认收货地址
                $list['address_info'] = model('address')->getDefaultAddressInfo(array('member_id' => $memberid));
                //输出有货到付款时，在线支付和货到付款及每种支付下商品数量和详细列表
                $pay_goods_list = $logic_buy_1->getOfflineGoodsPay($goods_list);
                if (!empty($pay_goods_list['offline'])) {
                    $list['pay_goods_list'] = $pay_goods_list;
                    $list['ifshow_offpay'] = true;
                }
                else {
                    //如果所购商品只支持线上支付，支付方式不允许修改
                    $list['deny_edit_payment'] = true;
                    $list['pay_goods_list'] = $pay_goods_list;
                    $list['ifshow_offpay'] = false;
                }
                //发票 :只有所有商品都支持增值税发票才提供增值税发票
                $vat_deny=false;
                foreach ($goods_list as $goods) {
                    if (!intval($goods['goods_vat'])) {
                        $vat_deny = true;
                        break;
                    }
                }
                //不提供增值税发票时抛出true(模板使用)
                $list['vat_deny'] = $vat_deny;
                $list['vat_hash'] = $buy_logic->buyEncrypt($list['vat_deny'] ? 'deny_vat' : 'allow_vat', $memberid);
                //输出默认使用的发票信息
                $inv_info = model('invoice')->getDefaultInvoiceInfo(array('member_id' => $memberid));
                if ($inv_info['invoice_state'] == '2' && !$vat_deny) {
                    $inv_info['content'] = '增值税发票 ' . $inv_info['invoice_company'] . ' ' . $inv_info['invoice_company_code'] . ' ' . $inv_info['invoice_reg_addr'];
                }
                elseif ($inv_info['invoice_state'] == '2' && $vat_deny) {
                    $inv_info = array();
                    $inv_info['content'] = '不需要发票';
                }
                elseif (!empty($inv_info)) {
                    $inv_info['content'] = '普通发票 ' . $inv_info['invoice_title'] . ' ' . $inv_info['invoice_code']. ' ' . $inv_info['invoice_content'];
                }
                else {
                    $inv_info = array();
                    $inv_info['content'] = '不需要发票';
                }
                $list['inv_info'] = $inv_info;

                $buyer_info = model('member')->getMemberInfoByID($memberid);
                if (floatval($buyer_info['available_predeposit']) > 0) {
                    $list['available_predeposit'] = $buyer_info['available_predeposit'];
                }
                if (floatval($buyer_info['available_rc_balance']) > 0) {
                    $list['available_rc_balance'] = $buyer_info['available_rc_balance'];
                }
                $list['member_paypwd'] = $buyer_info['member_paypwd'] ? true : false;
                $payment_model = model('payment');
                //获取数据库中已安装的支付方式
                $payment_list = $payment_model->getPaymentList(array(array('payment_code', '<>', ' '), array('payment_platform', '=', 'pc'), array('payment_state', '=', '1')));
                if(!empty($payment_list)){
                    foreach ($payment_list as &$value) {
                        $value['payment_config'] = unserialize($value['payment_config']);
                        $value['payment_desc'] = $value['payment_name'];
                        if(!empty($value['payment_config'])){
                            $value['payment_desc'] = $value['payment_config']['bankname'] . ' ' . $value['payment_config']['banksn'];
                        }
                    }
                    unset($value);
                }
                $list['payment_list'] = $payment_list;
                $result['state'] = 1;
            }
            $result['list'] = $list;   
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

    /**
     * h5端--订单提交
     */
    public function submit()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $address_id = intval(input('get.address_id'));
        $fromcart = intval(input('get.fromcart'));
        $goods_id = intval(input('get.goods_id'));
        $goods_num = intval(input('get.goods_num'));
        $option_name = input('get.option_name');
        $paytype = input('get.paytype');
        $remark = trim(input('get.remark'));
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $isbuy = true;
            $order_model = model('order');
            $order_data = array();
            $cart_ids_list = array();
            //获取用户账号信息
            $map[] = array('member_id','=',$memberid);
            $member_info = model('member')->getMemberInfo($map);
            //验证收货地址
            if ($address_id <= 0) {
                $result['msg'] = 'Seleccione la dirección de entrega';
                $isbuy = false;
            }
            else {
                $input_address_info = model('address')->getAddressInfo(array('address_id' => $address_id));
                if ($input_address_info['member_id'] != $memberid) {
                    $result['msg'] = 'Seleccione la dirección de entrega';
                    $isbuy = false;
                }
            }
            if (empty($paytype)) {
                $result['msg'] = 'forma de pago incorrecta, favor selecconar nuevamente';
                $isbuy = false;
            }
            //验证代金券
            $input_voucher_list = array();
            // if (!empty($post['voucher']) && is_array($post['voucher'])) {
            //     foreach ($post['voucher'] as $store_id => $voucher) {
            //         if (preg_match_all('/^(\d+)\|(\d+)\|([\d.]+)$/', $voucher, $matchs)) {
            //             if (floatval($matchs[3][0]) > 0) {
            //                 $input_voucher_list[$store_id]['vouchertemplate_id'] = $matchs[1][0];
            //                 $input_voucher_list[$store_id]['voucher_price'] = $matchs[3][0];
            //             }
            //         }
            //     }
            // }
            $buy_logic = model('buy','logic');
            $logic_buy_1 = model('buy_1','logic');
            if(empty($fromcart)){
                //额外数据用来处理拼团等其他活动
                // $pintuan_id = isset($post['pintuan_id']) ? intval($post['pintuan_id']):0;
                $extra = array();
                // if ($pintuan_id > 0) {
                //     $extra['pintuan_id'] = $pintuan_id; #拼团ID
                //     #是否为开团订单
                //     $extra['pintuangroup_id'] = empty(input('param.pintuangroup_id'))?0:intval(input('param.pintuangroup_id'));
                // }
                $bargainorder_id = 0;
                // if ($bargainorder_id > 0) {
                //     $extra['bargainorder_id'] = $bargainorder_id; #砍价ID
                // }
                
                //商品信息[得到最新商品属性及促销信息]
                model('goods')->lock=true;
                $goods_info = $logic_buy_1->getGoodsOnlineInfo($goods_id, $goods_num,$extra,$memberid);
                if (empty($goods_info)) {
                    $result['msg'] = 'producto agotado o no existe';
                    $isbuy = false;
                }
                if($isbuy){
                    //进一步处理数组
                    $store_cart_list = array();
                    $goods_list = array();
                    $goods_info['chain_id'] = 0;
                    $goods_info['option_name'] = $option_name;
                    $goods_list[0] = $store_cart_list[$goods_info['store_id']][0] = $goods_info;
                }
            }else{
                $cart_model = model('cart');
                //购物车列表
                $cartcondition = array();
                $cartcondition[] = array('goods_selected','=', 1);
                $cartcondition[] = array('buyer_id','=', $memberid);
                $cart_list = $cart_model->getCartList('db', $cartcondition);
                //购物车列表 [得到最新商品属性及促销信息]
                $cart_list = $logic_buy_1->getGoodsCartList($cart_list);
                //商品列表 [优惠套装子商品与普通商品同级罗列]
                $goods_list = $buy_logic->_getGoodsList($cart_list);
                //以店铺下标归类
                $store_cart_list = $buy_logic->_getStoreCartList($cart_list);
                foreach ($cart_list as &$cart_info) {
                    if($cart_info['goods_selected']>0){
                        $cart_ids_list[] = $cart_info['cart_id'];
                    }
                }
            }
            if($isbuy){
                //商品金额计算(分别对每个商品/优惠套装小计、每个店铺小计)
                list($store_cart_list, $store_goods_total, $store_goods_original_total, $store_goods_discount_total) = $logic_buy_1->calcCartList($store_cart_list);
                
                //取得店铺优惠 - 满即送(赠品列表，店铺满送规则列表)
                list($store_premiums_list, $store_mansong_rule_list) = $logic_buy_1->getMansongruleCartListByTotal($store_goods_total);
                
                //重新计算店铺扣除满即送后商品实际支付金额
                $store_final_goods_total = $logic_buy_1->reCalcGoodsTotal($store_goods_total, $store_mansong_rule_list, 'mansong');

                //得到有效的代金券
                $input_voucher_list = $logic_buy_1->reParseVoucherList($input_voucher_list, $store_goods_total, $memberid);

                //重新计算店铺扣除优惠券送商品实际支付金额
                $store_final_goods_total = $logic_buy_1->reCalcGoodsTotal($store_final_goods_total, $input_voucher_list, 'voucher');

                //计算每个店铺(所有店铺级优惠活动)总共优惠多少
                $store_promotion_total = $logic_buy_1->getStorePromotionTotal($store_goods_total, $store_final_goods_total);

                //计算每个店铺运费
                list($need_calc_sid_list, $cancel_calc_sid_list) = $logic_buy_1->getStoreFreightDescList($store_final_goods_total);

                $freight_list = $logic_buy_1->getStoreFreightList($goods_list, array_keys($cancel_calc_sid_list));
                // $store_freight_total = $logic_buy_1->calcStoreFreight($freight_list, $input_city_id);
                $store_freight_total = $logic_buy_1->calcStoreFreight($freight_list);
                
                //计算店铺最终订单实际支付金额(加上运费)
                $store_final_order_total = $logic_buy_1->reCalcGoodsTotal($store_final_goods_total, $store_freight_total, 'freight');

                //计算店铺分类佣金[改由任务计划]
                $store_gc_id_commis_rate_list = model('storebindclass')->getStoreGcidCommisRateList($goods_list);

                //将赠品追加到购买列表(如果库存0，则不送赠品)
                $append_premiums_to_cart_list = $logic_buy_1->appendPremiumsToCartList($store_cart_list, $store_premiums_list, $store_mansong_rule_list, $memberid);
                if ($append_premiums_to_cart_list === false) {
                    $result['msg'] = 'disculpa, producto comprado no tiene en existencia, favor comprar nuevamente';
                    $isbuy = false;
                }
                else {
                    list($store_cart_list, $goods_buy_quantity, $store_mansong_rule_list) = $append_premiums_to_cart_list;
                } 
            }
            if($isbuy){
                // $new_store_goods_list = array();
                // $goods_totalprice = 0;//商品总价
                // $all_totalprice = 0;//订单总价格
                // $goods_discount_totalprice = 0;//优惠金额
                // if(!empty($store_cart_list)){
                //     foreach ($store_cart_list as $key => $value) {
                //         $new_store_goods_list[] = array('store_id' => $key, 'store_name' => $store_cart_list[$key][0]['store_name'], 'goods_list' => $store_cart_list[$key]);

                //         $goods_original_totalprice = 0;
                //         foreach ($value as &$row) {
                //             $goods_original_totalprice += ds_price_format($row['goods_original_price'] * $row['goods_num']);
                //             $goods_totalprice += ds_price_format($row['goods_price'] * $row['goods_num']);
                //             $goods_discount_totalprice += $goods_original_totalprice - $goods_totalprice;
                //         }
                //         $all_totalprice += $goods_totalprice;
                //     }
                // }
                $order_data['member_info'] = $member_info;
                $order_data['input_pay_name'] = $paytype;
                $order_data['input_address_info'] = $input_address_info;
                $order_data['input_voucher_list'] = $input_voucher_list;
                $order_data['order_from'] = 2;
                $order_data['goods_list'] = $goods_list;
                $order_data['store_cart_list'] = $store_cart_list;
                $order_data['store_goods_total'] = $store_goods_total;
                $order_data['store_final_order_total'] = $store_final_order_total;
                $order_data['store_freight_total'] = $store_freight_total;
                $order_data['store_promotion_total'] = $store_promotion_total;
                $order_data['store_gc_id_commis_rate_list'] = $store_gc_id_commis_rate_list;
                $order_data['store_mansong_rule_list'] = $store_mansong_rule_list;
                $order_data['goods_buy_quantity'] = $goods_buy_quantity;
                $order_data['cart_ids_list'] = $cart_ids_list;
                //存储生成的订单数据
                $order_list = array();
                //存储通知信息
                $notice_list = array();

                $pay_sn = makePaySn($memberid);
                $order_pay = array();
                $order_pay['pay_sn'] = $pay_sn;
                $order_pay['buyer_id'] = $memberid;
                $order_pay_id = $order_model->addOrderpay($order_pay);
                // if (!$order_pay_id) {
                //     $result['msg'] = '订单保存失败[未生成支付单]';
                //     $isbuy = false;
                // }
                //收货人信息
                list($reciver_info, $reciver_name) = $logic_buy_1->getReciverAddr($input_address_info);

                foreach ($store_cart_list as $store_id => $goods_list) {

                    //取得本店优惠额度(后面用来计算每件商品实际支付金额，结算需要)
                    $promotion_total = !empty($store_promotion_total[$store_id]) ? $store_promotion_total[$store_id] : 0;
                    //本店总的优惠比例,保留3位小数
                    $should_goods_total = $store_final_order_total[$store_id] - $store_freight_total[$store_id] + $promotion_total;
                    $promotion_rate = abs(number_format($promotion_total / $should_goods_total, 5, '.', ''));
                    if ($promotion_rate <= 1) {
                        $promotion_rate = floatval(substr($promotion_rate, 0, 5));
                    }
                    else {
                        $promotion_rate = 0;
                    }

                    //每种商品的优惠金额累加保存入 $promotion_sum
                    $promotion_sum = 0;

                    $order = array();
                    $order_common = array();
                    $order_goods = array();

                    $order['order_sn'] = $logic_buy_1->makeOrderSn($order_pay_id);
                    $order['pay_sn'] = $pay_sn;
                    $order['store_id'] = $store_id;
                    $order['store_name'] = $goods_list[0]['store_name'];
                    $order['buyer_id'] = $memberid;
                    $order['buyer_name'] = $member_info['member_name'];
                    $order['buyer_email'] = $member_info['member_email'];
                    $order['add_time'] = TIMESTAMP;
                    // $order['payment_code'] = $store_pay_type_list[$store_id];
                    // $order['order_state'] = $store_pay_type_list[$store_id] == 'online' ? ORDER_STATE_NEW : ORDER_STATE_PAY;
                    $order['payment_code'] = $paytype;
                    $order['order_state'] = $paytype == 'offline' ? ORDER_STATE_PAY : ORDER_STATE_NEW;
                    $order['order_amount'] = $store_final_order_total[$store_id];
                    $order['shipping_fee'] = $store_freight_total[$store_id];
                    $order['goods_amount'] = $order['order_amount'] - $order['shipping_fee'];
                    $order['order_from'] = 2;
                    //如果支持方式为空时，默认为货到付款 
                    // if ($order['payment_code'] == "") {
                    //     $order['payment_code'] = "offline";
                    // }
                    // if($order['payment_code'] == "offline" && $input_address_info['chain_id']){
                    //     throw new \think\Exception('代收点不可以使用货到付款[未生成订单数据]', 10006);
                    // }
                    //订单保存
                    $order_id = $order_model->addOrder($order);
                    // if (!$order_id) {
                    //     $result['msg'] = '订单保存失败[未生成订单数据]';
                    //     $isbuy = false;
                    // }
                    $order['order_id'] = $order_id;
                    $order_list[$order_id] = $order;

                    $order_common['order_id'] = $order_id;
                    $order_common['store_id'] = $store_id;
                    $order_common['order_message'] = $remark;

                    //代金券
                    if (isset($input_voucher_list[$store_id])) {
                        $order_common['voucher_price'] = $input_voucher_list[$store_id]['voucher_price'];
                        $order_common['voucher_code'] = $input_voucher_list[$store_id]['voucher_code'];
                    }

                    $order_common['reciver_info'] = $reciver_info;
                    $order_common['reciver_name'] = $reciver_name;
                    // $order_common['reciver_city_id'] = $input_city_id;

                    //发票信息
                    // $order_common['invoice_info'] = $logic_buy_1->createInvoiceData($input_invoice_info);

                    //保存促销信息
                    if (isset($store_mansong_rule_list[$store_id])) {
                        $order_common['promotion_info'] = addslashes($store_mansong_rule_list[$store_id]['desc']);
                    }

                    $order_id = $order_model->addOrdercommon($order_common);
                    // if (!$order_id) {
                    //     $result['msg'] = '订单保存失败[未生成订单扩展数据]';
                    //     $isbuy = false;
                    // }
                    $order_list[$order_id]['order_common']=$order_common;
                    //生成order_goods订单商品数据
                    $i = 0;
                    foreach ($goods_list as $goods_info) {
                        // if (!$goods_info['state'] || !$goods_info['storage_state']) {
                        //     $result['msg'] = '部分商品已经下架或库存不足，请重新选择';
                        //     $isbuy = false;
                        // }
                        if (!intval($goods_info['bl_id'])) {
                            //如果不是优惠套装
                            $order_goods[$i]['chain_id'] = $goods_info['chain_id'];
                            $order_goods[$i]['order_id'] = $order_id;
                            $order_goods[$i]['goods_id'] = $goods_info['goods_id'];
                            $order_goods[$i]['store_id'] = $store_id;
                            $order_goods[$i]['goods_name'] = $goods_info['goods_name'];
                            $order_goods[$i]['option_name'] = $goods_info['option_name'];
                            $order_goods[$i]['goods_price'] = $goods_info['goods_price'];
                            $order_goods[$i]['goods_num'] = $goods_info['goods_num'];
                            $order_goods[$i]['goods_image'] = $goods_info['goods_image'];
                            $order_goods[$i]['buyer_id'] = $memberid;
                            $ifgroupbuy = false;
                            if (isset($goods_info['ifgroupbuy'])) {
                                $ifgroupbuy = true;
                                $order_goods[$i]['goods_type'] = 2;
                            }
                            elseif (isset($goods_info['ifxianshi'])) {
                                $order_goods[$i]['goods_type'] = 3;
                            }
                            elseif (isset($goods_info['ifwholesale'])) {
                                $order_goods[$i]['goods_type'] = 9;
                            }
                            elseif (isset($goods_info['ifzengpin'])) {
                                $order_goods[$i]['goods_type'] = 5;
                            }
                            // elseif (isset($goods_info['ifpintuan']) && intval($this->_post_data['pintuan_id'])>0) {
                                //拼团订单
                                /**
                                 * $goods_info['ifpintuan'] , $goods_info['pintuan_id']  此数据是通过商品ID 获取到是否为拼团订单
                                 * $this->_post_data['pintuan_id']   $this->_post_data['pintuangroup_id'] 此数据是通过post 过来的数据，用来判断是否为首个拼团订单:0首个订单 其他为所属订单
                                 */
                            //     $order_goods[$i]['goods_type'] = 6;
                            //     $res=$logic_buy_1->updatePintuan($this->_post_data,$goods_info,$order,0,$memberid);
                            //     $goods_info['promotions_id'] = $res['pintuangroup_id'];
                            // }
                            elseif(isset($goods_info['ifbargain']) && $goods_info['ifbargain']){
                                //砍价订单
                                $order_goods[$i]['goods_type'] = 8;
                                // if(!model('pbargainorder')->editPbargainorder(array('bargainorder_id'=>$goods_info['promotions_id']),array('order_id'=>$order_id))){
                                //     $result['msg'] = '砍价活动更新失败';
                                //     $isbuy = false;
                                // }
                            }
                            elseif (isset($goods_info['ifmgdiscount'])) {
                                $order_goods[$i]['goods_type'] = 7;
                            }
                            else {
                                $order_goods[$i]['goods_type'] = 1;
                            }
                            $order_goods[$i]['promotions_id'] = isset($goods_info['promotions_id']) ? $goods_info['promotions_id'] : 0;

                            $order_goods[$i]['commis_rate'] = floatval(@$store_gc_id_commis_rate_list[$store_id][$goods_info['gc_id']]);

                            $order_goods[$i]['gc_id'] = $goods_info['gc_id'];
                            //计算商品金额
                            $goods_total = $goods_info['goods_price'] * $goods_info['goods_num'];
                            //计算本件商品优惠金额
                            $promotion_value = floor($goods_total * ($promotion_rate));
                            $order_goods[$i]['goods_pay_price'] = $goods_total - $promotion_value;
                            $promotion_sum += $promotion_value;
                            $i++;

                            //存储库存报警数据
                            // if (isset($goods_info['goods_storage_alarm'])&&$goods_info['goods_storage_alarm'] >= ($goods_info['goods_storage'] - $goods_info['goods_num'])) {
                            //     $param = array();
                            //     $param['common_id'] = $goods_info['goods_commonid'];
                            //     $param['sku_id'] = $goods_info['goods_id'];
                            //     $weixin_param=array(
                            //         'url' => config('ds_config.h5_site_url').'/seller/goods_form_2?commonid='.$goods_info['goods_commonid'].'&class_id='.$goods_info['gc_id'],
                            //         'data'=>array(
                            //             "keyword1" => array(
                            //                 "value" => $goods_info['goods_storage'] - $goods_info['goods_num'],
                            //                 "color" => "#333"
                            //             ),
                            //             "keyword2" => array(
                            //                 "value" => date('Y-m-d H:i'),
                            //                 "color" => "#333"
                            //             )
                            //         ),
                            //     );
                        
                            //     $notice_list['goods_storage_alarm'][$goods_info['store_id']] = array('param'=>$param,'ali_param'=>$param,'weixin_param'=>$weixin_param);
                            // }

                        }
                        elseif (!empty($goods_info['bl_goods_list']) && is_array($goods_info['bl_goods_list'])) {
                            $ifgroupbuy = false;
                            //优惠套装
                            foreach ($goods_info['bl_goods_list'] as $bl_goods_info) {
                                $order_goods[$i]['chain_id'] = $bl_goods_info['chain_id'];
                                $order_goods[$i]['order_id'] = $order_id;
                                $order_goods[$i]['goods_id'] = $bl_goods_info['goods_id'];
                                $order_goods[$i]['store_id'] = $store_id;
                                $order_goods[$i]['goods_name'] = $bl_goods_info['goods_name'];
                                $order_goods[$i]['option_name'] = $bl_goods_info['option_name'];
                                $order_goods[$i]['goods_price'] = $bl_goods_info['blgoods_price'];
                                $order_goods[$i]['goods_num'] = $goods_info['goods_num'];
                                $order_goods[$i]['goods_image'] = $bl_goods_info['goods_image'];
                                $order_goods[$i]['buyer_id'] = $memberid;
                                $order_goods[$i]['goods_type'] = 4;
                                $order_goods[$i]['promotions_id'] = $bl_goods_info['bl_id'];
                                $order_goods[$i]['commis_rate'] = floatval(@$store_gc_id_commis_rate_list[$store_id][$goods_info['gc_id']]);
                                $order_goods[$i]['gc_id'] = $bl_goods_info['gc_id'];

                                //计算商品实际支付金额(goods_price减去分摊优惠金额后的值)
                                $goods_total = $bl_goods_info['blgoods_price'] * $goods_info['goods_num'];
                                //计算本件商品优惠金额
                                $promotion_value = floor($goods_total * ($promotion_rate));
                                $order_goods[$i]['goods_pay_price'] = $goods_total - $promotion_value;
                                $promotion_sum += $promotion_value;
                                $i++;

                                //存储库存报警数据
                                // if ($bl_goods_info['goods_storage_alarm'] >= ($bl_goods_info['goods_storage'] - $goods_info['goods_num'])) {
                                //     $param = array();
                                //     $param['common_id'] = $bl_goods_info['goods_commonid'];
                                //     $param['sku_id'] = $bl_goods_info['goods_id'];
                                //     $weixin_param=array(
                                //         'url' => config('ds_config.h5_site_url').'/seller/goods_form_2?commonid='.$goods_info['goods_commonid'].'&class_id='.$goods_info['gc_id'],
                                //         'data'=>array(
                                //             "keyword1" => array(
                                //                 "value" => $goods_info['goods_storage'] - $goods_info['goods_num'],
                                //                 "color" => "#333"
                                //             ),
                                //             "keyword2" => array(
                                //                 "value" => date('Y-m-d H:i'),
                                //                 "color" => "#333"
                                //             )
                                //         ),
                                //     );
                                //     $notice_list['goods_storage_alarm'][$bl_goods_info['store_id']] = array('param'=>$param,'ali_param'=>$param,'weixin_param'=>$weixin_param);
                                // }
                            }
                        }
                    }

                    //将因舍出小数部分出现的差值补到最后一个商品的实际成交价中(商品goods_price=0时不给补，可能是赠品)
                    if ($promotion_total > $promotion_sum) {
                        $i--;
                        for ($i; $i >= 0; $i--) {
                            if (floatval($order_goods[$i]['goods_price']) > 0) {
                                $order_goods[$i]['goods_pay_price'] -= $promotion_total - $promotion_sum;
                                break;
                            }
                        }
                    }
                    $insert = $order_model->addOrdergoods($order_goods);
                    // if (!$insert) {
                    //     $result['msg'] = '订单保存失败[未生成商品数据]';
                    //     $isbuy = false;
                    // }
                
                    $order_list[$order_id]['order_goods']=$order_goods;
                    //存储商家发货提醒数据
                    // if ($order['order_state'] == ORDER_STATE_PAY) {
                        //更改自提点的订单状态
                        // $chain_order_model->editChainOrderPay($order_id);
                        
                        // $weixin_param=array(
                        //     'url' => config('ds_config.h5_site_url').'/seller/order_detail?order_id='.$order_id,
                        //     'data'=>array(
                        //         "keyword1" => array(
                        //             "value" => $order['order_sn'],
                        //             "color" => "#333"
                        //         ),
                        //         "keyword2" => array(
                        //             "value" => $order_goods[0]['goods_name'].(count($order_goods)>1? sprintf(lang('order_goods_more_than_one'), count($order_goods)):''),
                        //             "color" => "#333"
                        //         ),
                        //         "keyword3" => array(
                        //             "value" => $order['order_amount'],
                        //             "color" => "#333"
                        //         ),
                        //         "keyword4" => array(
                        //             "value" => date('Y-m-d H:i',$order['add_time']),
                        //             "color" => "#333"
                        //         )
                        //     ),
                        // );
                        // $notice_list['new_order'][$order['store_id']] = array('param'=>array('order_sn' => $order['order_sn']),'ali_param'=>array('order_sn' => $order['order_sn']),'weixin_param'=>$weixin_param);
                    // }
                }

                $order_data['pay_sn'] = $pay_sn;
                $order_data['order_list'] = $order_list;
                $order_data['notice_list'] = $notice_list;
                $order_data['ifgroupbuy'] = $ifgroupbuy;
                if($paytype=='predeposit'){
                    $buyer_info = model('member')->getMemberInfoByID($memberid);
                    // if ($buyer_info['member_paypwd'] == '' || $buyer_info['member_paypwd'] != md5($this->_post_data['password']))
                    //     $result['msg'] = '支付密码错误';
                    //     $isbuy = false;

                    //使用预存款支付
                    $logic_buy_1->pdPay(isset($order_list) ? $order_list : $order_data['order_list'], array(), $buyer_info);
                }

                //变更库存和销量
                $res=model('queue','logic')->createOrderUpdateStorage($goods_buy_quantity);
                
                //更新使用的代金券状态
                if (!empty($input_voucher_list) && is_array($input_voucher_list)) {
                    \mall\queue\QueueClient::push('editVoucherState', $input_voucher_list);
                }

                //更新抢购购买人数和数量
                if ($ifgroupbuy) {
                    foreach ($store_cart_list as $goods_list) {
                        foreach ($goods_list as $goods_info) {
                            if (isset($goods_info['ifgroupbuy']) && isset($goods_info['groupbuy_id'])) {
                                $groupbuy_info = array();
                                $groupbuy_info['groupbuy_id'] = $goods_info['groupbuy_id'];
                                $groupbuy_info['quantity'] = $goods_info['goods_num'];
                                \mall\queue\QueueClient::push('editGroupbuySaleCount', $groupbuy_info);
                            }
                        }
                    }
                }

                //删除购物车中的商品
                if($fromcart>0 && !empty($cart_ids_list)){
                    $buy_logic->delCart(true, $memberid, $cart_ids_list);
                }
                
                //保存订单代收信息
                if (config('ds_config.chain_isuse') && intval($input_address_info['chain_id'])) {
                    $data = array();
                    $data['chain_id'] = $input_address_info['chain_id'];
                    foreach ($order_list as $v) {
                        $data['order_sn_list'][$v['order_id']]['store_id'] = $v['store_id'];
                        $data['order_sn_list'][$v['order_id']]['order_sn'] = $v['order_sn'];
                        $data['order_sn_list'][$v['order_id']]['add_time'] = $v['add_time'];
                    }
                    \mall\queue\QueueClient::push('saveChainOrder', $data);
                }
                //生成推广记录
                $buy_logic->addOrderInviter($order_list);
            }
            if($isbuy){
                $result['pay_sn'] = $pay_sn;
                $result['state'] = 1;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--取消订单
     */
    public function cancelOrder()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        $remark = input('get.remark');
        if(empty($order_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            if(empty($remark)){
                $result['msg'] = 'favor seleccionar la causa de la cancelacion del pedido';
            }else{

                $order_model = model('order');
                $logic_order = model('order', 'logic');

                $condition = array();
                $condition[] = array('order_id', '=', $order_id);
                $condition[] = array('buyer_id', '=', $memberid);
                $order_info = $order_model->getOrderInfo($condition);

                $if_allow = $order_model->getOrderOperateState('buyer_cancel', $order_info);
                if (!$if_allow) {
                    $result['msg'] = 'no este permitido esta accion';
                }
                $ret = $logic_order->changeOrderStateCancel($order_info, 'buyer', $order_info['buyer_name'], $remark);
                if($ret){
                    $result['state'] = 1;
                }
            } 
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--删除订单
     */
    public function deleteOrder()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        if(empty($order_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $order_model = model('order');

            $condition = array();
            $condition[] = array('order_id', '=', $order_id);
            $condition[] = array('buyer_id', '=', $memberid);
            $order_info = $order_model->getOrderInfo($condition);

            $logic_order = model('order', 'logic');
            $state_type = str_replace(array('order_delete', 'order_drop', 'order_restore'), array('delete', 'drop', 'restore'), 'order_delete');
            $if_allow = $order_model->getOrderOperateState($state_type, $order_info);
            if (!$if_allow) {
                $result['msg'] = 'no este permitido esta accion';
            }
            $ret = $logic_order->changeOrderStateRecycle($order_info, 'buyer', $state_type);
            if($ret['code']){
                $result['state'] = 1;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--确认收货
     */
    public function finishOrder()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        if(empty($order_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $order_model = model('order');

            $condition = array();
            $condition[] = array('order_id', '=', $order_id);
            $condition[] = array('buyer_id', '=', $memberid);
            $order_info = $order_model->getOrderInfo($condition);

            $logic_order = model('order', 'logic');
            $if_allow = $order_model->getOrderOperateState('receive', $order_info);
            if (!$if_allow) {
                $result['msg'] = 'no este permitido esta accion';
            }
            $ret = $logic_order->changeOrderStateReceive($order_info, 'buyer', $order_info['buyer_name']);
            if($ret['code']){
                $result['state'] = 1;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--确认支付
     */
    public function payOrder()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        $payment_tradeno = trim(input('get.remark'));
        if(empty($order_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            if(empty($payment_tradeno)){
                $result['msg'] = "favor indicar el numero de serie de la transaccion  Bancario";
            }else{
                $order_model = model('order');

                $condition = array();
                $condition[] = array('order_id', '=', $order_id);
                $condition[] = array('buyer_id', '=', $memberid);
                $order_info = $order_model->getOrderInfo($condition);
                if (!$order_info) {
                    $result['msg'] = 'pedido no encontrado';
                }
                //填写银行汇款/转账的“银行流水号”
                $data_order = array();
                $data_order['trade_no'] = $payment_tradeno;
                $ret = $order_model->editOrder($data_order, array('order_id' => $order_id));
                if($ret){
                    $result['state'] = 1;
                }
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--申请退款提交
     */
    public function refundSubmit()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        $pic_info = input('get.pic_info');
        $refund_type = intval(input('get.refund_type'));
        $buyer_message = trim(input('get.buyer_message'));
        if(empty($order_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            if(empty($buyer_message)){
                $result['msg'] = "favor indicar descripcion del reembolso";
            }else{
                $isform = true;
                $refundreturn_model = model('refundreturn');

                $condition = array();
                $condition[] = array('buyer_id', '=', $memberid);
                $condition[] = array('order_id', '=', $order_id);

                $order = $refundreturn_model->getRightOrderList($condition, 0);
                $order_id = $order['order_id'];
                $order_amount = $order['order_amount']; //订单金额
                $refund_amount = $order_amount; //订单退款金额
                $goods_list = $order['goods_list'];
                foreach ($goods_list as &$value) {
                    $goods_num += $value['goods_num'];
                }
                unset($value);
                if ($goods_num < 0) {
                    $goods_num = 1;
                }
                
                $refcondition = array();
                $refcondition[] = array('buyer_id', '=', $order['buyer_id']);
                $refcondition[] = array('order_id', '=', $order['order_id']);
                $refcondition[] = array('refund_state', '<', '3');
                $refund_list = $refundreturn_model->getRefundreturnList($refcondition);
                $refund = array();
                if (!empty($refund_list) && is_array($refund_list)) {
                    $refund = $refund_list[0];
                }
                $refund_state = $refundreturn_model->getRefundState($order); //根据订单状态判断是否可以退款退货

                if ((isset($refund['refund_id']) && $refund['refund_id'] > 0) || $refund_state != 1) {//检查订单状态,防止页面刷新不及时造成数据错误
                    $result['msg'] = 'Error de parámetro';
                    $isform = false;
                }

                if($isform){
                    $refund_array = array();
                    $refund_array['reason_id'] = 0;
                    $refund_array['reason_info'] = 'cancelacion pedido, reembolso total';
                    if(!empty($pic_info) && is_array($pic_info)){
                        $info = serialize($pic_info);
                        $refund_array['pic_info'] = $info;
                    }

                    $trade_model = model('trade');
                    $order_shipped = $trade_model->getOrderState('order_shipped'); //订单状态30:已发货
                    if ($order['order_state'] == $order_shipped) {
                        $refund_array['order_lock'] = '2'; //锁定类型:1为不用锁定,2为需要锁定
                    } else {
                        $refund_array['order_lock'] = '1';
                    }

                    $refund_array['refund_type'] = $refund_type; //类型:1为退款,2为退货
                    $refund_array['return_type'] = '1'; //退货类型:1为不用退货,2为需要退货
                    if ($refund_array['refund_type'] != '2') {
                        $refund_array['refund_type'] = '1';
                        $refund_array['return_type'] = '1';
                    }
                    $refund_array['seller_state'] = '1'; //状态:1为待审核,2为同意,3为不同意
                    $refund_array['refund_amount'] = ds_price_format($refund_amount);
                    $refund_array['goods_num'] = $goods_num;
                    $refund_array['buyer_message'] = $buyer_message;
                    $refund_array['add_time'] = TIMESTAMP;
                    $state = $refundreturn_model->addRefundreturn($refund_array, $order, array());
                    if ($state) {
                        if ($order['order_state'] == $order_shipped) {
                            $refundreturn_model->editOrderLock($order_id);
                        }
                        $result['state'] = 1;
                    } else {
                        $result['msg'] = 'fallo de envio';
                    }
                }
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--订单评价
     */
    public function commentSubmit()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $order_id = intval(input('get.order_id'));
        $geval_scores = input('get.scores');
        $content = trim(input('get.content'));
        if(empty($order_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            if(empty($content)){
                $result['msg'] = "favor ingresar contenido de la evaluacion";
            }else{
                //如果未评分，默认为5分
                if ($geval_scores <= 0 || $geval_scores > 5) {
                    $geval_scores = 5;
                }
                $return = model('memberevaluate', 'logic')->validation($order_id, $memberid);
                if (isset($return['state'])) {
                    $result['msg'] = $return['msg'];
                }else{
                    extract($return['data']);

                    $evaluate_goods_array = array();
                    $goodsid_array = array();
        
                    foreach ($order_goods as &$value) {

                        $evaluate_goods_info = array();
                        $evaluate_goods_info['geval_orderid'] = $order_info['order_id'];
                        $evaluate_goods_info['geval_orderno'] = $order_info['order_sn'];
                        $evaluate_goods_info['geval_ordergoodsid'] = $value['rec_id'];
                        $evaluate_goods_info['geval_goodsid'] = $value['goods_id'];
                        $evaluate_goods_info['geval_goodsname'] = $value['goods_name'];
                        $evaluate_goods_info['geval_goodsprice'] = $value['goods_price'];
                        $evaluate_goods_info['geval_goodsimage'] = $value['goods_image'];
                        $evaluate_goods_info['geval_scores'] = $geval_scores;
                        $evaluate_goods_info['geval_content'] = $content;
                        $evaluate_goods_info['geval_isanonymous'] = 0;
                        $evaluate_goods_info['geval_addtime'] = TIMESTAMP;
                        $evaluate_goods_info['geval_storeid'] = $store_info['store_id'];
                        $evaluate_goods_info['geval_storename'] = $store_info['store_name'];
                        $evaluate_goods_info['geval_frommemberid'] = $memberid;
                        $evaluate_goods_info['geval_frommembername'] = $order_info['buyer_name'];

                        $evaluate_goods_array[] = $evaluate_goods_info;

                        $goodsid_array[] = $value['goods_id'];
                    }

                    model('evaluategoods')->addEvaluategoodsArray($evaluate_goods_array, $goodsid_array);

                    //更新订单信息并记录订单日志
                    $state = model('order')->editOrder(array('evaluation_state' => 1), array('order_id' => $order_info['order_id']));
                    model('order')->editOrdercommon(array('evaluation_time' => TIMESTAMP), array('order_id' => $order_info['order_id']));
                    if ($state) {
                        $data = array();
                        $data['order_id'] = $order_info['order_id'];
                        $data['log_role'] = 'buyer';
                        $data['log_msg'] = 'opinar sobre la trasacccion';
                        model('order')->addOrderlog($data);
                        $res = true;
                    } else {
                        $res = false;
                    }

                    //添加会员积分
                    if (config('ds_config.points_isuse') == 1) {
                        $points_model = model('points');
                        $points_model->savePointslog('comments', array('pl_memberid' => $memberid, 'pl_membername' => $order_info['buyer_name']));
                    }
                    //添加会员经验值
                    model('exppoints')->saveExppointslog('comments', array('explog_memberid' => $memberid, 'explog_membername' => $order_info['buyer_name']));
                    if($res){
                        $result['state'] = 1;
                    }else{
                        $result['msg'] = 'fallo en enviar opinon';
                    }
                }
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }


}


