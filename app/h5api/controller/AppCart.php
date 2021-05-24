<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppCart extends BaseController {

	/**
	 * h5端--购物车列表
	 */
	public function getCartList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$member_id = intval(input('get.memberid'));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['cart_list'] = '';
        if(empty($member_id)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	$cart_map = array(
                'buyer_id' => $member_id,
            );
            $cart_mod=model('cart');
            $cart_list = $cart_mod->getCartList('db',$cart_map);

            $cart_array = array();
            $cart_all_price = 0;
            $cart_goods_num = 0;
            if (!empty($cart_list)) {
                foreach ($cart_list as $k => $cart) {
                    $cart_array['list'][$k]['cart_id'] = isset($cart['cart_id'])?$cart['cart_id']:$cart['goods_id'];
                    $cart_array['list'][$k]['goods_id'] = $cart['goods_id'];
                    $cart_array['list'][$k]['goods_name'] = $cart['goods_name'];
                    $cart_array['list'][$k]['option_name'] = $cart['option_name'];
                    $cart_array['list'][$k]['goods_price'] = $cart['goods_price'];
                    $cart_array['list'][$k]['goods_image'] = goods_thumb($cart, 240);
                    $cart_array['list'][$k]['goods_num'] = $cart['goods_num'];
                    $cart_array['list'][$k]['goods_selected'] = $cart['goods_selected']>0?true:false;
                    $cart_all_price += $cart['goods_price'] * $cart['goods_num'];
                    $cart_goods_num ++;
                    $goods = model('goods')->getGoodsInfo(array(array('goods_id','=',$cart['goods_id'])), 'goods_storage');
                    $cart_array['list'][$k]['goods_stock'] = $goods['goods_storage'];
                }
            }
            $cart_array['cart_all_price'] = $cart_all_price;
            $cart_array['cart_goods_num'] = $cart_goods_num;

	        $result['cart_list'] = $cart_array;
           	$result['state'] = 1;

        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
	 * h5端--新增购物车
	 */
	public function addCart()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $goods_id = intval(input('get.goods_id'));
        $total = intval(input('get.total'));
        $option_name = input('get.option_name');
        if(empty($goods_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else if(empty($total)){
            $result['msg'] = 'la cantidad debe ser mayor a 0';
        }else{
            $isadd = true;
            $goods_model = model('goods');
            $logic_buy_1 =  model('buy_1','logic');
            $goods_info = $goods_model->getGoodsOnlineInfoAndPromotionById($goods_id);
            //抢购
            $logic_buy_1->getGroupbuyInfo($goods_info, $total);
            //批发
            $logic_buy_1->getWholesaleInfo($goods_info, $total);
            //限时折扣
            $logic_buy_1->getXianshiInfo($goods_info, $total);
            //会员等级折扣
            $logic_buy_1->getMgdiscountInfo($goods_info);
            if(empty($goods_info)){
                $result['msg'] = 'producto no encontrado';
                $isadd = false;
            }
            if (intval($goods_info['goods_storage']) < 1) {
                $result['msg'] = 'producto no tiene exsistencia, no es posible comprar en este momento';
                $isadd = false;
            }
            if (intval($goods_info['goods_storage']) < $total) {
                $result['msg'] = 'producto en escasez';
                $isadd = false;
            }
            if ($goods_info['is_virtual'] || $goods_info['is_goodsfcode'] || $goods_info['is_presell']) {
                $result['msg'] = 'este producto no puede ser agregado al carrito, favor compara ahora';
                $isadd = false;
            }
            if($isadd){
                $save_type = 'db';
                $goods_info['buyer_id'] = $memberid;
                $goods_info['option_name'] = $option_name;
                if($goods_info['goods_ispifa'] > 0){
                	if($goods_info['startnum1'] <= $total && $total <= $goods_info['endnum1']){
                		$goods_info['goods_price'] = $goods_info['pifaprice1'];
                	}else if($goods_info['startnum2'] <= $total && $total <= $goods_info['endnum2']){
                		$goods_info['goods_price'] = $goods_info['pifaprice2'];
                	}else if($goods_info['startnum3'] <= $total && $total <= $goods_info['endnum3']){
                		$goods_info['goods_price'] = $goods_info['pifaprice3'];
                	}
                }
                
                $cart_model = model('cart');
                $insert = $cart_model->addCart($goods_info, $save_type, $total);
                if($insert){
                    $cart_list = $cart_model->getCartList('db',array('buyer_id' => $memberid));
                    $result['state'] = 1;
                    $result['num'] = count($cart_list);
                }
            }
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

    /**
     * h5端--更新购物车
     */
    public function updateCart()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $cart_id = input('get.cart_id');
        $goods_num = input('get.goods_num');
        if(empty($cart_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $data = array(
                'goods_num' => $goods_num,
            );
            $cart_mod=model('cart');
            $condition[] = array('cart_id','=',$cart_id);
            $condition[] = array('buyer_id','=',$memberid);
            $ret = $cart_mod->editCart($data,$condition,$memberid);
            if($ret){
                $result['state'] = 1;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--勾选购物车
     */
    public function selectCart()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $cart_id = input('get.cart_id');
        $goods_selected = input('get.goods_selected');
        $goods_allselected = input('get.goods_allselected');
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $cart_mod=model('cart');
            if(!empty($cart_id)){
                $data = array(
                    'goods_selected' => $goods_selected=="true"?1:0,
                );
                $condition[] = array('cart_id','=',$cart_id);
            }else{
                $data = array(
                    'goods_selected' => $goods_allselected=="true"?1:0,
                );
            }
            $condition[] = array('buyer_id','=',$memberid);
            $ret = $cart_mod->editCart($data,$condition,$memberid);
            if($ret){
                $result['state'] = 1;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--删除购物车
     */
    public function deleteCart()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $cart_id = input('get.cart_id');
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $cart_mod=model('cart');
            $condition[] = array('buyer_id','=',$memberid);
            if(!empty($cart_id)){
                $condition[] = array('cart_id','=',$cart_id);
            }
            $ret = $cart_mod->delCart('db',$condition,$memberid);
            if($ret){
                $result['state'] = 1;
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }


}


