<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppMember extends BaseController {

	/**
	 * h5端--会员信息
	 */
	public function getMemberInfo()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$member_id = intval(input('get.memberid'));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['member_info'] = '';
        if(empty($member_id)){
        	$result['msg'] = 'Error de parámetro';
        }else{
        	//获取用户账号信息
			$map[] = array('member_id','=',$member_id);
	        $member_info = model('member')->getMemberInfo($map);
	        $member_info['security_level'] = model('member')->getMemberSecurityLevel($member_info);

	        //代金券数量
	        $member_info['voucher_count'] = model('voucher')->getCurrentAvailableVoucherCount($member_id);
	        //获取订单信息
	        $order_list=array();
	        $order_model = model('order');
	        $refundreturn_model = model('refundreturn');
	        $order_list['order_nopay_count'] = $order_model->getOrderCountByID('buyer', $member_id, 'NewCount');
	        $order_list['order_noreceipt_count'] = $order_model->getOrderCountByID('buyer', $member_id, 'SendCount');
	        $order_list['order_noeval_count'] = $order_model->getOrderCountByID('buyer', $member_id, 'EvalCount');
	        $order_list['order_noship_count'] = $order_model->getOrderCountByID('buyer', $member_id, 'PayCount');
	        $order_list['order_refund_count'] = $refundreturn_model->getRefundreturnCount(array(array('buyer_id','=',$member_id),array('refund_state','in',[1,2])));
	        //我的足迹
	        $goods_list = model('goodsbrowse')->getViewedGoodsList($member_id, 20);
	        if (is_array($goods_list) && !empty($goods_list)) {
	            foreach ($goods_list as &$val) {
	                $val['goods_image'] = goods_thumb($val, 240);
	            }
	            unset($val);
	        }
	        $result['member_info'] = $member_info;
	        $result['order_list'] = $order_list;
	        $result['goods_list'] = $goods_list;
           	$result['state'] = 1;

        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
	 * h5端--会员登录
	 */
	public function login()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$membername = trim(input('get.membername'));
		// $mobile = trim(input('get.mobile'));
        $password = trim(input('get.password'));
        $result['state'] = 0;
        $result['msg'] = '';
        $result['member_info'] = '';

        $data = array(
            'member_name' => $membername,
            'member_password' => $password
        );
        $map = array(
            'member_name' => $data['member_name'],
            'member_password' => md5($data['member_password']),
        );
        $member_model = model('member');
        $member_info = $member_model->getMemberInfo($map);
        if (empty($member_info) && preg_match('/^0?(13|15|17|18|14)[0-9]{9}$/i', $data['member_name'])) {
            //根据会员名没找到时查手机号
            $map = array();
            $map['member_mobile'] = $data['member_name'];
            $map['member_mobilebind'] = 1;
            $map['member_password'] = md5($data['member_password']);
            $member_info = Db::name('member')->where($map)->find();
        }
        if (!empty($member_info)) {
        	if (!$member_info['member_state']) {
                $result['msg'] = 'cuanta deshabilitada';
            }else{
            	$result['member_info'] = $member_info;
            	$result['state'] = 1;
            }
        }else{
        	$result['msg'] = 'cuanta o contrasena incorrecta';
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
	 * h5端--会员注册
	 */
	public function register()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$membername = trim(input('get.membername'));
		// $mobile = trim(input('get.mobile'));
        $password = trim(input('get.password'));
        $result['state'] = 0;
        $result['msg'] = '';
        $result['member_info'] = '';

        $data = array(
            'member_name' => $membername,
            'member_password' => $password
        );

        $member_model = model('member');
        // $condition[] = array('member_name','=',$membername);
        // $member = $member_model->getMemberInfo($condition);
        // if(!empty($member)){
        // 	$result['msg'] = '用户名已存在，可直接登录';
        // }
        $member_info = $member_model->register($data);
        if (!isset($member_info['error'])) {
            $result['member_info'] = $member_info;
            $result['state'] = 1;
        } else {
        	$result['msg'] = 'Falló el registro';
        	// 验证用户名是否重复
	        $check_member_name = $member_model->getMemberInfo(array('member_name' => $data['member_name']));
	        if (is_array($check_member_name) && !empty($check_member_name)) {
	            $result['msg'] = 'El nombre de usuario ya existe';
	        }
            
        }
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
	 * h5端--会员协议
	 */
	public function getDocument()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$code = input('get.code');
		$document_model = model('document');
        $list = $document_model->getOneDocumentByCode($code);
        if(!empty($list)){
        	$list['document_time'] = date('Y-m-d H:i',$list['document_time']);
        	$list['document_content'] = htmlspecialchars_decode($list['document_content']);
        }

	    $json_data = json_encode($list, true);
	    exit($json_data);
	}

	/**
	 * h5端--我的收藏
	 */
	public function getFavoriteList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $memberid = intval(input('get.memberid'));
        $pagesize = max(1, intval(input('get.page')));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['goods_list'] = array();

        $favorites_model = model('favorites');
        $condition[]=array('fav_type','=','goods');
        $condition[]=array('member_id','=',$memberid);
        $goods_list = $favorites_model->getMobileFavoritesList($condition, '*', $pagesize, 20);
        foreach ($goods_list as &$value) {
        	$value['create_time'] = date('Y-m-d H:i',$value['fav_time']);
        	if(!empty($value['goods_image'])){
    			$value['goods_image'] = goods_cthumb($value['goods_image']);
    		}
        }
        unset($value);
        
        $result['state'] = 1;
        $result['page'] = $pagesize;
        $result['pagesize'] = 20;
        $result['goods_list'] = $goods_list;
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

	/**
     * h5端--修改用户信息
     */
    public function editMemberInfo()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $member_model = model('member');

            $member_array = array();
            $member_array['member_name'] = trim(input('get.membername'));
            $member_array['member_truename'] = trim(input('get.truename'));
            $member_array['member_avatar'] = input('get.avatar');
            $member_array['member_email'] = trim(input('get.email'));
            $member_array['member_mobile'] = trim(input('get.mobile'));
            if(!empty($member_array['member_email'])){
            	$member_array['member_emailbind'] = 1;
            }
            if(!empty($member_array['member_mobile'])){
            	$member_array['member_mobilebind'] = 1;
            }
            $update = $member_model->editMember(array('member_id' => $memberid), $member_array, $memberid);
            if($update){
            	$result['state'] = 1;
            }else{
            	$result['msg'] = 'fallo en modificacion';
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }

    /**
     * h5端--修改密码
     */
    public function changepwd()
    {
        header('Content-Type: text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:https://m.domibuy.com');
        header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
        header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $result['state'] = 0;
        $result['msg'] = '';
        $memberid = input('get.memberid');
        $oldpwd = trim(input('get.oldpwd'));
        $newpwd = trim(input('get.newpwd'));
        if(empty($memberid)){
            $result['msg'] = 'Error de parámetro';
        }else{
            $isform = true;
            if(empty($oldpwd) && empty($newpwd)){
                $result['msg'] = 'Error de parámetro';
                $isform = false;
            }
            $member_model = model('member');
            //判断当前的密码是否和原密码相同
            $member_info = $member_model->getMemberInfo(array('member_id' => $memberid));
            if ($member_info['member_password'] != md5($oldpwd)) {
                $result['msg'] = 'contrasena actual incorrecta';
                $isform = false;
            }
            if ($member_info['member_password'] == md5($newpwd)) {
                $result['msg'] = 'la contrasena nueva no puede ser igual que la contrsena ctual';
                $isform = false;
            }
            if($isform){
                $update = $member_model->editMember(array('member_id' => $memberid), array('member_password' => md5($newpwd)),$memberid);
                if ($update) {
                    $result['state'] = 1;
                } else {
                    $result['msg'] = 'fallo en modificacion';
                }
            }
        }
        
        $json_data = json_encode($result, true);
        exit($json_data);
    }


}


