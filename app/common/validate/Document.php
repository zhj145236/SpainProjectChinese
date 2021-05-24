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
class  Document extends Validate
{
    protected $rule = [
        'document_title'=>'require',
        'document_content'=>'require'
    ];
    protected $message = [
        'document_title.require'=>'文章标题不能为空',
        'document_content.require'=>'文章内容不能为空'
    ];
    protected $scene = [
        'edit' => ['document_title', 'document_content'],
    ];
}