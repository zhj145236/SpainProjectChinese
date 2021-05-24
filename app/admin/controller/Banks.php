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
class Banks extends AdminControl {

    const EXPORT_SIZE = 1000;

    public function initialize() {
        parent::initialize();
        Lang::load(base_path() . 'admin/lang/' . config('lang.default_lang') . '/banks.lang.php');
    }

    /**
     * 银行列表
     */
    public function index() {
        $banks_model = model('banks');
        /**
         * 检索条件
         */
        if (!empty(input('param.search_banks_name'))) {
            $condition[] = array('banks_name', 'like', "%" . input('param.search_banks_name') . "%");
        }
        $condition[] = array('banks_apply', '=', '1');
        $banks_list = $banks_model->getBanksList($condition, "*", 10);
        View::assign('showpage', $banks_model->page_info->render());
        View::assign('banks_list', $banks_list);
        View::assign('search_banks_name', trim(input('param.search_banks_name')));
        $this->setAdminCurItem('index');
        return View::fetch();
    }

    /**
     * 增加银行
     */
    public function banks_add() {

        $banks_model = model('banks');
        if (request()->isPost()) {
            $insert_array = array();
            if (!empty($_FILES['_pic']['name'])) {
                $res=ds_upload_pic(ATTACH_BANKS,'_pic');
                if($res['code']){
                    $banks_pic=$res['data']['file_name'];
                }else{
                    $this->error($res['msg']);
                }
            }
            $insert_array['banks_name'] = trim(input('post.banks_name'));
            $insert_array['banks_url'] = trim(input('post.banks_url'));
            if (!empty($banks_pic)) {
                $insert_array['banks_pic'] = $banks_pic;
            }else{
                $this->error(lang('banks_add_picsign_null'));
            }
            $insert_array['banks_state'] = trim(input('post.banks_state'));
            $result = $banks_model->addBanks($insert_array);
            if ($result) {
                $this->log(lang('ds_add') . lang('banks_index_manage') . '[' . input('post.banks_name') . ']', 1);
                dsLayerOpenSuccess(lang('ds_common_save_succ'));
            } else {
                $this->error(lang('ds_common_save_fail'));
            }
        } else {
            $banks_array = [
                'banks_id' => '',
                'banks_name' => '',
                'banks_pic' => '',
                'banks_url' => '',
                'banks_state' => '1',
            ];
            View::assign('banks_array', $banks_array);
            return View::fetch('form');
        }
    }

    /**
     * 银行编辑
     */
    public function banks_edit() {
        $banks_model = model('banks');

        if (request()->isPost()) {
            if (!empty($_FILES['_pic']['name'])) {
                $res=ds_upload_pic(ATTACH_BANKS,'_pic');
                if($res['code']){
                    $banks_pic=$res['data']['file_name'];
                }else{
                    $this->error($res['msg']);
                }
            }
            $banks_info = $banks_model->getBanksInfo(array('banks_id' => intval(input('post.banks_id'))));
            $condition = array();
            $condition[] = array('banks_id', '=', intval(input('post.banks_id')));
            $update_array = array();
            $update_array['banks_name'] = trim(input('post.banks_name'));
            $update_array['banks_url'] = trim(input('post.banks_url'));
            if (!empty($banks_pic)) {
                $update_array['banks_pic'] = $banks_pic;
            }
            $update_array['banks_state'] = intval(input('post.banks_state'));
            $result = $banks_model->editBanks($condition, $update_array);
            if ($result >= 0) {
                if (!empty(input('post.banks_pic')) && !empty($banks_info['banks_pic'])) {
                    @unlink(BASE_UPLOAD_PATH . DIRECTORY_SEPARATOR . ATTACH_BANKS . DIRECTORY_SEPARATOR . $banks_info['banks_pic']);
                }
                $this->log(lang('ds_edit') . lang('banks_index_manage') . '[' . input('post.banks_name') . ']', 1);
                dsLayerOpenSuccess(lang('ds_common_save_succ'));
            } else {
                $this->log(lang('ds_edit') . lang('banks_index_manage') . '[' . input('post.banks_name') . ']', 0);
                $this->error(lang('ds_common_save_fail'));
            }
        } else {
            $banks_info = $banks_model->getBanksInfo(array('banks_id' => intval(input('param.banks_id'))));
            if (empty($banks_info)) {
                $this->error(lang('param_error'));
            }
            View::assign('banks_array', $banks_info);
            return View::fetch('form');
        }
    }

    /**
     * 删除银行
     */
    public function banks_del() {
        $banks_id = input('param.banks_id');
        $banksid_array = ds_delete_param($banks_id);
        if ($banksid_array == FALSE) {
            $this->log(lang('ds_del') . lang('banks_index_manage') . '[ID:' . $banks_id . ']', 0);
            ds_json_encode(10001, lang('param_error'));
        }
        $banks_mod = model('banks');
        $condition = array();
        $condition[] = array('banks_id', 'in', $banksid_array);
        $banks_mod->delBanks($condition);
        $this->log(lang('ds_del') . lang('banks_index_manage') . '[ID:' . $banks_id . ']', 1);
        ds_json_encode(10000, lang('ds_common_del_succ'));
    }

    /**
     * ajax操作
     */
    public function ajax() {
        $banks_model = model('banks');
        switch (input('param.branch')) {
            /**
             * 银行名称
             */
            case 'banks_name':
                /**
                 * 判断是否有重复
                 */
                $condition[] = array('banks_name', '=', trim(input('param.value')));
                $condition[] = array('banks_id', '<>', intval(input('param.id')));
                $result = $banks_model->getBanksList($condition);
                if (empty($result)) {
                    $banks_model->editBanks(array('banks_id' => intval(input('param.id'))), array('banks_name' => trim(input('param.value'))));
                    $this->log(lang('ds_edit') . lang('banks_index_name') . '[' . input('param.value') . ']', 1);
                    echo 'true';
                    exit;
                } else {
                    echo 'false';
                    exit;
                }
                break;
            /**
             * 银行状态 排序
             */
            case 'banks_sort':
            case 'banks_state':
                $banks_model->editBanks(array('banks_id' => intval(input('param.id'))), array(input('param.column') => trim(input('param.value'))));
                $detail_log = str_replace(array(
                    'banks_sort', 'banks_state'
                        ), array(
                    lang('ds_sort'), lang('ds_state')
                        ), input('param.branch'));
                $this->log(lang('ds_edit') . lang('banks_index_manage') . $detail_log . '[ID:' . intval(input('param.id')) . ')', 1);
                echo 'true';
                exit;
                break;
            /**
             * 验证银行名称是否有重复
             */
            case 'check_banks_name':
                $condition[] = array('banks_name', '=', trim(input('param.banks_name')));
                $condition[] = array('banks_id', '<>', intval(input('param.id')));
                $result = $banks_model->getBanksList($condition);
                if (empty($result)) {
                    echo 'true';
                    exit;
                } else {
                    echo 'false';
                    exit;
                }
                break;
        }
    }

    /**
     * 获取卖家栏目列表,针对控制器下的栏目
     */
    protected function getAdminItemList() {
        $menu_array = array(
            array(
                'name' => 'index',
                'text' => lang('ds_manage'),
                'url' => (string) url('Banks/index'),
            ),
            array(
                'name' => 'banks_add',
                'text' => lang('ds_add'),
                'url' => "javascript:dsLayerOpen('" . (string) url('Banks/banks_add') . "','" . lang('ds_add') . "')"
            )
        );
        return $menu_array;
    }

}
