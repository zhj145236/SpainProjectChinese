<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppBaskorder extends BaseController {

	/**
	 * h5端--评价/晒单列表
	 */
	public function getBaskorderList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $memberid = intval(input('get.memberid'));
        $pagesize = max(1, intval(input('get.page')));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['pingjia_list'] = array();
        if(empty($memberid)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	$evaluategoods_model = model('evaluategoods');

	        $condition = array();
	        $condition[] = array('geval_frommemberid','=',$memberid);
	        $pingjia_list = $evaluategoods_model->getMobileEvaluategoodsList($condition, '', $pagesize, 20, 'geval_id desc');
	        foreach ($pingjia_list as &$value) {
	        	$value['create_addtime'] = date('Y-m-d H:i',$value['geval_addtime']);
	        	$value['geval_goodsimage'] = goods_cthumb($value['geval_goodsimage']);
	        	$value['geval_imagearr'] = array();
	        	if(!empty($value['geval_image'])){
	        		$image_array = explode(',', $value['geval_image']);
	        		foreach ($image_array as &$row) {
	        			$row = sns_thumb($row);
	        		}
	        		unset($row);
	        		$value['geval_imagearr'] = $image_array;
	        	}
	        }
	        unset($value);

        	$result['state'] = 1;
	        $result['page'] = $pagesize;
	        $result['pagesize'] = 20;
	        $result['pingjia_list'] = $pingjia_list;

        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
     * h5端--商品晒单提交
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
        $geval_id = intval(input('get.geval_id'));
        $imgstr = input('get.imgstr');
        if(empty($geval_id) && empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            if(empty($imgstr)){
                $result['msg'] = "Por favor, suba la imagen";
            }else{
            	$isform = true;
                $imgstr = rtrim($imgstr, ',');

                $evaluategoods_model = model('evaluategoods');

		        $geval_info = $evaluategoods_model->getEvaluategoodsInfoByID($geval_id);
		        if (empty($geval_info)) {
		            $result['msg'] = 'Error de parámetro';
		            $isform = false;
		        }
		        if ($geval_info['geval_frommemberid'] != $memberid) {
		            $result['msg'] = 'Error de parámetro';
		            $isform = false;
		        }
		        if($isform){
		        	$update = array();
			        $update['geval_image'] = $imgstr;
			        $condition = array();
			        $condition[] = array('geval_id','=',$geval_id);
			        $ret = $evaluategoods_model->editEvaluategoods($update, $condition);
			        if ($ret) {
			            $result['state'] = 1;
			        }
		        }
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }


}


