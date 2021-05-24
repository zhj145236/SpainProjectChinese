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
class  VerifyCode extends Validate
{
    protected $rule = [
        'verify_code'=>'require|length:6',
        'verify_code_type'=>'require|in:1,2,3',
    ];

    protected $message  =   [
        'verify_code.require' => '验证码必填',
        'verify_code.length' => '验证码长度为6位',
				'verify_code_type.require' => '验证码类型必填',
        'verify_code_type.in' => '验证码类型错误',
        
    ];
    protected $scene = [
        'verify_code_search' => ['verify_code'],
        'verify_code_send' => ['verify_code_type'],
    ];
}