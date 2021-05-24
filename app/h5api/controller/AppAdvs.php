<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppAdvs extends BaseController {

	/**
	 * 获取h5端轮播图
	 */
	public function getlist()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $appadv_model = model('appadv');
	    $condition[] = array('ap_id','=',1);
	    $condition[] = array('adv_code','<>','');
	    $adv_list = $appadv_model->getAppadvList($condition);
	    if(!empty($adv_list)){
	    	foreach ($adv_list as &$row) {
	    		$row['src'] = '';
	    		if(!empty($row['adv_code'])){
	    			$row['src'] = BASE_SITE_ROOT . '/uploads/' . ATTACH_APPADV . '/' . $row['adv_code'];
	    		}
	    	}
	    	unset($row);
	    }
	    $json_data = json_encode($adv_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端横图广告
	 */
	public function gethxadvs()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $appadv_model = model('appadv');
	    $condition[] = array('ap_id','=',4);
	    $condition[] = array('adv_code','<>','');
	    $adv_list = $appadv_model->getAppadvList($condition);
	    if(!empty($adv_list)){
	    	foreach ($adv_list as &$row) {
	    		$row['src'] = '';
	    		if(!empty($row['adv_code'])){
	    			$row['src'] = BASE_SITE_ROOT . '/uploads/' . ATTACH_APPADV . '/' . $row['adv_code'];
	    		}
	    	}
	    	unset($row);
	    }
	    $json_data = json_encode($adv_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端分类精选背景图
	 */
	public function gethfenleijxbg()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $appadv_model = model('appadv');
	    $condition[] = array('ap_id','=',5);
	    $condition[] = array('adv_code','<>','');
	    $adv_list = $appadv_model->getAppadvList($condition);
	    if(!empty($adv_list)){
	    	foreach ($adv_list as &$row) {
	    		$row['src'] = '';
	    		if(!empty($row['adv_code'])){
	    			$row['src'] = BASE_SITE_ROOT . '/uploads/' . ATTACH_APPADV . '/' . $row['adv_code'];
	    		}
	    	}
	    	unset($row);
	    }
	    $json_data = json_encode($adv_list, true);
	    exit($json_data);
	}

}


