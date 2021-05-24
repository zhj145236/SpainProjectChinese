<?php
/*
 * 根据文字生成对应图片
 */
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
class Pnum extends BaseMall {

    public function index() {
        $pnum = input('get.pnum');
        $im = imagecreate(120, 16);
        $bg = imagecolorallocate($im, 247, 247, 247);
        $textcolor = imagecolorallocate($im, 101, 101, 101);
        imagestring($im, 5, 0, 0, $pnum, $textcolor);
        header("Content-type: image/png");
        imagepng($im);
    }

}
