<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppGoods extends BaseController {

	/**
	 * 获取h5端获取分类精选商品
	 */
	public function getCategoods()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $condition[]=array('goodscommon.mall_goods_commend','=',1);
	    $goods_list = model('goods')->getGoodsUnionList($condition, 'goods.goods_id,goodscommon.goods_name,goodscommon.goods_advword,goodscommon.goods_image,goodscommon.store_id,goods.goods_promotion_price,goodscommon.goods_price','goodscommon.mall_goods_sort asc','goodscommon.goods_commonid', 0,10);
	    if(!empty($goods_list)){
	    	foreach ($goods_list as &$value) {
	    		if(!empty($value['goods_image'])){
	    			$value['goods_image'] = goods_cthumb($value['goods_image']);
	    		}
	    		$ret = model('goods')->getGoodsPifaInfo(array(array('goods_id', '=', $value['goods_commonid'])));
		        if(!empty($ret) && $value['goods_price'] <= 0.00 && $ret['pifaprice1'] > 0){
		        	$value['goods_price'] = $ret['pifaprice1'];
		        }
	    	}
	    	unset($value);
	    }

	    $json_data = json_encode($goods_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端获取热门推荐商品
	 */
	public function getRemengoods()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $goods_list = model('goods')->getGoodsCommendList(1, 20);
	    if(!empty($goods_list)){
	    	foreach ($goods_list as &$value) {
	    		if(!empty($value['goods_image'])){
	    			$value['goods_image'] = goods_cthumb($value['goods_image']);
	    		}
	    		$ret = model('goods')->getGoodsPifaInfo(array(array('goods_id', '=', $value['goods_commonid'])));
		        if(!empty($ret) && $value['goods_price'] <= 0.00 && $ret['pifaprice1'] > 0){
		        	$value['goods_price'] = $ret['pifaprice1'];
		        }
	    	}
	    	unset($value);
	    }

	    $json_data = json_encode($goods_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端获取销量排行商品
	 */
	public function getXiaolinggoods()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $goods_list = model('goods')->getGoodsOnlineList(array(), '', '', 'goods_salenum desc', 20,'goods_commonid');
	    if(!empty($goods_list)){
	    	foreach ($goods_list as &$value) {
	    		if(!empty($value['goods_image'])){
	    			$value['goods_image'] = goods_cthumb($value['goods_image']);
	    		}
	    		$ret = model('goods')->getGoodsPifaInfo(array(array('goods_id', '=', $value['goods_commonid'])));
		        if(!empty($ret) && $value['goods_price'] <= 0.00 && $ret['pifaprice1'] > 0){
		        	$value['goods_price'] = $ret['pifaprice1'];
		        }
	    	}
	    	unset($value);
	    }

	    $json_data = json_encode($goods_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端获取新品上架商品
	 */
	public function getXinpingoods()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $condition[]=array('goods.goods_commend','=',1);
	    $goods_list = model('goods')->getGoodsUnionList($condition, 'goods.goods_id,goodscommon.goods_commonid,goodscommon.goods_name,goodscommon.goods_advword,goodscommon.goods_image,goodscommon.store_id,goods.goods_promotion_price,goodscommon.goods_price','goods.goods_id desc','goodscommon.goods_commonid', 0,60);
	    if(!empty($goods_list)){
	    	foreach ($goods_list as &$value) {
	    		if(!empty($value['goods_image'])){
	    			$value['goods_image'] = goods_cthumb($value['goods_image']);
	    		}
	    		$ret = model('goods')->getGoodsPifaInfo(array(array('goods_id', '=', $value['goods_commonid'])));
		        if(!empty($ret) && $value['goods_price'] <= 0.00 && $ret['pifaprice1'] > 0){
		        	$value['goods_price'] = $ret['pifaprice1'];
		        }
	    	}
	    	unset($value);
	    }

	    $json_data = json_encode($goods_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端获取所有分类
	 */
	public function get_all_category()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $goodsclass_model = model('goodsclass');
	    $condition[]=array('gc_show','=',1);
        $goods_class = $goodsclass_model->getGoodsclassList($condition);
        $gc_list = array();
        $gc_list2 = array();
        if(!empty($goods_class)){
        	foreach ($goods_class as &$value) {
        		$value['gc_name'] = str_replace(' ','',$value['gc_name']);
        		$value['gc_image'] = ds_get_pic( ATTACH_COMMON , $value['gc_image']);
        		if(empty($value['gc_parent_id'])){
        			$value['level'] = 1;
        			$gc_list[] = $value;
        		}
        	}
        	unset($value);
        	if(!empty($gc_list)){
    			foreach ($gc_list as &$value2) {
    				foreach ($goods_class as &$value) {
		        		if($value['gc_parent_id'] == $value2['gc_id']){
	    					$gc_list2[] = $value;
	    					$value['level'] = 2;
	    				}
		        	}
		        	unset($value);
    			}
    			unset($value2);
    		}
    		if(!empty($gc_list2)){
    			foreach ($gc_list2 as &$value3) {
    				foreach ($goods_class as &$value) {
		        		if($value['gc_parent_id'] == $value3['gc_id']){
	    					$value['level'] = 3;
	    				}
		        	}
		        	unset($value);
    			}
    			unset($value3);
    		}
        }

	    $json_data = json_encode($goods_class, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端热门搜索，历史搜索
	 */
	public function getSearchlog()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$memberid = input('get.memberid');
		//热门搜索
	    $condition[]=array('log_id','>',0);
	    $remen_list = model('searchlog')->getSearchlogList($condition, 'log_id,searchname,COUNT(searchname) mycount', 'searchname', 20, 'mycount desc');

	    if(empty($memberid)){
	    	$history_list = array();
	    }else{
	    	$condition[]=array('member_id','=',$memberid);
	    	$condition[]=array('isdelete','=',0);
	    	$history_list = model('searchlog')->getSearchlogList($condition, 'log_id,searchname', '', '', 'createtime desc');
	    }
	    
	    $list = array(
	    	'remen_list' => $remen_list,
	    	'history_list' => $history_list
	    );

	    $json_data = json_encode($list, true);
	    exit($json_data);
	}

	/**
	 * 添加历史搜索
	 */
	public function addSearchlog()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$memberid = input('get.memberid');
		$searchname = input('get.searchname');
		if(!empty($memberid) && !empty($searchname)){
			$condition[]=array('member_id','=',$memberid);
		    $condition[]=array('searchname','=',$searchname);
		    $list = model('searchlog')->getOneSearchlog($condition);
		    if(empty($list)){
		    	$data = array(
		    		'member_id' => $memberid,
		    		'searchname' => $searchname,
		    		'createtime' => time(),
		    	);
		    	model('searchlog')->addSearchlog($data);
		    }else{
		    	model('searchlog')->editSearchlog($list['log_id'], array('isdelete' => 0, 'createtime' => time()));
		    }
		}

	    $json_data = json_encode(array('state' => 1), true);
	    exit($json_data);
	}

	/**
	 * 删除历史搜索
	 */
	public function delSearchlog()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$memberid = input('get.memberid');
	    $condition[]=array('member_id','=',$memberid);
	    $list = model('searchlog')->getSearchlogList($condition, 'log_id,searchname', '', 0, 'createtime desc');
	    foreach ($list as &$value) {
	    	model('searchlog')->editSearchlog($value['log_id'], array('isdelete' => 1));
	    }
	    unset($value);

	    $json_data = json_encode(array('state' => 1), true);
	    exit($json_data);
	}

	/**
	 * h5端--所有商品列表
	 */
	public function getAllGoodsList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$pagesize = max(1, intval(input('get.page')));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['goods_list'] = array();
        
        $fid = intval(input('get.fid'));//1级分类
        $sid = intval(input('get.sid'));//2级分类
        $tid = intval(input('get.tid'));//3级分类
        $searchname = trim(input('get.searchname'));//关键词
        $moretype = intval(input('get.moretype'));//1热门推荐 2销量排行 3新品上架
        $orderby = trim(input('get.orderby'));//排序 默认综合排序 saledesc销量优先 priceup价格升 pricedo价格降
        $sort = 'goods_sort desc';
        if($orderby=='saledesc'){
        	$sort = 'goods_salenum desc';
        }else if($orderby=='priceup'){
        	$sort = 'goods_price asc';
        }else if($orderby=='pricedo'){
        	$sort = 'goods_price desc';
        }

        $condition = array();
        if(!empty($fid)){
        	$condition[] = array('gc_id_1','=',$fid);
        }
        if(!empty($sid)){
        	$condition[] = array('gc_id_2','=',$sid);
        }
        if(!empty($tid)){
        	$condition[] = array('gc_id_3','=',$tid);
        }
        if(!empty($searchname)){
        	$condition[] = array('goods_name', 'like', '%' . $searchname . '%');
        	$condition[] = array('goods_advword', 'like', '%' . $searchname . '%');
        }
        
        $goods_list = model('goods')->getMobileGoodsList($condition,'','goods_commonid',$sort,10,$pagesize);
	    if(!empty($goods_list)){
	    	foreach ($goods_list as &$value) {
	    		if(!empty($value['goods_image'])){
	    			$value['goods_image'] = goods_cthumb($value['goods_image']);
	    		}
	    		$ret = model('goods')->getGoodsPifaInfo(array(array('goods_id', '=', $value['goods_commonid'])));
		        if(!empty($ret) && $value['goods_price'] <= 0.00 && $ret['pifaprice1'] > 0){
		        	$value['goods_price'] = $ret['pifaprice1'];
		        }
	    	}
	    	unset($value);
	    }

	    $result['goods_list'] = $goods_list;
        $result['page'] = $pagesize;
        $result['pagesize'] = 10;
        $result['state'] = 1;

	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
	 * h5端--商品详情
	 */
	public function getGoodsdetail()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$goods_id = input('get.goods_id');
		$memberid = input('get.memberid');
		$result['state'] = 0;
        $result['msg'] = '';
        
        if(empty($goods_id)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	$goods_model = model('goods');
	        $goods_detail = $goods_model->getGoodsDetail($goods_id);
	        $goods_info = $goods_detail['goods_info'];
	        if (empty($goods_info)) {
	            $result['msg'] = 'producto no encontrado';
	        }else{
	        	$goods_image = $goods_detail['goods_image_mobile'];
	        	$spec_image = $goods_detail['spec_image'];
	        	$mansong_info = $goods_detail['mansong_info'];
	        	// 获取销量 BEGIN
		        $rs = $goods_model->getGoodsList(array('goods_commonid' => $goods_info['goods_commonid']));
		        $count = 0;
		        foreach ($rs as $v) {
		            $count += $v['goods_salenum'];
		        }
		        $goods_info['goods_salenum'] = $count;
		        // 获取销量 END
		        // 如果使用售卖区域
		        if ($goods_info['transport_id'] > 0) {
		            // 取得三种运送方式默认运费
		            $transport_model = model('transport');
		            $transport = $transport_model->getTransportextendList(array('transport_id' => $goods_info['transport_id'],'transportext_is_default'=>1));
		            if (!empty($transport) && is_array($transport)) {
		                foreach ($transport as $v) {
		                    $goods_info["transport_price"] = $v['transportext_sprice'];
		                }
		            }
		        }
		        $goods_info['goodsvideo_url']=goods_video($goods_info['goodsvideo_name']);

		        //评价信息
		        $goods_evaluate_info = model('evaluategoods')->getEvaluategoodsInfoByGoodsID($goods_id);
		        $condition[]=array('geval_goodsid','=',$goods_id);
		        $condition[]=array('geval_scores','in', '5,4,3,2');
		        //查询商品评分信息
		        $goodsevallist = model('evaluategoods')->getEvaluategoodsList($condition, 10);
		        foreach($goodsevallist as $key => $val){
		        	$goodsevallist[$key]['geval_addtime'] = date('Y-m-d H:i',$goodsevallist[$key]['geval_addtime']);
		            if(preg_match('/^phone_1[3|5|6|7|8]\d{9}$/', $val['geval_frommembername'])){
		                $goodsevallist[$key]['geval_frommembername'] = substr_replace($val['geval_frommembername'], '****', 9, 4);
		            }
		            $goodsevallist[$key]['geval_frommemberavatar'] = get_member_avatar_for_id($val['geval_frommemberid']);
		        }
		        $goods_evaluate_info['goodsevallist'] = $goodsevallist;

		        //商品详情
		        $goods_desc = '';
		        if(!empty($goods_info['goods_body'])){
		        	$goods_desc = htmlspecialchars_decode($goods_info['goods_body']);
		        }

		        $goods_info['goods_isfavorites'] = false;
		        //判断是否已经收藏
		        $favorites_info = model('favorites')->getOneFavorites(array(
		            'fav_id' => $goods_id, 'fav_type' => 'goods',
		            'member_id' => $memberid
		        ));
		        if(!empty($favorites_info)){
		        	$goods_info['goods_isfavorites'] = true;
		        }
		        //购物车数量
		        $cart_map = array(
	                'buyer_id' => $memberid,
	            );
            	$goods_info['goods_cartnum'] = 0;
            	$cart_list = model('cart')->getCartList('db',$cart_map);
            	if(!empty($cart_list)){
            		$goods_info['goods_cartnum'] = count($cart_list);
            	}

            	//记录浏览历史
            	model('goodsbrowse')->addViewedGoods($goods_id, $memberid, 0);
            	//规格
            	$spec_list = array();
            	$specchild_list = array();
            	if(!empty($goods_info['spec_name'])){
            		foreach ($goods_info['spec_name'] as $key => $value) {
            			$spec_list[] = array('id' => $key, 'name' => $value);
            			if (isset($goods_info['spec_value'][$key]) && is_array($goods_info['spec_value'][$key]) && !empty($goods_info['spec_value'][$key])) {
            				foreach ($goods_info['spec_value'][$key] as $k => $val) {
            					$specchild_list[] = array('id' => $k, 'name' => $val, 'pid' => $key, 'selected' => false);
            				}
            			}
            		}
            	}
            	
            	$store_model = model('store');
        		$store_info = $store_model->getStoreOnlineInfoByID($goods_info['store_id']);
				
				$result['store_info'] = $store_info;
	        	$result['goods_info'] = $goods_info;
	        	$result['goods_image'] = $goods_image;
	        	$result['spec_list'] = $spec_list;
	        	$result['specchild_list'] = $specchild_list;
	        	$result['mansong_info'] = $mansong_info;
	        	$result['goods_evaluate'] = $goods_evaluate_info;
	        	$result['goods_desc'] = $goods_desc;
	        	$result['state'] = 1;
	        }
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}


}


