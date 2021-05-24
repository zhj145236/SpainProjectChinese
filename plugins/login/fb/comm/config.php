<?php
/**
 * PHP SDK for Facebook登录 OpenAPI
 *
 * @version 1.2
 * @author Facebook.com
 * @copyright © 2011, Facebook Corporation. All rights reserved.
 */

/**
 * @brief 本文件作为demo的配置文件。
 */

/**
 * 正式运营环境请关闭错误信息
 * ini_set("error_reporting", E_ALL);
 * ini_set("display_errors", TRUE);
 * FBDEBUG = true  开启错误提示
 * FBDEBUG = false 禁止错误提示
 * 默认禁止错误信息
 */
define("FBDEBUG", false);
if (defined("FBDEBUG") && FBDEBUG)
{
    @ini_set("error_reporting", E_ALL);
    @ini_set("display_errors", TRUE);
}

/**
 * session
 */
//require_once(PLUGINS_PATH.DIRECTORY_SEPARATOR.'login'.DIRECTORY_SEPARATOR.'fb'.DIRECTORY_SEPARATOR.'comm'.DIRECTORY_SEPARATOR."session.php");

//包含配置信息
$data = rkcache("config", true);
//Facebook互联是否开启
if($data['fb_isuse'] != 1){
	@header('location: index.php');
	exit;
}

//申请到的appid
$fb_appid = trim($data['fb_appid']);

//申请到的appkey
$fb_appkey = trim($data['fb_appkey']);

//Facebook登录成功后回调的地址
$callback = HTTP_TYPE.$_SERVER['HTTP_HOST']."/home/Api/oa_fb_callback.html";

//调用的api接口(访问用户资料get_user_info)
$scope = "get_user_info";

//用session保存调用
session('appid', $fb_appid);
session('appkey', $fb_appkey);
session('callback', $callback);
session('scope', $scope);
?>
