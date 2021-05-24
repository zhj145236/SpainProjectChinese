<?php

namespace app\home\controller;

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
 * 控制器
 */
class Api {
    
    /* Facebook登录 */
    public function fb_login() {
        $accessToken = input('get.accessToken');
        echo "string=".$accessToken;

        @header('location: '.HOME_SITE_URL);
        exit;
        // include PLUGINS_PATH . '/login/fb/oauth/fb_login.php';
    }
    /* Twitter登录 */
    public function oa_tw() {
        include PLUGINS_PATH . '/login/tw/oauth/tw_login.php';
    }
    /* QQ登录 */
    public function oa_qq() {
        include PLUGINS_PATH . '/login/qq/oauth/qq_login.php';
    }
    /* QQ登录回调 */
    public function oa_qq_callback() {
        include PLUGINS_PATH . '/login/qq/oauth/qq_callback.php';
    }

    /* sina Login */
    public function oa_sina() {
        if (input('param.step') == 'callback') {
            include PLUGINS_PATH . '/login/sina/callback.php';
        } else {
            include PLUGINS_PATH . '/login/sina/index.php';
        }
    }


}