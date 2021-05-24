<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppAddress extends BaseController {

	/**
	 * h5端--收货地址列表
	 */
	public function getAddressList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$member_id = intval(input('get.memberid'));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['address_list'] = '';
        if(empty($member_id)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	$address_model=model('address');
        	$address_list = $address_model->getAddressList(array('member_id'=>$member_id),'address_is_default desc');
        	foreach ($address_list as &$value) {
        		if($value['address_is_default']>0){
        			$value['address_is_default'] = true;
        		}else{
        			$value['address_is_default'] = false;
        		}
        	}
        	unset($value);

	        $result['address_list'] = $address_list;
           	$result['state'] = 1;

        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
	 * h5端--新增/编辑收货地址
	 */
	public function addoredit()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';

        $member_id = input('get.member_id');
        $address_id = input('get.address_id');
        $address_is_default = input('get.address_is_default')=="true"? 1 : 0;
        $data = array(
            'member_id' => input('get.member_id'),
            'address_realname' => input('get.address_realname'),
            'address_mob_phone' => input('get.address_mob_phone'),
            'address_detail' => input('get.address_detail'),
            'address_is_default' => $address_is_default,
        );
        if(empty($member_id)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	$address_model=model('address');
        	//当默认地址为1时,把当前用户的地址设置为非默认地址
            if ($address_is_default == 1) {
                model('address')->editAddress(array('address_is_default' => 0), array('member_id' => $member_id));
            }
        	if(!empty($address_id)){
        		$ret = $address_model->editAddress($data,array('member_id' => $member_id, 'address_id' => $address_id));
        	}else{
            	$ret = $address_model->addAddress($data);
        	}
        	if($ret){
        		$result['state'] = 1;
        	}else{
        		$result['msg'] = $address_id>0?'fallo en modificacion':'fallo en agregar';
        	}
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}


}


