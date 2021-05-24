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
class Searchlog extends BaseModel {

    public $page_info;

    /**
     * 新增历史搜索
     * @author csdeshang
     * @param array $data 参数内容
     * @return bool 布尔类型的返回结果
     */
    public function addSearchlog($data) {
        return Db::name('goods_searchlog')->insertGetId($data);
    }

    public function getOneSearchlog($condition = array()) {
        return Db::name('goods_searchlog')->where($condition)->find();
    }

    /**
     * 根据条件查询多条记录
     * @author csdeshang
     * @param array $condition 查询条件
     * @param string $field 字段
     * @param int $limit 数量限制
     * @param str $orderby 排序
     * @return array 二维数组
     */
    public function getSearchlogList($condition = array(), $field, $group = 'searchname', $limit = 0,  $orderby = 'log_id desc') {
        if ($limit>0) {
            return Db::name('goods_searchlog')->field($field)->where($condition)->group($group)->limit($limit)->order($orderby)->select()->toArray();
        } else {
            return Db::name('goods_searchlog')->field($field)->where($condition)->order($orderby)->select()->toArray();
        }
    }

    /**
     * 更新历史搜索
     * @author csdeshang
     * @param array $data 更新内容
     * @return bool
     */
    public function editSearchlog($log_id,$data) {
        return Db::name('goods_searchlog')->where('log_id', $log_id)->update($data);
    }



}

?>
