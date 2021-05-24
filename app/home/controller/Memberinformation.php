<?php

namespace app\home\controller;

use think\facade\View;
use think\facade\Lang;
use think\facade\Db;

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
class Memberinformation extends BaseMember {

    public function initialize() {
        parent::initialize(); // TODO: Change the autogenerated stub
        Lang::load(base_path() . 'home/lang/' . config('lang.default_lang') . '/memberhome.lang.php');
    }

    /**
     * 我的资料【用户中心】
     *
     * @param
     * @return
     */
    public function index() {
        $member_model = model('member');

        if (request()->isPost()) {
            $member_array = array();
            $member_array['member_nickname'] = input('post.member_nickname');
            $member_array['member_sex'] = input('post.member_sex');
            $member_array['member_qq'] = input('post.member_qq');
            $member_array['member_ww'] = input('post.member_ww');
            $member_array['member_areaid'] = input('post.area_id');
            $member_array['member_cityid'] = input('post.city_id');
            $member_array['member_provinceid'] = input('post.province_id');
            $member_array['member_areainfo'] = input('post.area_info');
            if (strlen(input('post.birthday')) == 10) {
                $member_array['member_birthday'] = strtotime(input('post.birthday'));
            }
            $member_array['member_privacy'] = serialize(input('post.privacy/a'));
            $update = $member_model->editMember(array('member_id' => session('member_id')), $member_array, session('member_id'));

            $message = $update ? lang('ds_common_save_succ') : lang('ds_common_save_fail');

            if ($update) {
                ds_json_encode(10000, $message);
            } else {
                ds_json_encode(10001, $message);
            }
        }
        if ($this->member_info['member_privacy'] != '') {
            $this->member_info['member_privacy'] = unserialize($this->member_info['member_privacy']);
        } else {
            $this->member_info['member_privacy'] = array();
        }
        View::assign('member_info', $this->member_info);
        /* 设置买家当前菜单 */
        $this->setMemberCurMenu('member_information');
        /* 设置买家当前栏目 */
        $this->setMemberCurItem('member');
        View::assign('menu_sign', 'profile');
        View::assign('menu_sign_url', (string) url('Memberinformation/index'));
        View::assign('menu_sign1', 'baseinfo');
        return View::fetch($this->template_dir . 'index');
    }

    /**
     * 我的资料【更多个人资料】
     *
     * @param
     * @return
     */
    public function more() {
        if (request()->isPost()) {
            Db::name('snsmtagmember')->where(array('member_id' => session('member_id')))->delete();
            $mid_array = input('post.mid/a');
            if (!empty($mid_array)) {
                $insert_array = array();
                foreach ($mid_array as $val) {
                    $insert_array[] = array(
                        'mtag_id' => intval($val),
                        'member_id' => session('member_id')
                    );
                }
                Db::name('snsmtagmember')->insertAll($insert_array);
            }
            ds_json_encode(10000, lang('ds_common_op_succ'));
        }

        // 用户标签列表
        $mtag_array = Db::name('snsmembertag')->order('mtag_sort asc')->select()->toArray();

        // 用户已添加标签列表。
        $mtm_array = Db::name('snsmtagmember')->where(array('member_id' => session('member_id')))->select()->toArray();
        $mtag_list = array();
        $mtm_list = array();
        if (!empty($mtm_array) && is_array($mtm_array)) {
            // 整理
            $elect_array = array();
            foreach ($mtm_array as $val) {
                $elect_array[] = $val['mtag_id'];
            }
            foreach ((array) $mtag_array as $val) {
                if (in_array($val['mtag_id'], $elect_array)) {
                    $mtm_list[] = $val;
                } else {
                    $mtag_list[] = $val;
                }
            }
        } else {
            $mtag_list = $mtag_array;
        }
        View::assign('mtag_list', $mtag_list);
        View::assign('mtm_list', $mtm_list);

        /* 设置买家当前菜单 */
        $this->setMemberCurMenu('member_information');
        /* 设置买家当前栏目 */
        $this->setMemberCurItem('more');

        View::assign('menu_sign', 'profile');
        View::assign('menu_sign_url', (string) url('Memberinformation/index'));
        View::assign('menu_sign1', 'baseinfo');
        return View::fetch($this->template_dir . 'more');
    }

    public function upload() {
        if (!request()->isPost()) {
            $this->redirect('memberinformation/avatar');
        }
        $member_id = session('member_id');

        //上传图片

        if (!empty($_FILES['pic']['tmp_name'])) {
            $file_name = "avatar_" . session('member_id') . ".jpg";

            $res = ds_upload_pic(ATTACH_AVATAR, 'pic', $file_name);
            if ($res['code']) {
                $file_name = $res['data']['file_name'];
                model('member')->editMember(array('member_id' => session('member_id')), array('member_avatar' => $file_name), session('member_id'));
                session('avatar', $file_name);
                /* 设置买家当前菜单 */
                $this->setMemberCurMenu('member_information');
                /* 设置买家当前栏目 */
                $this->setMemberCurItem('avatar');
                View::assign('menu_sign', 'profile');
                View::assign('menu_sign_url', "{:(string)url('Memberinformation/index')}");
                View::assign('menu_sign1', 'avatar');

                return View::fetch($this->template_dir . 'avatar');
            } else {
                $this->error($res['msg']);
            }
        } else {
            $this->error(lang('upload_failed_replace_pictures'));
        }
    }



    /**
     * 更换头像
     *
     * @param
     * @return
     */
    public function avatar() {
        $member_info = model('member')->getMemberInfoByID(session('member_id'));
        View::assign('member_avatar', $member_info['member_avatar']);
        /* 设置买家当前菜单 */
        $this->setMemberCurMenu('member_information');
        /* 设置买家当前栏目 */
        $this->setMemberCurItem('avatar');

        View::assign('menu_sign', 'profile');
        View::assign('menu_sign_url', (string) url('Memberinformation/index'));
        View::assign('menu_sign1', 'avatar');
        View::assign('newfile', '');
        return View::fetch($this->template_dir . 'avatar');
    }

    /**
     * 用户中心右边，小导航
     *
     * @param string $menu_type 导航类型
     * @param string $menu_key 当前导航的menu_key
     * @return
     */
    public function getMemberItemList() {
        $menu_array = array(
            array(
                'name' => 'member',
                'text' => lang('home_member_base_infomation'),
                'url' => (string) url('Memberinformation/index')
            ),
            array(
                'name' => 'more',
                'text' => lang('home_member_more'),
                'url' => (string) url('Memberinformation/more')
            ),
            array(
                'name' => 'avatar',
                'text' => lang('home_member_modify_avatar'),
                'url' => (string) url('Memberinformation/avatar')
            )
        );

        return $menu_array;
    }

}