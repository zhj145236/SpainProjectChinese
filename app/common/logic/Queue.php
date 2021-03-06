<?php

namespace app\common\logic;
use think\facade\Db;
/**
 * ============================================================================
 * 爱购商城
 * ============================================================================
 * 版权所有 2020 爱购商城，并保留所有权利。
 * 网站地址: http://xbyshopp.stablenewpay.com
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * 逻辑层模型
 */
class Queue
{
    public function addConsume($member_info){
        return ds_callback(true);
    }
    /**
     * 添加会员积分
     * @param unknown $member_info
     */
    public function addPoint($member_info)
    {
        $points_model = model('points');
        $points_model->savePointslog('login', array(
            'pl_memberid' => $member_info['member_id'], 'pl_membername' => $member_info['member_name']
        ), true);
        return ds_callback(true);
    }

    /**
     * 添加会员经验值
     * @param unknown $member_info
     */
    public function addExppoint($member_info)
    {
        $exppoints_model = model('exppoints');
        $exppoints_model->saveExppointslog('login', array(
            'explog_memberid' => $member_info['member_id'], 'explog_membername' => $member_info['member_name']
        ), true);
        return ds_callback(true);
    }

    /**
     * 更新抢购信息
     * @param unknown $groupbuy_info
     * @throws Exception
     */
    public function editGroupbuySaleCount($groupbuy_info)
    {
        $groupbuy_model = model('groupbuy');
        $data = array();
        $data['groupbuy_buyer_count'] = Db::raw('groupbuy_buyer_count+1');
        $data['groupbuy_buy_quantity'] = Db::raw('groupbuy_buy_quantity+'.$groupbuy_info['quantity']);
        $update = $groupbuy_model->editGroupbuy($data, array('groupbuy_id' => $groupbuy_info['groupbuy_id']));
        if (!$update) {
            return ds_callback(false, '更新抢购信息失败groupbuy_id:' . $groupbuy_info['groupbuy_id']);
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 更新使用的代金券状态
     * @param $input_voucher_list
     * @throws Exception
     */
    public function editVoucherState($voucher_list)
    {
        $voucher_model = model('voucher');
        $send = new \sendmsg\sendMemberMsg();
        foreach ($voucher_list as $store_id => $voucher_info) {
            $update = $voucher_model->editVoucher(array('voucher_state' => 2), array('voucher_id' => $voucher_info['voucher_id']), $voucher_info['voucher_owner_id']);
            if ($update) {
                $voucher_model->editVouchertemplate(array('vouchertemplate_id' => $voucher_info['vouchertemplate_id']),array('vouchertemplate_used'=>Db::raw('vouchertemplate_used+1')));
                // 发送用户店铺消息
                $send->set('member_id', $voucher_info['voucher_owner_id']);
                $send->set('code', 'voucher_use');
                $ali_param = array();
                $ali_param['voucher_code'] = $voucher_info['voucher_code'];
                $param=$ali_param;
                $param['voucher_url'] = (string)url('Membervoucher/index');
                $weixin_param = array(
                    'url' => config('ds_config.h5_site_url').'/member/voucher_list',
                    'data'=>array(
                        "keyword1" => array(
                            "value" => $voucher_info['voucher_code'],
                            "color" => "#333"
                        ),
                        "keyword2" => array(
                            "value" => date('Y-m-d H:i'),
                            "color" => "#333"
                        )
                    ),
                );
                $send->send($param,$weixin_param,$ali_param);
            }
            else {
                return ds_callback(false, '更新代金券状态失败vcode:' . $voucher_info['voucher_code']);
            }
        }
        return ds_callback(true);
    }

    /**
     * 下单变更库存销量
     * @param unknown $goods_buy_quantity
     */
    public function createOrderUpdateStorage($goods_buy_quantity)
    {
        $goods_model = model('goods');
        foreach ($goods_buy_quantity as $goods_id => $quantity) {
            $data = array();
            $data['goods_storage'] = Db::raw('goods_storage-'.$quantity);
            $data['goods_salenum'] = Db::raw('goods_salenum+'.$quantity);
            $result = $goods_model->editGoodsById($data, $goods_id);
            if(!$result){
                break;
            }
        }
        if (!$result) {
            return ds_callback(false, '变更商品库存与销量失败');
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 取消订单变更库存销量
     * @param unknown $goods_buy_quantity
     */
    public function cancelOrderUpdateStorage($goods_buy_quantity)
    {
        $goods_model = model('goods');
        foreach ($goods_buy_quantity as $goods_id => $quantity) {
            $data = array();
            $data['goods_storage'] = Db::raw('goods_storage+'.$quantity);
            $data['goods_salenum'] = Db::raw('goods_salenum-'.$quantity);
            $result = $goods_model->editGoodsById($data, $goods_id);
            if (!$result) {
                return ds_callback(false, '变更商品库存与销量失败');
            }
        }
            return ds_callback(true);
    }

    /**
     * 更新F码为使用状态
     * @param int $goodsfcode_id
     */
    public function updateGoodsfcode($goodsfcode_id)
    {
        $update = model('goodsfcode')->editGoodsfcode(array('goodsfcode_state' => 1), array('goodsfcode_id' => $goodsfcode_id));
        if (!$update) {
            return ds_callback(false, '更新F码使用状态失败goodsfcode_id:' . $goodsfcode_id);
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 删除购物车
     * @param unknown $cart
     */
    public function delCart($cart)
    {
        if (!is_array($cart['cart_ids']) || empty($cart['buyer_id']))
            return ds_callback(true);
        $condition = array();
        $condition[] = array('buyer_id','=',$cart['buyer_id']);
        $condition[] = array('cart_id','in',$cart['cart_ids']);
        $del = model('cart')->delCart('db', $condition,$cart['buyer_id']);
        if (!$del) {
            return ds_callback(false, '删除购物车数据失败');
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 根据商品id更新促销价格
     *
     * @param int /array $goods_commonid
     * @return boolean
     */
    public function updateGoodsPromotionPriceByGoodsId($goods_id)
    {
        if(!is_array($goods_id)){
            $goods_id=(string)$goods_id;
        }
        $condition = array();
        $condition[] = array('goods_id','in', $goods_id);
        $update = model('goods')->editGoodsPromotionPrice($condition);
        if (!$update) {
            return ds_callback(false, '根据商品ID更新促销价格失败');
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 根据商品公共id更新促销价格
     *
     * @param int /array $goods_commonid
     * @return boolean
     */
    public function updateGoodsPromotionPriceByGoodsCommonId($goods_commonid)
    {
        if(!is_array($goods_commonid)){
            $goods_commonid=(string)$goods_commonid;
        }
        $condition = array();
        $condition[] = array('goods_commonid','in', $goods_commonid);
        $update = model('goods')->editGoodsPromotionPrice($condition);
        if (!$update) {
            return ds_callback(false, '根据商品公共id更新促销价格失败');
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 发送店铺消息
     */
    public function sendStoremsg($param)
    {
        $send = new \sendmsg\sendStoremsg();
        $send->set('code', $param['code']);
        $send->set('store_id', $param['store_id']);
        $send->send($param['param'],isset($param['weixin_param'])?$param['weixin_param']:array(),isset($param['ali_param'])?$param['ali_param']:array());
        return ds_callback(true);
    }

    /**
     * 发送会员消息
     */
    public function sendMemberMsg($param)
    {
        $send = new \sendmsg\sendMemberMsg();
        $send->set('code', $param['code']);
        $send->set('member_id', $param['member_id']);
        if (!empty($param['number']['mobile']))
            $send->set('mobile', $param['number']['mobile']);
        if (!empty($param['number']['email']))
            $send->set('email', $param['number']['email']);
        $send->send($param['param'],isset($param['weixin_param'])?$param['weixin_param']:array(),isset($param['ali_param'])?$param['ali_param']:array());
        return ds_callback(true);
    }

    /**
     * 生成商品F码
     */
    public function createGoodsfcode($param)
    {
        $insert = array();
        for ($i = 0; $i < $param['goodsfcode_count']; $i++) {
            $array = array();
            $array['goods_commonid'] = $param['goods_commonid'];
            $array['goodsfcode_code'] = strtoupper($param['goodsfcode_prefix']) . mt_rand(100000, 999999);
            $insert[$array['goodsfcode_code']] = $array;
        }
        if (!empty($insert)) {
            $insert = array_values($insert);
            $insert = model('goodsfcode')->addGoodsfcodeAll($insert);
            if (!$insert) {
                return ds_callback(false, '生成商品F码失败goods_commonid:' . $param['goods_commonid']);
            }
        }
        return ds_callback(true);
    }


    /**
     * 清理特殊商品促销信息
     */
    public function clearSpecialGoodsPromotion($param)
    {
        // 抢购
        model('groupbuy')->delGroupbuy(array('goods_commonid' => $param['goods_commonid']));
        // 显示折扣
        $condition = array();
        $condition[] = array('goods_id','in', $param['goodsid_array']);
        model('pxianshigoods')->delXianshigoods($condition);
        // 优惠套装
        $condition = array();
        $condition[] = array('goods_id','in', $param['goodsid_array']);
        model('pbundling')->delBundlingGoods($condition);
        // 更新促销价格
        model('goods')->editGoods(array('goods_promotion_price' => Db::raw('goods_price'),'goods_promotion_type' => 0), array('goods_commonid' => $param['goods_commonid']));
        return ds_callback(true);
    }

    /**
     * 删除(买/卖家)订单全部数量缓存
     * @param array $data 订单信息
     * @return boolean
     */
    public function delOrderCountCache($order_info)
    {
        if (empty($order_info))
            return ds_callback(true);
        $order_model = model('order');
        if (isset($order_info['order_id'])) {
            $order_info = $order_model->getOrderInfo(array('order_id' => $order_info['order_id']), array(), 'buyer_id,store_id');
        }
        if(isset($order_info['buyer_id'])) {
            $order_model->delOrderCountCache('buyer', $order_info['buyer_id']);
        }
        if (isset($order_info['store_id'])) {
            $order_model->delOrderCountCache('store', $order_info['store_id']);
        }
        return ds_callback(true);
    }

    /**
     * 发送兑换码
     * @param unknown $param
     * @return boolean
     */
    public function sendVrCode($param)
    {
        if (empty($param) && !is_array($param))
            return ds_callback(true);
        $condition = array();
        $condition[] = array('order_id','=',$param['order_id']);
        $condition[] = array('buyer_id','=',$param['buyer_id']);
        $condition[] = array('vr_state','=',0);
        $condition[] = array('refund_lock','=',0);
        $code_list = model('vrorder')->getShowVrordercodeList($condition, 'vr_code,vr_indate');
        if (empty($code_list))
            return ds_callback(true);

        $content = '';
        foreach ($code_list as $v) {
            $content .= $v['vr_code'] . ',';
        }

        $tpl_info = model('mailtemplates')->getTplInfo(array('mailmt_code' => 'send_vr_code'));
        $data = array();
        $data['vr_code'] = rtrim($content, ',');
        $message = ds_replace_text($tpl_info['mailmt_content'], $data);
        $smslog_param=array(
                    'ali_template_code'=>$tpl_info['ali_template_code'],
                    'ali_template_param'=>$data,
                    'ten_template_code'=>$tpl_info['ten_template_code'],
                    'ten_template_param'=>$data,
                    'message'=>$message,
                );
        $result = model('smslog')->sendSms($param["buyer_phone"], $smslog_param);
        if (!$result) {
            return ds_callback(false, '兑换码发送失败order_id:' . $param['order_id']);
        }
        else {
            return ds_callback(true);
        }
    }

    /**
     * 添加订单代收表内容
     */
    public function saveChainOrder($param)
    {
        if (!is_array($param['order_sn_list']))
            return ds_callback(true);
        $data = array();
        $chain_order_model = model('chain_order');
        foreach ($param['order_sn_list'] as $order_id => $v) {
            $data['order_id'] = $order_id;
            $data['order_sn'] = $v['order_sn'];
            $data['chain_order_add_time'] = $v['add_time'];
            $data['chain_id'] = $param['chain_id'];
            $data['chain_order_type'] = 1;
            $data['store_id'] = $v['store_id'];
            $insert = $chain_order_model->addChainOrder($data);
            if (!$insert) {
                return ds_callback(false, '保存代收订单信息失败order_sn:' . $v['order_sn']);
            }
        }
        return ds_callback(true);
    }


    /**
     * 发送提货码短信消息
     */
    public function sendPickupcode($param)
    {
        $order_common_info = model('order')->getOrdercommonInfo(array('order_id' => $param['order_id']),'reciver_info');
        if($order_common_info){
            $order_common_info['reciver_info'] = @unserialize($order_common_info['reciver_info']);
            $tpl_info = model('mailtemplates')->getTplInfo(array('mailmt_code' => 'send_pickup_code'));
            $data = array();
            $data['pickup_code'] = $param['pickup_code'];
            $message = ds_replace_text($tpl_info['mailmt_content'], $data);
            $smslog_param=array(
                        'ali_template_code'=>$tpl_info['ali_template_code'],
                        'ali_template_param'=>$data,
                        'ten_template_code'=>$tpl_info['ten_template_code'],
                        'ten_template_param'=>$data,
                        'message'=>$message,
                    );
            $result = model('smslog')->sendSms($order_common_info['reciver_info']['mob_phone'], $smslog_param);
            if (!$result) {
                return ds_callback(false, '发送提货码短信消息失败order_id:' . $param['order_id']);
            }
            else {
                return ds_callback(true);
            }
        }else{
            return ds_callback(false, '发送提货码短信消息失败order_id:' . $param['order_id']);
        }
    }



    /**
     * 生成卡密代金券
     */
    public function build_pwdvoucher($t_id)
    {
        $t_id = intval($t_id);
        if ($t_id <= 0) {
            return ds_callback(false, '参数错误');
        }
        $voucher_model = model('voucher');
        //查询代金券详情
        $where = array();
        $where[] = array('vouchertemplate_id','=',$t_id);
        $gettype_arr = $voucher_model->getVoucherGettypeArray();
        $where[] = array('vouchertemplate_gettype','=',$gettype_arr['pwd']['sign']);
        $where[] = array('vouchertemplate_isbuild','=',0);
        $where[] = array('vouchertemplate_state','=',1);
        $t_info = $voucher_model->getVouchertemplateInfo($where);
        $t_total = intval($t_info['vouchertemplate_total']);
        if ($t_total <= 0) {
            return ds_callback(false, '代金券模板信息错误');
        }
        while ($t_total > 0) {
            $is_succ = false;
            $insert_arr = array();
            $step = $t_total > 1000 ? 1000 : $t_total;
            for ($t = 0; $t < $step; $t++) {
                $voucher_code = $voucher_model->getVoucherCode(0);
                if (!$voucher_code) {
                    continue;
                }
                $voucher_pwd_arr = $voucher_model->createVoucherPwd($t_info['vouchertemplate_id']);
                if (!$voucher_pwd_arr) {
                    continue;
                }
                $tmp = array();
                $tmp['voucher_code'] = $voucher_code;
                $tmp['vouchertemplate_id'] = $t_info['vouchertemplate_id'];
                $tmp['voucher_title'] = $t_info['vouchertemplate_title'];
                $tmp['voucher_desc'] = $t_info['vouchertemplate_desc'];
                $tmp['voucher_startdate'] = $t_info['vouchertemplate_startdate'];
                $tmp['voucher_enddate'] = $t_info['vouchertemplate_enddate'];
                $tmp['voucher_price'] = $t_info['vouchertemplate_price'];
                $tmp['voucher_limit'] = $t_info['vouchertemplate_limit'];
                $tmp['voucher_store_id'] = $t_info['vouchertemplate_store_id'];
                $tmp['voucher_state'] = 1;
                $tmp['voucher_activedate'] = TIMESTAMP;
                $tmp['voucher_owner_id'] = 0;
                $tmp['voucher_owner_name'] = '';
                $tmp['voucher_order_id'] = 0;
                $tmp['voucher_pwd'] = $voucher_pwd_arr[0];//md5
                $tmp['voucher_pwd2'] = $voucher_pwd_arr[1];
                $insert_arr[] = $tmp;
                $t_total--;
            }

            $result = $voucher_model->addVoucherBatch($insert_arr);
            if ($result && $is_succ == false) {
                $is_succ = true;
            }
        }
        //更新代金券模板
        if ($is_succ) {
            $voucher_model->editVouchertemplate(array('vouchertemplate_id' => $t_info['vouchertemplate_id']), array('vouchertemplate_isbuild' => 1));
            return ds_callback(true);
        }
        else {
            return ds_callback(false);
        }
    }

}