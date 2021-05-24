<?php

namespace app\common\model;
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
 * 数据层模型
 */
class Banks extends BaseModel {
    
public $page_info;
    /**
     * 添加银行
     * @access public
     * @author csdeshang 
     * @param array $data 参数内容
     * @return boolean
     */
    public function addBanks($data) {
        return Db::name('banks')->insertGetId($data);
    }
    
    /**
     * 编辑银行
     * @access public
     * @author csdeshang 
     * @param array $condition 检索条件
     * @param array $update 更新数据
     * @return boolean
     */
    public function editBanks($condition, $update) {
        return Db::name('banks')->where($condition)->update($update);
    }
    
    /**
     * 删除银行
     * @access public
     * @author csdeshang
     * @param array $condition 检索条件
     * @return boolean
     */
    public function delBanks($condition) {
        $banks_array = $this->getBanksList($condition, 'banks_id,banks_pic');
        $banksid_array = array();
        foreach ($banks_array as $value) {
            $banksid_array[] = $value['banks_id'];
            @unlink(BASE_UPLOAD_PATH. DIRECTORY_SEPARATOR .ATTACH_BANKS. DIRECTORY_SEPARATOR .$value['banks_pic']);
        }
        return Db::name('banks')->where('banks_id','in',$banksid_array)->delete();
    }
    
    /**
     * 查询银行数量
     * @access public
     * @author csdeshang
     * @param array $condition 检索条件
     * @return array
     */
    public function getBanksCount($condition) {
        return Db::name('banks')->where($condition)->count();
    }
    
    /**
     * 银行列表
     * @access public
     * @author csdeshang 
     * @param array $condition 检索条件
     * @param str $field 字段
     * @param int $pagesize 分页信息
     * @param str $order 排序
     * @return array
     */
    public function getBanksList($condition, $field = '*', $pagesize = 0, $order = 'banks_id desc') {
        if($pagesize) {
            $res= Db::name('banks')->where($condition)->field($field)->order($order)->paginate(['list_rows'=>$pagesize,'query' => request()->param()],false);
            $this->page_info=$res;
            return $res->items();
        }else{
            return Db::name('banks')->where($condition)->field($field)->order($order)->select()->toArray();
        }
    }
    
    /**
     * 取单个银行内容
     * @access public
     * @author csdeshang 
     * @param array $condition 检索条件
     * @param string $field 字段
     * @return array
     */
    public function getBanksInfo($condition, $field = '*') {
        return Db::name('banks')->field($field)->where($condition)->find();
    }
}
?>
