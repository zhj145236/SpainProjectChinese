<?php

namespace app\admin\controller;
use think\facade\View;
use think\facade\Lang;

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
class Account extends AdminControl {

    public function initialize() {
        parent::initialize();
        Lang::load(base_path() . 'admin/lang/'.config('lang.default_lang').'/account.lang.php');
        Lang::load(base_path() . 'admin/lang/'.config('lang.default_lang').'/config.lang.php');
    }

    /**
     * 设置
     */
    public function setting() {
        $config_model = model('config');
        if (!request()->isPost()) {
            $list_config = rkcache('config', true);
            View::assign('list_config', $list_config);
            /* 设置卖家当前栏目 */
            $this->setAdminCurItem('setting');

            return View::fetch();
        } else {
            $update_array=array();
            $update_array['auto_register'] = input('post.auto_register');
            $result = $config_model->editConfig($update_array);
            if ($result) {
                $this->log(lang('ds_edit').lang('ds_account'),1);
                $this->success(lang('ds_common_save_succ'));
            }else{
                $this->log(lang('ds_edit').lang('ds_account'),0);
            }
        }
    }

    /**
     * Facebook 互联
     */
    function fb() {
        $config_model = model('config');
        if (!request()->isPost()) {
            $list_config = rkcache('config', true);
            View::assign('list_config', $list_config);

            //输出子菜单
            $this->setAdminCurItem('fb');

            return View::fetch('fb');
        } else {
            $update_array = array();
            $update_array['fb_isuse'] = input('post.fb_isuse');
            $update_array['fb_appid'] = input('post.fb_appid');
            $update_array['fb_appkey'] = input('post.fb_appkey');

            $result = $config_model->editConfig($update_array);
            if ($result === true) {
                $this->log(lang('ds_edit').lang('fb_settings'), 1);
                $this->success(lang('ds_common_save_succ'));
            } else {
                $this->log(lang('ds_edit').lang('fb_settings'), 0);
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }

    /**
     * Twitter 互联
     */
    public function tw() {
        $config_model = model('config');
        if (!request()->isPost()) {
            $list_config = rkcache('config', true);
            View::assign('list_config', $list_config);

            //输出子菜单
            $this->setAdminCurItem('tw');
            return View::fetch('tw');
        } else {
            $update_array = array();
            $update_array['tw_isuse'] = input('post.tw_isuse');
            $update_array['tw_appid'] = input('post.tw_appid');
            $update_array['tw_appkey'] = input('post.tw_appkey');

            $result = $config_model->editConfig($update_array);
            if ($result === true) {
                $this->log(lang('ds_edit').lang('tw_settings'), 1);
                $this->success(lang('ds_common_save_succ'));
            } else {
                $this->log(lang('ds_edit').lang('tw_settings'), 0);
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }
    
    /**
     * QQ互联
     */
    function qq() {
        $config_model = model('config');
        if (!request()->isPost()) {
            $list_config = rkcache('config', true);
            View::assign('list_config', $list_config);

            //输出子菜单
            $this->setAdminCurItem('qq');
            return View::fetch('qq');
        } else {
            $update_array = array();
            $update_array['qq_isuse'] = input('post.qq_isuse');
            $update_array['qq_appid'] = input('post.qq_appid');
            $update_array['qq_appkey'] = input('post.qq_appkey');

            $result = $config_model->editConfig($update_array);
            if ($result === true) {
                $this->log(lang('ds_edit').lang('qq_settings'), 1);
                $this->success(lang('ds_common_save_succ'));
            } else {
                $this->log(lang('ds_edit').lang('qq_settings'), 0);
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }

    /**
     * sina微博设置
     */
    public function sina() {
        $config_model = model('config');
        if (!request()->isPost()) {
            $list_config = rkcache('config', true);
            View::assign('list_config', $list_config);

            //输出子菜单
            $this->setAdminCurItem('sina');
            return View::fetch('sina');
        } else {
            $update_array = array();
            $update_array['sina_isuse'] = input('post.sina_isuse');
            $update_array['sina_wb_akey'] = input('post.sina_wb_akey');
            $update_array['sina_wb_skey'] = input('post.sina_wb_skey');

            $result = $config_model->editConfig($update_array);
            if ($result === true) {
                $this->log(lang('ds_edit').lang('sina_settings'), 1);
                $this->success(lang('ds_common_save_succ'));
            } else {
                $this->log(lang('ds_edit').lang('sina_settings'), 0);
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }

    /**
     * 微信登录设置
     */
    public function wx() {
        $config_model = model('config');
        if (!request()->isPost()) {
            $list_config = rkcache('config', true);
            View::assign('list_config', $list_config);
            //输出子菜单
            $this->setAdminCurItem('wx');
            return View::fetch('wx');
        } else {
            $update_array = array();
            $update_array['weixin_isuse'] = input('post.weixin_isuse');
            $update_array['weixin_appid'] = input('post.weixin_appid');
            $update_array['weixin_secret'] = input('post.weixin_secret');
            
            $result = $config_model->editConfig($update_array);
            if ($result) {
                $this->log(lang('account_synchronous_login'));
                $this->success(lang('ds_common_save_succ'));
            } else {
                $this->error(lang('ds_common_save_fail'));
            }
        }
    }

    /**
     * 获取卖家栏目列表,针对控制器下的栏目
     */
    protected function getAdminItemList() {
        $menu_array = array(
            array(
                'name' => 'setting',
                'text' => lang('account_setting'),
                'url' => (string)url('Account/setting')
            ),
            array(
                'name' => 'fb',
                'text' => lang('fb_interconnection'),
                'url' => (string)url('Account/fb')
            ),
            array(
                'name' => 'tw',
                'text' => lang('tw_interconnection'),
                'url' => (string)url('Account/tw')
            ),
            // array(
            //     'name' => 'qq',
            //     'text' => lang('qq_interconnection'),
            //     'url' => (string)url('Account/qq')
            // ),
            // array(
            //     'name' => 'sina',
            //     'text' => lang('sina_interconnection'),
            //     'url' => (string)url('Account/sina')
            // ),
            // array(
            //     'name' => 'wx',
            //     'text' => lang('wx_login'),
            //     'url' => (string)url('Account/wx')
            // ),
        );
        return $menu_array;
    }

}

?>
