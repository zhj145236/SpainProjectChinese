<?php

namespace app\h5api\controller;
use think;
use app\BaseController;
use think\facade\Db;

class AppFavorite extends BaseController {

	/**
	 * h5端--收藏列表
	 */
	public function getFavorites()
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
	 * h5端--收藏商品
	 */
	public function favoritesgoods()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $goods_id = input('get.goods_id');
        $isfavorite = input('get.isfavorite');
        if(empty($memberid) && empty($goods_id)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	$favorites_model = model('favorites');
            //判断是否已经收藏
            $favorites_info = $favorites_model->getOneFavorites(array(
                'fav_id' => $goods_id, 'fav_type' => 'goods',
                'member_id' => $memberid
            ));
            $member = model('member')->getMemberInfo(array('member_id' => $memberid),'member_id,member_name');
            if($isfavorite=='true' && empty($favorites_info)){
                //添加收藏
                $insert_arr = array();
                $insert_arr['member_id'] = $memberid;
                $insert_arr['member_name'] = $member['member_name'];
                $insert_arr['fav_id'] = $goods_id;
                $insert_arr['fav_type'] = 'goods';
                $insert_arr['fav_time'] = TIMESTAMP;
                $res = $favorites_model->addFavorites($insert_arr);
                if ($res) {
                    //增加收藏数量
                    $fav_arr[] = $goods_id;
                    model('goods')->editGoodsById(array('goods_collect' => Db::raw('goods_collect+1')), $fav_arr);
                }
                $result['state'] = 1;
            }else if(!empty($favorites_info)){
                $res = $favorites_model->delFavorites(array(
                    array('fav_id','=', $goods_id), array('fav_type' ,'=', 'goods'),
                    array('member_id' ,'=', $memberid)
                ));
                if($res){
                    $fav_arr[] = $goods_id;
                    model('goods')->editGoodsById(array('goods_collect' => Db::raw('goods_collect-1')), $fav_arr);
                }
                $result['state'] = 1;
            }
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}


}


