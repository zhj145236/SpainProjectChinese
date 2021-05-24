<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppUploader extends BaseController {

	/**
	 * h5端上传文件
	 */
	public function upload()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $result['state'] = 0;
        $result['msg'] = '';
        $field = input('post.file');
        
        if(empty($_FILES[$field]['name'])){
            $result['msg'] = "no ha seleccioado foto";
        }else{
            $res = ds_upload_pic(ATTACH_PATH . DIRECTORY_SEPARATOR . 'refund', $field);
            if ($res['code']) {
                $pic_name = $res['data']['file_name'];
                $pic_url = ds_get_pic(ATTACH_PATH.'/refund',$pic_name);
                $result['state'] = 1;
                $result['pic_name'] = $pic_name;
                $result['pic_url'] = $pic_url;
            }else{
            	$result['msg'] = "carga fallida";
            }
        }

	    $json_data = json_encode($result, true);
	    exit($json_data);
	}


}


