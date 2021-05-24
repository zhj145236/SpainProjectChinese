<?php
namespace app\common\validate;
use think\Validate;
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
 * 验证器
 */
class  Memberbank extends Validate
{
    protected $rule = [
        'memberbank_type'=>'require',
        'memberbank_truename'=>'require',
        'memberbank_no'=>'require',

    ];
    protected $message = [
        'memberbank_type.require'=>'账户类型不能为空',
        'memberbank_truename.require'=>'开户名不能为空',
        'memberbank_no.require'=>'账号不能为空',

    ];
    protected $scene = [
        'add' => ['memberbank_type', 'memberbank_truename', 'memberbank_no'],
        'edit' => ['memberbank_type', 'memberbank_truename', 'memberbank_no'],
    ];


}