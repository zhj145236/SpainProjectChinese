<?php /*a:7:{s:81:"D:\wwwroot\shops.domibuy.com\app\home\view\default\store\default\goods\goods.html";i:1616077822;s:70:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\base_home.html";i:1612516962;s:69:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\mall_top.html";i:1612516962;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\mall_header.html";i:1612516962;s:86:"D:\wwwroot\shops.domibuy.com\app\home\view\default\store\default\store\store_info.html";i:1612516963;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\mall_server.html";i:1612516962;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\mall_footer.html";i:1612516962;}*/ ?>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><?php echo htmlentities((isset($html_title) && ($html_title !== '')?$html_title:config('ds_config.site_name'))); ?></title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand" />
        <meta name="keywords" content="<?php echo htmlentities((isset($seo_keywords) && ($seo_keywords !== '')?$seo_keywords:'')); ?>" />
        <meta name="description" content="<?php echo htmlentities((isset($seo_description) && ($seo_description !== '')?$seo_description:'')); ?>" />
        <link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/common.css">
        <link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/home_header.css">
        <script>
            var BASESITEROOT = "<?php echo htmlentities(BASE_SITE_ROOT); ?>";
            var HOMESITEROOT = "<?php echo htmlentities(HOME_SITE_ROOT); ?>";
            var BASESITEURL = "<?php echo htmlentities(BASE_SITE_URL); ?>";
            var HOMESITEURL = "<?php echo htmlentities(HOME_SITE_URL); ?>";
            var TIMESTAMP = "<?php echo htmlentities(TIMESTAMP); ?>";
        </script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery-2.1.4.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/common.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery-ui.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery.ui.datepicker-zh-CN.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.validate.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/additional-methods.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/layer/layer.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
    </head>
    <body>
        <div id="append_parent"></div>
        <div id="ajaxwaitid"></div>
        <!-- <?php if($adv_top): ?>
        <div style="background:<?php echo htmlentities((isset($adv_top['adv_bgcolor']) && ($adv_top['adv_bgcolor'] !== '')?$adv_top['adv_bgcolor']:'')); ?>;">
            <div class="w1200">
                <a href="<?php echo url('Advclick/Advclick',['adv_id'=>$adv_top['adv_id']]); ?>"  title="<?php echo htmlentities($adv_top['adv_title']); ?>"><img src="<?php echo ds_get_pic(ATTACH_ADV,$adv_top['adv_code']); ?>" width="1200"/></a>
            </div>
        </div>
        <?php endif; ?> -->
        <div class="public-top">
            <div class="w1200">
                <span class="top-link">
                    <?php echo htmlentities(lang('welcome_to')); ?> <em><?php echo htmlentities(config('ds_config.site_name')); ?></em>
                </span>
                <ul class="login-regin">
                    <?php if(session('member_id')): ?>
                    <li class="line"> <a href="<?php echo url('Member/index'); ?>"><?php echo session('member_name'); ?></a></li>
                    <li> <a href="<?php echo url('Login/Logout'); ?>"><?php echo htmlentities(lang('exit')); ?></a></li>
                    <?php else: ?>
                    <li class="line"> <a href="<?php echo url('Login/login'); ?>"><?php echo htmlentities(lang('please_log')); ?></a></li>
                    <li> <a href="<?php echo url('Login/register'); ?>"><?php echo htmlentities(lang('free_registration')); ?></a></li>
                    <?php endif; ?>
                </ul>
                <ul class="quick_list">
                    <li>
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <a href="<?php echo url('Member/index'); ?>"><?php echo htmlentities(lang('ds_user_center')); ?><b></b></a>
                        <div class="dropdown-menu">
                            <ol>
                                <li><a href="<?php echo url('Memberorder/index'); ?>"><?php echo htmlentities(lang('ds_buying_goods')); ?></a></li>
                                <li><a href="<?php echo url('Memberfavorites/fglist'); ?>"><?php echo htmlentities(lang('ds_care_about')); ?></a></li>
                                <li><a href="<?php echo url('Memberfavorites/fslist'); ?>"><?php echo htmlentities(lang('ds_the_shop')); ?></a></li>
                            </ol>
                        </div>
                    </li>
                    <li>
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <a href="<?php echo url('Seller/index'); ?>"><?php echo htmlentities(lang('business_center')); ?><b></b></a>
                        <div class="dropdown-menu">
                            <ol>
                                <?php if(session('seller_id')): ?>
                                <li><a href="<?php echo url('Seller/index'); ?>"><?php echo htmlentities(lang('ds_shop_overview')); ?></a></li>
                                <li><a href="<?php echo url('Sellerorder/index'); ?>"><?php echo htmlentities(lang('ds_member_path_store_order')); ?></a></li>
                                <li><a href="<?php echo url('Sellergoodsonline/index'); ?>"><?php echo htmlentities(lang('promotion_goods_manage')); ?></a></li>
                                <?php else: if(config('ds_config.store_joinin_open')!=0): ?>
                                <li><a href="<?php echo url('Showjoinin/index'); ?>"><?php echo htmlentities(lang('tenants')); ?></a></li>
                                <?php endif; ?>
                                <li><a href="<?php echo url('Sellerlogin/login'); ?>"><?php echo htmlentities(lang('merchant_login')); ?></a></li>
                                <?php endif; ?>
                            </ol>
                        </div>
                    </li>
                    <li>
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <a href="<?php echo url('Memberfavorites/fglist'); ?>"><?php echo htmlentities(lang('ds_favorites')); ?><b></b></a>
                        <div class="dropdown-menu">
                            <ol>
                                <li><a href="<?php echo url('Memberfavorites/fglist'); ?>"><?php echo htmlentities(lang('ds_merchandise_collection')); ?></a></li>
                                <li><a href="<?php echo url('Memberfavorites/fslist'); ?>"><?php echo htmlentities(lang('ds_store_collect')); ?></a></li>
                            </ol>
                        </div>
                    </li>
                    <!-- <li>
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <a href="javascript:void(0)"><?php echo htmlentities(lang('ds_fast_nav')); ?><b></b></a>
                        <div class="dropdown-menu">
                            <ol>
                                <?php foreach($navs['header'] as $nav): ?>
                                <li>
                                    <a href="<?php echo htmlentities($nav['nav_url']); ?>" <?php if($nav['nav_new_open'] == 1): ?><?php endif; ?>><?php echo htmlentities($nav['nav_title']); ?></a>
                                </li>
                                <?php endforeach; ?>
                            </ol>
                        </div>
                    </li> -->
                    <li class="moblie-qrcode">
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <a href="javascript:void(0)"><?php echo htmlentities(lang('wechat_end')); ?></a>
                        <div class="dropdown-menu">
                            <img src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logowx')); ?>" width="90" height="90" />
                        </div>
                    </li>
                    <!--
                    <li class="app-qrcode">
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <a href="javascript:void(0)">APP</a>
                        <div class="dropdown-menu">
                            <img width="90" height="90" src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logowx')); ?>" />
                            <h3>扫描二维码</h3>
                            <p>下载手机客户端</p>
                        </div>
                    </li>
                    -->
                </ul>
            </div>
        </div>
        
        
        
        <!--左侧导航栏-->
<div class="ds-appbar">
    <div class="ds-appbar-tabs" id="appBarTabs">
        <?php if(session('is_login')): ?>
        <div class="user" dstype="a-barUserInfo">
            <div class="avatar"><img src="<?php echo get_member_avatar(session('avatar')); ?>?<?php echo htmlentities(TIMESTAMP); ?>"/></div>
            <p><?php echo htmlentities(lang('sns_me')); ?></p>
        </div>
        <div class="user-info" dstype="barUserInfo" style="display:none;"><i class="arrow"></i>
            <div class="avatar"><img src="<?php echo get_member_avatar(session('avatar')); ?>?<?php echo htmlentities(TIMESTAMP); ?>"/></div>
            <dl>
                <dt>Hi, <?php echo session('member_nickname'); ?></dt>
                <dd><?php echo htmlentities(lang('ds_current_level')); ?>：<strong dstype="barMemberGrade"><?php echo session('level_name'); ?></strong></dd>
                <dd><?php echo htmlentities(lang('ds_current_experience')); ?>：<strong dstype="barMemberExp"><?php echo session('member_exppoints'); ?></strong></dd>
            </dl>
        </div>
       <?php else: ?>
        <div class="user TA_delay" dstype="a-barLoginBox">
            <div class="avatar TA"><img src="<?php echo get_member_avatar(session('avatar')); ?>?<?php echo htmlentities(TIMESTAMP); ?>"/></div>
            <p class="TA"><?php echo htmlentities(lang('login_notlogged')); ?></p>
        </div>
        <?php endif; ?>
        <ul class="tools">
            <?php if(config('ds_config.node_site_use') == '1'): ?>
            <li><a href="javascript:void(0);" id="chat_show_user" class="chat TA_delay"><span class="iconfont">&#xe71b;</span><span class="tit"><?php echo htmlentities(lang('ds_chat')); ?></span><i id="new_msg" class="new_msg" style="display:none;"></i></a></li>
            <?php endif; ?>
            <li><a href="javascript:void(0);" onclick="toglle_bar('rtoolbar_cart')" id="rtoolbar_cart" class="cart TA_delay"><span class="iconfont">&#xe69a;</span><span class="tit"><?php echo htmlentities(lang('ds_cart')); ?></span><i id="rtoobar_cart_count" class="new_msg" style="display:none;"></i></a></li>
            <!-- <li><a href="javascript:void(0);" onclick="toglle_bar('compare')" id="compare" class="compare TA_delay"><span class="iconfont">&#xe74a;</span><span class="tit"><?php echo htmlentities(lang('ds_comparison')); ?></span></a></li> -->
            <li>
                <a href="javascript:void(0);" id="qrcode" class="qrcode TA_delay"><span class="iconfont">&#xe72d;</span>
                    <span class="tit-box">
                        <?php echo htmlentities(lang('ds_mobile_shopping_better')); ?><br>
                        <!-- <img src="<?php echo htmlentities(HOME_SITE_URL); ?>/qrcode?url=<?php echo htmlentities(config('ds_config.h5_site_url')); ?>" width="110" height="110" /> -->
                        <img src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logowx')); ?>" width="110" height="110" />
                        <em class="tips_arrow"></em>
                    </span>
                </a>
            </li>
            <li><a href="javascript:void(0);" onclick="$('html,body').animate({scrollTop: '0px'}, 500)" id="gotop" class="gotop TA_delay" style="position: fixed;bottom: 0"><span class="iconfont">&#xe724;</span><span class="tit"><?php echo htmlentities(lang('ds_top')); ?></span></a></li>
        </ul>
        <div class="content-box" id="content-compare">
            <div class="top">
                <h3><?php echo htmlentities(lang('ds_comparison')); ?></h3>
                <a href="javascript:void(0);" class="close iconfont" title="<?php echo htmlentities(lang('ds_hidden')); ?>">&#xe73d;</a></div>
            <div id="comparelist"></div>
        </div>
        <div class="content-box" id="content-cart">
            <div class="top">
                <h3><?php echo htmlentities(lang('ds_my_shopping_cart')); ?></h3>
                <a href="javascript:void(0);" class="close iconfont" title="<?php echo htmlentities(lang('ds_hidden')); ?>">&#xe73d;</a></div>
            <div id="rtoolbar_cartlist"></div>
        </div>
    </div>
</div>
        
<script type="text/javascript">

    //动画显示边条内容区域
    $(function() {
        $(".close").click(function(){
            close_bar();
        });
        // 右侧bar用户信息
        $('div[dstype="a-barUserInfo"]').click(function(){
            $('div[dstype="barUserInfo"]').toggle();
        });
        // 右侧bar登录
        $('div[dstype="a-barLoginBox"]').click(function(){
            login_dialog();
        });

        <?php if($cart_goods_num > 0): ?>
            $('#rtoobar_cart_count').html(<?php echo htmlentities($cart_goods_num); ?>).show();
        <?php endif; ?>
    });
    function toglle_bar(item){
           var member_id = "<?php echo session('member_id'); ?>";
              if(member_id == ''){
                   login_dialog();
                  return;
              }
        //判断侧边栏是否已拉出
        if(parseInt($('.ds-appbar').css('width')) == 36){
            $('.ds-appbar').css('width','306px');
        }
        //判断选中项是否已显示
        if(!$("#"+item).hasClass('active')){
            $('.tools li > a').removeClass('active');
            $("#"+item).addClass('active');
            $('.content-box').removeClass('active');
            
            switch(item){
                case 'rtoolbar_cart':
                    $("#rtoolbar_cartlist").load("<?php echo url('Cart/ajax_load',['type'=>'html']); ?>");
                    $("#content-cart").addClass('active');
                    break;
                case 'compare':   
                    loadCompare(false);
                    $("#content-compare").addClass('active');
                    break;
            }
        }else{
            //关闭
            close_bar();
            $(".chat-list").css("display",'none');
        }
        
    }
    function close_bar(){
        $('.tools li > a').removeClass('active');
        $('.content-box').removeClass('active');
        $('.ds-appbar').css('width','36px');
    }
</script> 

<link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/home.css">
<div class="header clearfix">
    <div class="w1200">
        <div class="logo">
            <a href="<?php echo htmlentities(HOME_SITE_URL); ?>"><img src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logo')); ?>"/></a>
        </div>
        <div class="top_search">
            <div class="top_search_box">
                <div id="search">
                    <ul class="tab" dstype="<?php echo htmlentities(app('request')->controller()); ?>">
                        <li class="current"><span><?php echo htmlentities(lang('site_search_goods')); ?></span><i class="arrow"></i></li>
                        <!-- <li style="display: none;"><span><?php echo htmlentities(lang('site_search_store')); ?></span></li> -->
                    </ul>
                </div>
                <div class="form_fields">
                    <form class="search-form" id="search-form" method="get" action="<?php echo url('Search/goods'); ?>">
                        <input placeholder="<?php echo htmlentities(lang('search_merchandise_keywords')); ?>" name="keyword" id="keyword" type="text" class="keyword" value="<?php echo htmlentities(app('request')->param('keyword')); ?>" maxlength="60" />
                        <input type="submit" id="button" value="<?php echo htmlentities(lang('ds_common_search')); ?>" class="submit">
                    </form>
                </div>
            </div>
            <ul class="top_search_keywords">
                <?php if(is_array($hot_search) || $hot_search instanceof \think\Collection || $hot_search instanceof \think\Paginator): if( count($hot_search)==0 ) : echo "" ;else: foreach($hot_search as $hot_k=>$hot_keyword): ?>
                <li <?php if($hot_k==0): ?>class="first"<?php endif; ?>><a href="<?php echo htmlentities(HOME_SITE_URL); ?>/Search/index.html?keyword=<?php echo htmlentities($hot_keyword); ?>"><?php echo htmlentities($hot_keyword); ?></a></li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
        <div class="user_menu">
            <dl class="my-mall">
                <dt><span class="ico iconfont">&#xe702;</span><?php echo htmlentities(lang('ds_user_center')); ?><i class="arrow"></i></dt>
                <dd>
                    <div class="sub-title">
                        <h4></h4>
                        <a href="<?php echo url('Member/index'); ?>" class="arrow"><?php echo htmlentities(lang('ds_my_user_center')); ?><i></i></a>
                    </div>
                    <div class="user-centent-menu">
                        <ul>
                            <li><a href="<?php echo url('Membermessage/message'); ?>"><?php echo htmlentities(lang('ds_message')); ?>(<span><?php if(session('member_id')): ?><?php echo htmlentities((isset($message_num) && ($message_num !== '')?$message_num:0)); else: ?>0<?php endif; ?></span>)</a></li>
                            <li><a href="<?php echo url('Memberorder/index'); ?>" class="arrow"><?php echo htmlentities(lang('ds_my_order')); ?><i></i></a></li>
                            <li><a href="<?php echo url('Memberconsult/index'); ?>"><?php echo htmlentities(lang('ds_consulting_reply')); ?>(<span id="member_consult">0</span>)</a></li>
                            <li><a href="<?php echo url('Memberfavorites/fglist'); ?>" class="arrow"><?php echo htmlentities(lang('ds_favorites')); ?><i></i></a></li>
                            <li><a href="<?php echo url('Membervoucher/index'); ?>"><?php echo htmlentities(lang('ds_vouchers')); ?>(<span id="member_voucher">0</span>)</a></li>
                            <li><a href="<?php echo url('Memberpoints/index'); ?>" class="arrow"><?php echo htmlentities(lang('ds_my_points')); ?><i></i></a></li>
                        </ul>
                    </div>
                    <div class="browse-history">
                        <div class="part-title">
                            <h4><?php echo htmlentities(lang('ds_recently_browsed_items')); ?></h4>
                            <span style="float:right;"><a href="<?php echo url('Membergoodsbrowse/listinfo'); ?>"><?php echo htmlentities(lang('ds_full_history')); ?></a></span>
                        </div>
                        <ul>
                            <li class="no-goods"><img class="loading" src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/loading.gif"></li>
                        </ul>
                    </div>
                </dd>
            </dl>
            <dl class="my-cart">
                <dt><span class="ico iconfont">&#xe69a;</span><?php echo htmlentities(lang('ds_shopping_cart_settlement')); ?><i class="arrow"></i></dt>
                <dd>
                    <div class="sub-title">
                        <h4><?php echo htmlentities(lang('ds_latest_additions')); ?></h4>
                    </div>
                    <div class="incart-goods-box">
                        <div class="incart-goods"><div class="no-order"><span><?php echo htmlentities(lang('ds_shopping_cart_empty')); ?></span></div></div>
                    </div>
                    <div class="checkout"> <span class="total-price"></span><a href="<?php echo url('Cart/index'); ?>" class="btn-cart"><?php echo htmlentities(lang('ds_checkout_cart')); ?></a> </div>
                </dd>
                <div class="addcart-goods-num"><?php echo htmlentities($cart_goods_num); ?></div>
            </dl>
        </div>
    </div>
</div>


<div class="mall_nav">
    <div class="w1200">
        <div class="all_categorys">
            <div class="mt">
                <i></i>
                <h3><a href="<?php echo url('Category/goods'); ?>"><?php echo htmlentities(lang('ds_all_commodity_classes')); ?></a></h3>
            </div>
            <div class="mc">
                <ul class="menu">
                    <?php if(!(empty($header_categories) || (($header_categories instanceof \think\Collection || $header_categories instanceof \think\Paginator ) && $header_categories->isEmpty()))): $i = 0; if(is_array($header_categories) || $header_categories instanceof \think\Collection || $header_categories instanceof \think\Paginator): if( count($header_categories)==0 ) : echo "" ;else: foreach($header_categories as $key=>$val): $i++; ?>
                    <li cat_id="<?php echo htmlentities($val['gc_id']); ?>" <?php if($i>11): ?>style="display:none;"<?php endif; ?>>
                        <div class="class">
                            <span class="arrow"></span>
                            <?php if(!(empty($val['pic']) || (($val['pic'] instanceof \think\Collection || $val['pic'] instanceof \think\Paginator ) && $val['pic']->isEmpty()))): ?>
                            <span class="ico"><img src="<?php echo htmlentities($val['pic']); ?>"></span>
                            <?php else: ?>
                            <span class="iconfont category-ico-<?php echo htmlentities($i); ?>"></span>
                            <?php endif; ?>
                            <h4><a href="<?php echo url('Search/index',['cate_id'=>$val['gc_id']]); ?>"><?php echo htmlentities($val['gc_name']); ?></a></h4>
                        </div>
                        <div class="sub-class" cat_menu_id="<?php echo htmlentities($val['gc_id']); ?>">
                            <div class="sub-class-content">
                                <div class="recommend-class">
                                    <?php if(!(empty($val['cn_classs']) || (($val['cn_classs'] instanceof \think\Collection || $val['cn_classs'] instanceof \think\Paginator ) && $val['cn_classs']->isEmpty()))): if(is_array($val['cn_classs']) || $val['cn_classs'] instanceof \think\Collection || $val['cn_classs'] instanceof \think\Paginator): if( count($val['cn_classs'])==0 ) : echo "" ;else: foreach($val['cn_classs'] as $k=>$v): ?>
                                    <span><a href="<?php echo url('Search/index',['cate_id'=>$v['gc_id']]); ?>" title="<?php echo htmlentities($v['gc_name']); ?>"><?php echo htmlentities($v['gc_name']); ?></a></span>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                    <?php endif; ?>
                                </div>
                                <?php if(!(empty($val['class2']) || (($val['class2'] instanceof \think\Collection || $val['class2'] instanceof \think\Paginator ) && $val['class2']->isEmpty()))): if(is_array($val['class2']) || $val['class2'] instanceof \think\Collection || $val['class2'] instanceof \think\Paginator): if( count($val['class2'])==0 ) : echo "" ;else: foreach($val['class2'] as $k=>$v): ?>
                                <dl>
                                    <dt>
                                    <h3><a href="<?php echo url('Search/index',['cate_id'=>$v['gc_id']]); ?>"><?php echo htmlentities($v['gc_name']); ?></a></h3>
                                    </dt>
                                    <dd class="goods-class">
                                        <?php if(!(empty($v['class3']) || (($v['class3'] instanceof \think\Collection || $v['class3'] instanceof \think\Paginator ) && $v['class3']->isEmpty()))): if(is_array($v['class3']) || $v['class3'] instanceof \think\Collection || $v['class3'] instanceof \think\Paginator): if( count($v['class3'])==0 ) : echo "" ;else: foreach($v['class3'] as $k3=>$v3): ?>
                                        <a href="<?php echo url('Search/index',['cate_id'=>$v3['gc_id']]); ?>"><?php echo htmlentities($v3['gc_name']); ?></a>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                        <?php endif; ?>
                                    </dd>
                                </dl>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                                <?php endif; ?>
                            </div>
                            <div class="sub-class-right">
                                <?php if(!(empty($val['cn_brands']) || (($val['cn_brands'] instanceof \think\Collection || $val['cn_brands'] instanceof \think\Paginator ) && $val['cn_brands']->isEmpty()))): ?>
                                <div class="brands-list">
                                    <ul>
                                        <?php if(is_array($val['cn_brands']) || $val['cn_brands'] instanceof \think\Collection || $val['cn_brands'] instanceof \think\Paginator): if( count($val['cn_brands'])==0 ) : echo "" ;else: foreach($val['cn_brands'] as $key=>$brand): ?>
                                        <li>
                                            <a href="<?php echo url('Brand/brand_goods',['brand_id'=>$brand['brand_id']]); ?>" title="<?php echo htmlentities($brand['brand_name']); ?>"><?php if(($brand['brand_pic'] != '')): ?><img src="<?php echo brand_image($brand['brand_pic']); ?>"/><?php endif; ?>
                                                <span><?php echo htmlentities($brand['brand_name']); ?></span>
                                            </a>
                                        </li>
                                       <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </ul>
                                </div>
                                <?php endif; ?>
                                <div class="adv-promotions">
                                    <?php if(isset($val['goodscn_adv1']) && $val['goodscn_adv1'] != ''): ?>
                                    <a <?php if($val['goodscn_adv1_link'] == ''): ?>href="javascript:;"<?php else: ?> href="<?php echo htmlentities($val['goodscn_adv1_link']); ?><?php endif; ?>><img src="<?php echo htmlentities($val['goodscn_adv1']); ?>" data-url="<?php echo htmlentities($val['goodscn_adv1']); ?>" class="scrollLoading" /></a>
                                    <?php endif; if(isset($val['goodscn_adv2']) && $val['goodscn_adv2'] != ''): ?>
                                    <a <?php if($val['goodscn_adv2_link'] == ''): ?>href="javascript:;"<?php else: ?> href="<?php echo htmlentities($val['goodscn_adv2_link']); ?><?php endif; ?>><img src="<?php echo htmlentities($val['goodscn_adv2']); ?>" data-url="<?php echo htmlentities($val['goodscn_adv2']); ?>" class="scrollLoading" /></a>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
        <div class="nav_list">
            <ul class="site_menu">
                <li><a href="<?php echo url('Index/index'); ?>" class="current"><?php echo htmlentities(lang('ds_index')); ?></a></li>
                <?php foreach($navs['middle'] as $nav): ?>
                <li><a href="<?php echo htmlentities($nav['nav_url']); ?>" <?php if($nav['nav_new_open'] == 1): ?><?php endif; ?>><?php echo htmlentities($nav['nav_title']); ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
       
    </div>
</div>





<!--面包屑导航 BEGIN-->
<?php if(!(empty($nav_link_list) || (($nav_link_list instanceof \think\Collection || $nav_link_list instanceof \think\Paginator ) && $nav_link_list->isEmpty()))): ?>
<div class="dsh-breadcrumb-layout">
    <div class="dsh-breadcrumb w1200"><i class="iconfont">&#xe6ff;</i>
        <?php foreach($nav_link_list as $nav_link): if(empty($nav_link['link']) || (($nav_link['link'] instanceof \think\Collection || $nav_link['link'] instanceof \think\Paginator ) && $nav_link['link']->isEmpty())): ?>
        <span><?php echo htmlentities($nav_link['title']); ?></span>
        <?php else: ?>
        <span><a href="<?php echo htmlentities($nav_link['link']); ?>"><?php echo htmlentities($nav_link['title']); ?></a></span><span class="arrow">></span>
        <?php endif; ?>
        <?php endforeach; ?>
    </div>
</div>
<?php endif; ?>
<!--面包屑导航 END-->


<script>
    $(function() {
	//首页左侧分类菜单
	$(".all_categorys ul.menu").find("li").each(
		function() {
			$(this).hover(
				function() {
				    var cat_id = $(this).attr("cat_id");
					var menu = $(this).find("div[cat_menu_id='"+cat_id+"']");
					menu.show();
					$(this).addClass("hover");					
					var menu_height = menu.height();
					if (menu_height < 60) menu.height(80);
					menu_height = menu.height();
					var li_top = $(this).position().top;
					$(menu).css("top",-li_top + 40);
				},
				function() {
					$(this).removeClass("hover");
				    var cat_id = $(this).attr("cat_id");
					$(this).find("div[cat_menu_id='"+cat_id+"']").hide();
				}
			);
		}
	);

        $(".user_menu dl").hover(function() {
            $(this).addClass("hover");
        }, function() {
            $(this).removeClass("hover");
        });
        $('.user_menu .my-mall').mouseover(function() {
            // 最近浏览的商品
            load_history_information();
            $(this).unbind('mouseover');
        });
        $('.user_menu .my-cart').mouseover(function() {
            // 运行加载购物车
            load_cart_information();
            $(this).unbind('mouseover');
        });
    });
    
</script>




<link rel="stylesheet" href="<?php echo htmlentities(BASE_SITE_ROOT); ?>/static/home/default/store/styles/<?php echo htmlentities($store_theme); ?>/css/shop.css">
<link rel="stylesheet" href="<?php echo htmlentities(BASE_SITE_ROOT); ?>/static/home/default/store/styles/<?php echo htmlentities($store_theme); ?>/css/goods.css">
<!--放大镜BEGIN-->
<link rel="stylesheet" href="<?php echo htmlentities(BASE_SITE_ROOT); ?>/static/home/default/store/styles/<?php echo htmlentities($store_theme); ?>/css/jquery.jqzoom.css">
<!--放大镜END-->
<div class="w1200">
    <div class="dss-detail clearfix">
        <div class="intro_l">
            <div class="preview" id="photoBody">
                <!-- 商品视频 -->
                <?php if($goods['goodsvideo_url']): ?>
                <div onclick="$('#video_content').show()" style="position: absolute;z-index: 100;bottom:100px;left:20px;font-size:16px;cursor: pointer;background-color:#ff4040;color:#fff;line-height: 30px;border-radius: 30px;padding:0 10px;"><span class="iconfont">&#xe711;</span><?php echo htmlentities(lang('goods_index_video')); ?></div>
                <div id="video_content" class="product-img" style="position: absolute;z-index: 200;background: #000">
                    <div class="iconfont" onclick="$('#video_content').hide()" style="position: absolute;z-index: 300;top:20px;right:20px;cursor: pointer">&#xe696;</div>
                    <video style="width:100%;height:100%" muted="muted" autoplay="autoplay" controls="controls" controlslist="nodownload" src="<?php echo htmlentities($goods['goodsvideo_url']); ?>" />
                </div>
                <?php endif; ?>
                <!-- 商品大图介绍 start [[-->
                <div class="product-img jqzoom">
                    <img id="zoomimg" src="<?php echo htmlentities($goods_image['0']['2']); ?>" jqimg="<?php echo htmlentities($goods_image['0']['2']); ?>" alt="">
                </div>
                <!-- 商品大图介绍 end ]]-->
                <!-- 商品小图介绍 start [[-->
                <div class="product-small-img fn-clear"> <a href="javascript:;" class="next-left next-btn fl iconfont">&#xe686;</a>
                    <div class="pic-hide-box fl">
                        <ul class="small-pic" style="left:0;">
                            <?php if(is_array($goods_image) || $goods_image instanceof \think\Collection || $goods_image instanceof \think\Paginator): if( count($goods_image)==0 ) : echo "" ;else: foreach($goods_image as $key=>$value): ?>
                            <li class="small-pic-li <?php if($key==0): ?>active<?php endif; ?>">
                                <a href="javascript:;">
                                    <img src="<?php echo htmlentities($value['0']); ?>" data-img="<?php echo htmlentities($value['2']); ?>" data-big="<?php echo htmlentities($value['2']); ?>">
                                    <i></i>
                                </a>
                            </li>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </div>
                    <a href="javascript:;" class="next-right next-btn fl iconfont">&#xe687;</a>
                </div>
                <!-- 商品小图介绍 end ]]-->
            </div>
            <!-- E 商品图片及收藏分享 -->
            <div class="dss-handle">
                <!-- S 收藏 -->
                <a href="javascript:collect_goods('<?php echo htmlentities($goods['goods_id']); ?>','count','goods_collect');" class="favorite"><i class="iconfont">&#xe6a9;</i><?php echo htmlentities(lang('goods_index_favorite_goods')); ?></a>
                <!-- S 对比 -->
                <!-- <input type="hidden" id="lockcompare" value="unlock" /> -->
                <!-- <a href="javascript:void(0);" class="compare" ds_type="compare_<?php echo htmlentities($goods['goods_id']); ?>" data-param='{"gid":"<?php echo htmlentities($goods['goods_id']); ?>"}'><i class="iconfont">&#xe74a;</i><?php echo htmlentities(lang('add_contrast')); ?></a> -->
                <!-- S 举报 -->
                <!-- <?php if($inform_switch): ?>
                <a href="<?php if(session('is_login')): ?><?php echo url('Memberinform/inform_submit',['goods_id'=>$goods['goods_id']]); else: ?>javascript:login_dialog();<?php endif; ?>" title="<?php echo htmlentities(lang('goods_index_goods_inform')); ?>" class="inform"><i class="iconfont">&#xe6b3;</i><?php echo htmlentities(lang('goods_index_goods_inform')); ?></a>
                <?php endif; ?> -->
                <!-- <a href="<?php echo url('TaobaoExport/export_csv',['goods_id'=>$goods['goods_id']]); ?>"><i class='iconfont'>&#xe74e;</i><?php echo htmlentities(lang('goods_index_export_data')); ?></a> -->
                <!-- <a href="<?php echo url('TaobaoExport/export_image',['goods_id'=>$goods['goods_id']]); ?>"><i class='iconfont'>&#xe72a;</i><?php echo htmlentities(lang('goods_index_export_image')); ?></a> -->
                <!-- End -->
            </div>
        </div>
        <div class="dss-goods-summary">
            <div class="name">
                <h1><?php echo htmlentities($goods['goods_name']); ?></h1>
                <strong><?php echo htmlentities($goods['goods_advword']); ?></strong>
            </div>
            <div class="dss-meta">
            <!--<?php if($goods['wholesale_info']): ?>-->
                <dl style='display: flex'>
                    <dt><?php echo htmlentities(lang('wholesale_price')); ?></dt>
                    <!--<?php if(is_array($goods['wholesale_info']['wholesalegoods_price']) || $goods['wholesale_info']['wholesalegoods_price'] instanceof \think\Collection || $goods['wholesale_info']['wholesalegoods_price'] instanceof \think\Paginator): if( count($goods['wholesale_info']['wholesalegoods_price'])==0 ) : echo "" ;else: foreach($goods['wholesale_info']['wholesalegoods_price'] as $key=>$wholesale): ?>-->
                    <dd style='line-height: 1;flex:1'>
                        <div class="price"><span class="currency"><?php echo htmlentities(lang('currency')); ?></span><strong><?php echo htmlentities($wholesale['price']); ?></strong></div>
                        <div class="marketprice"><del><?php echo htmlentities(lang('currency')); ?><?php echo htmlentities($goods['goods_price']); ?></del></div>
                    </dd>
                    <!--<?php endforeach; endif; else: echo "" ;endif; ?>-->
                </dl>
                <dl style='display: flex'>
                    <dt><?php echo htmlentities(lang('wholesale_price_num')); ?></dt>
                    <!--<?php if(is_array($goods['wholesale_info']['wholesalegoods_price']) || $goods['wholesale_info']['wholesalegoods_price'] instanceof \think\Collection || $goods['wholesale_info']['wholesalegoods_price'] instanceof \think\Paginator): if( count($goods['wholesale_info']['wholesalegoods_price'])==0 ) : echo "" ;else: foreach($goods['wholesale_info']['wholesalegoods_price'] as $key=>$wholesale): ?>-->
                    <dd style='flex:1'><span><?php echo htmlentities($wholesale['num_text']); ?></span></dd>
                    <!--<?php endforeach; endif; else: echo "" ;endif; ?>-->
                </dl>
            <!--<?php elseif($goods['goods_ispifa']==0): ?>-->
                <?php if($goods['goods_marketprice'] > 0): ?>
                <dl>
                    <dt><?php echo htmlentities(lang('goods_index_goods_cost_price')); ?></dt>
                    <dd class="marketprice"><del><?php echo htmlentities(lang('currency')); ?><?php echo htmlentities($goods['goods_marketprice']); ?></del></dd>
                </dl>
                <?php endif; ?>
                <dl>
                    <dt><?php echo htmlentities(lang('goods_index_goods_price')); ?></dt>
                    <dd class="price">
                        <span class="currency"><?php echo htmlentities(lang('currency')); ?></span>
                        <?php if(!(empty($goods['promotion_price']) || (($goods['promotion_price'] instanceof \think\Collection || $goods['promotion_price'] instanceof \think\Paginator ) && $goods['promotion_price']->isEmpty()))): ?>
                        <strong><?php echo ds_price_format($goods['promotion_price']); ?></strong>
                        <?php else: ?>
                        <strong><?php echo ds_price_format($goods['goods_price']); ?></strong>
                        <?php endif; ?>
                    </dd>
                </dl>
	            <!--<?php elseif($goods['goods_ispifa']==1): ?>-->
	            <?php if($goods['startnum1'] > 0 || $goods['startnum2'] > 0 || $goods['startnum3'] > 0): ?>
	            <dl>
	                <dt><?php echo htmlentities(lang('goods_index_goods_price')); ?></dt>
	                <dd class="price">
	                    <span class="currency"><?php echo htmlentities(lang('currency')); ?></span>
	                    <?php if(!(empty($goods['pifaprice1']) || (($goods['pifaprice1'] instanceof \think\Collection || $goods['pifaprice1'] instanceof \think\Paginator ) && $goods['pifaprice1']->isEmpty()))): ?>
	                    <strong><?php echo ds_price_format($goods['pifaprice1']); ?></strong>
	                    <?php else: ?>
	                    <strong><?php echo ds_price_format($goods['goods_price']); ?></strong>
	                    <?php endif; ?>
	                </dd>
	                <dd class="price" style="padding-left:50px;">
	                    <span class="currency"><?php echo htmlentities(lang('currency')); ?></span>
	                    <?php if(!(empty($goods['pifaprice2']) || (($goods['pifaprice2'] instanceof \think\Collection || $goods['pifaprice2'] instanceof \think\Paginator ) && $goods['pifaprice2']->isEmpty()))): ?>
	                    <strong><?php echo ds_price_format($goods['pifaprice2']); ?></strong>
	                    <?php else: ?>
	                    <strong><?php echo ds_price_format($goods['goods_price']); ?></strong>
	                    <?php endif; ?>
	                </dd>
	                <dd class="price" style="padding-left:50px;">
	                    <span class="currency"><?php echo htmlentities(lang('currency')); ?></span>
	                    <?php if(!(empty($goods['pifaprice3']) || (($goods['pifaprice3'] instanceof \think\Collection || $goods['pifaprice3'] instanceof \think\Paginator ) && $goods['pifaprice3']->isEmpty()))): ?>
	                    <strong><?php echo ds_price_format($goods['pifaprice3']); ?></strong>
	                    <?php else: ?>
	                    <strong><?php echo ds_price_format($goods['goods_price']); ?></strong>
	                    <?php endif; ?>
	                </dd>
	            </dl>
	            <dl>
	                <dt><?php echo htmlentities(lang('goods_index_goods_pifacount')); ?></dt>
	                <dd ><?php echo htmlentities($goods['startnum1']); ?>-<?php echo htmlentities($goods['endnum1']); ?></dd>
	                <dd style="padding-left:100px;"><?php echo htmlentities($goods['startnum2']); ?>-<?php echo htmlentities($goods['endnum2']); ?></dd>
	                <dd style="padding-left:100px;"><?php echo htmlentities($goods['startnum3']); ?>-<?php echo htmlentities($goods['endnum3']); ?></dd>
	            </dl>
	            <?php endif; ?>
            <!--<?php endif; ?>-->
            </div>
      <?php if($goods['goods_state'] != 10 && $goods['goods_verify'] == 1){?>
      <!-- S 促销 -->
      <?php if (isset($goods['promotion_type']) || $goods['is_have_gift'] == 'gift'  || !empty($mansong_info)) {?>
      <div class="dss-sale">
        <?php if (isset($goods['promotion_type']) || !empty($mansong_info)) {?>
        <dl>
          <dt><?php echo htmlentities(lang('promotion_all_corners')); ?></dt>
          <dd class="promotion-info">
            <?php if(!(empty($goods['promotion_type']) || (($goods['promotion_type'] instanceof \think\Collection || $goods['promotion_type'] instanceof \think\Paginator ) && $goods['promotion_type']->isEmpty()))): ?>
            <span class="sale-name"><?php echo htmlentities((isset($goods['title']) && ($goods['title'] !== '')?$goods['title']:lang('ds_xianshi'))); ?></span>
            <!-- S 限时折扣 -->
            <?php if($goods['promotion_type'] == 'xianshi'): ?>
            <span class="sale-rule w400"><?php echo htmlentities(lang('vertical_drop')); ?><em><?php echo htmlentities(lang('currency')); ?><?php echo ds_price_format($goods['down_price']); ?></em>
            <?php if($goods['lower_limit']): ?>
            <?php echo sprintf(lang('lowest_thing'),$goods['lower_limit']); if($goods['explain']): ?>
            ，<?php echo htmlentities($goods['explain']); ?>
            <?php endif; ?>
            <?php endif; ?>
            </span>
            <div class="clearfix"></div>
            <?php endif; ?>
            <!-- E 限时折扣  -->
            
            <!-- S 抢购-->
            <?php if($goods['promotion_type'] == 'groupbuy'): if($goods['upper_limit']): ?>
            <em><?php echo sprintf(lang('supreme_thing'),$goods['upper_limit']); ?></em>
            <?php endif; if($goods['remark']): ?>
            <span>，<?php echo htmlentities($goods['remark']); ?></span><br>
            <?php endif; ?>
            <?php endif; ?>
            <?php endif; ?>
            <!-- E 抢购 -->
            
            <!--S 满就送 -->
            <?php if($mansong_info): ?>
            <div class="dss-mansong"> <span class="sale-name"><?php echo htmlentities(lang('ds_mansong')); ?></span> <span class="sale-rule">
              <?php $rule = $mansong_info['rules'][0];?><?php echo htmlentities(lang('ds_man')); ?>
              <em><?php echo htmlentities(lang('currency')); ?><?php echo ds_price_format($rule['mansongrule_price']); ?></em>
              <?php if(!(empty($rule['mansongrule_discount']) || (($rule['mansongrule_discount'] instanceof \think\Collection || $rule['mansongrule_discount'] instanceof \think\Paginator ) && $rule['mansongrule_discount']->isEmpty()))): ?>，<?php echo htmlentities(lang('ds_reduce')); ?><em><?php echo htmlentities(lang('currency')); ?><?php echo ds_price_format($rule['mansongrule_discount']); ?></em><?php endif; if($rule['goods_id'] && isset($rule['goods_storage']) && $rule['goods_storage']): ?>，<?php echo htmlentities(lang('ds_gift')); ?><?php endif; ?>
              </span><div class="clearfix"></div> <span class="sale-rule-more" dstype="show-rule"><a href="javascript:void(0);"><?php echo htmlentities(lang('total')); ?><strong><?php echo count($mansong_info['rules']); ?></strong><?php echo htmlentities(lang('expand_view')); ?><i class="iconfont">&#xe689;</i></a></span>
              <div class="sale-rule-content" style="display: none;" dstype="rule-content">
                <div class="title"><span class="sale-name"><?php echo htmlentities(lang('ds_mansong')); ?></span><?php echo htmlentities(lang('total')); ?><strong><?php echo count($mansong_info['rules']); ?></strong><?php echo htmlentities(lang('promotional_campaign_rules')); ?><a href="javascript:;" dstype="hide-rule"><?php echo htmlentities(lang('ds_close')); ?></a></div>
                <div class="content">
                  <div class="mjs-tit"><?php echo htmlentities($mansong_info['mansong_name']); ?>
                    <time>( <?php echo htmlentities(lang('ds_promotion_time')); ?>:<?php echo htmlentities(date("Y-m-d",!is_numeric($mansong_info['mansong_starttime'])? strtotime($mansong_info['mansong_starttime']) : $mansong_info['mansong_starttime'])); ?> - <?php echo htmlentities(date("Y-m-d",!is_numeric($mansong_info['mansong_endtime'])? strtotime($mansong_info['mansong_endtime']) : $mansong_info['mansong_endtime'])); ?> )</time>
                  </div>
                  <ul class="mjs-info">
                    <?php if(is_array($mansong_info['rules']) || $mansong_info['rules'] instanceof \think\Collection || $mansong_info['rules'] instanceof \think\Paginator): if( count($mansong_info['rules'])==0 ) : echo "" ;else: foreach($mansong_info['rules'] as $key=>$rule): ?>
                    <li> <span class="sale-rule"><?php echo htmlentities(lang('ds_man')); ?><em><?php echo htmlentities(lang('currency')); ?><?php echo ds_price_format($rule['mansongrule_price']); ?></em>
                      <?php if(!(empty($rule['mansongrule_discount']) || (($rule['mansongrule_discount'] instanceof \think\Collection || $rule['mansongrule_discount'] instanceof \think\Paginator ) && $rule['mansongrule_discount']->isEmpty()))): ?>， <?php echo htmlentities(lang('ds_reduce')); ?><em><?php echo htmlentities(lang('currency')); ?><?php echo ds_price_format($rule['mansongrule_discount']); ?></em><?php endif; if($rule['goods_id'] && isset($rule['goods_storage']) && $rule['goods_storage']): ?>
                      ， <?php echo htmlentities(lang('ds_gift')); ?> <a href="<?php echo htmlentities((isset($rule['goods_url']) && ($rule['goods_url'] !== '')?$rule['goods_url']:'')); ?>" title="<?php echo htmlentities($rule['mansong_goods_name']); ?>"  class="gift"> <img src="<?php echo goods_cthumb($rule['goods_image'], 240); ?>" alt="<?php echo htmlentities($rule['mansong_goods_name']); ?>"> </a>&nbsp;。
                      <?php endif; ?>
                      </span> </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                  </ul>
                  <div class="mjs-remark"><?php echo htmlentities($mansong_info['mansong_remark']); ?></div>
                </div>
              </div>
            </div>
            <?php endif; ?>
            <!--E 满就送 -->

          </dd>
        </dl>
        <?php }if($goods['inviter_money']>0): ?>
                <dl>
                    <dt><?php echo htmlentities(lang('distribution_commission')); ?></dt>
                    <dd><?php echo htmlentities(lang('currency')); ?><?php echo ds_price_format($goods['inviter_money']); ?></dd>
                </dl>
                <?php endif; ?>
                <dl>
                    <dt><?php echo htmlentities(lang('goods_index_evaluation')); ?></dt>
                    <dd><a href="#dsGoodsRate"><?php echo htmlentities(lang('total')); ?><?php echo htmlentities($goods['evaluation_count']); ?><?php echo htmlentities(lang('article_evaluation')); ?></a></dd>
                </dl>
        <!-- S 赠品 -->
        <?php if($goods['is_have_gift']): ?>
        <dl>
          <dt><?php echo htmlentities(lang('gift_all_corners')); ?></dt>
          <dd class="goods-gift" id="dssGoodsgift"> <span><?php echo htmlentities(lang('end_gift')); ?></span>
            <?php if(!(empty($gift_array) || (($gift_array instanceof \think\Collection || $gift_array instanceof \think\Paginator ) && $gift_array->isEmpty()))): ?>
            <ul>
              <?php if(is_array($gift_array) || $gift_array instanceof \think\Collection || $gift_array instanceof \think\Paginator): if( count($gift_array)==0 ) : echo "" ;else: foreach($gift_array as $key=>$val): ?>
              <li>
                <div class="goods-gift-thumb"><span><img src="<?php echo goods_cthumb($val['gift_goodsimage'], '240', $goods['store_id']); ?>"></span></div>
                <a href="<?php echo url('Goods/index',['goods_id'=>$val['gift_goodsid']]); ?>" class="goods-gift-name"  title="<?php echo htmlentities($val['gift_goodsname']); ?>"></a><em>x<?php echo htmlentities($val['gift_amount']); ?></em> </li>
              <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <?php endif; ?>
          </dd>
        </dl>
        <?php endif; ?>
        <!-- E 赠品 -->

      </div>
      <?php }?>
      <!-- E 促销 -->
      
      <!--会员等级折扣 BEGIN-->
      <?php if(!(empty($goods['goods_mgdiscount_arr']) || (($goods['goods_mgdiscount_arr'] instanceof \think\Collection || $goods['goods_mgdiscount_arr'] instanceof \think\Paginator ) && $goods['goods_mgdiscount_arr']->isEmpty()))): ?>
      <div class="dss-sale">
          <dl>
              <dt><?php echo htmlentities(lang('member_discount')); ?></dt>
              <dd class="mgdiscount-info">
                  <?php if(is_array($goods['goods_mgdiscount_arr']) || $goods['goods_mgdiscount_arr'] instanceof \think\Collection || $goods['goods_mgdiscount_arr'] instanceof \think\Paginator): if( count($goods['goods_mgdiscount_arr'])==0 ) : echo "" ;else: foreach($goods['goods_mgdiscount_arr'] as $key=>$val): ?>
                  <span><em><?php echo htmlentities($val['level_name']); ?></em><?php echo htmlentities($val['level_discount']); ?><?php echo htmlentities(lang('ds_xianshi_flag')); ?></span>
                  <?php endforeach; endif; else: echo "" ;endif; ?>
                  
              </dd>
          </dl>
      </div>
      <?php endif; ?>
      <!--会员等级折扣 END-->
      
      <!--送达时间 begin  -->
        <?php if($store_info['store_free_time'] >= '1' && $goods['is_virtual'] == 0): ?>
        <dl>
          <dt><?php echo htmlentities(lang('service_all_corners')); ?></dt>
          <dd><?php echo htmlentities(lang('by')); ?> <a href="<?php echo url('Store/index',['store_id'=>$store_info['store_id']]); ?>" title="<?php echo htmlentities(lang('enter_store')); ?>" ><font color="#D93600"><b><?php echo htmlentities($store_info['store_name']); ?></b></font></a> <?php echo htmlentities(lang('shipping_prompt1')); ?><span id="store-free-time"><?php echo htmlentities(lang('shipping_prompt2')); ?>(<font color="#D93600"><b>
            <?php $showtime=date("Y-m-d H:i:s"); echo date("m".lang('ds_month')."d".lang('ds_day'),strtotime($showtime . '+'. $store_info['store_free_time'].' day')); ?>
            </b></font>) <?php echo htmlentities(lang('service')); ?></span></dd>
        </dl>
        <?php endif; ?>
        <!--送达时间 end  -->

      <div class="dss-logistics"><!-- S 物流与运费新布局展示  -->
        <?php if($goods['goods_state'] == 1 && $goods['goods_verify'] == 1 && $goods['is_virtual'] == 0){ ?>
        <dl id="dss-freight" class="dss-freight">
          <dt><?php echo htmlentities(lang('delivery_space')); ?></dt>
          <dd class="dss-freight_box">
            <!-- <div id="dss-freight-selector" class="dss-freight-select">
              <div class="text">
                <div><?php echo isset($store_info['deliver_region'][1]) ? str_replace(' ','',$store_info['deliver_region'][1]) :lang('please_select_area')?></div>
                <b class="iconfont">&#xe689;</b> 
              </div>
              <div class="content">
                <div id="dss-stock" class="dss-stock" data-widget="tabs">
                  <div class="mt">
                    <ul class="tab">
                      <li data-index="0" data-widget="tab-item" class="curr"><a href="#none" class="hover"><em><?php echo isset($store_info['deliver_region_names'][0]) ? $store_info['deliver_region_names'][0] : lang('ds_please_choose')?></em><i class="iconfont">&#xe689;</i></a></li>
                    </ul>
                  </div>
                  <div id="stock_province_item" data-widget="tab-content" data-area="0">
                    <ul class="area-list">
                    </ul>
                  </div>
                  <div id="stock_city_item" data-widget="tab-content" data-area="1" style="display: none;">
                    <ul class="area-list">
                    </ul>
                  </div>
                  <div id="stock_area_item" data-widget="tab-content" data-area="2" style="display: none;">
                    <ul class="area-list">
                    </ul>
                  </div>
                </div>
              </div>
              <a href="javascript:;" class="close" onclick="$('#dss-freight-selector').removeClass('hover')"><?php echo htmlentities(lang('ds_close')); ?></a> 
            </div> -->
            <div id="dss-freight-prompt"> 
                <strong><?php if($goods['goods_storage']>0): ?><?php echo htmlentities(lang('goods_stock')); else: ?><?php echo htmlentities(lang('goods_out_stock')); ?><?php endif; ?></strong>
                <!-- <?php if(!$goods['transport_id']): if($goods['goods_freight']>0): ?><?php echo htmlentities(lang('freight')); ?><?php echo ds_price_format($goods['goods_freight']); ?> <?php echo htmlentities(lang('ds_yuan')); else: ?><?php echo htmlentities(lang('ds_common_shipping_free')); ?><?php endif; ?>
                <?php endif; ?> -->
            </div>
          </dd>
        </dl>
        <!--<?php if($if_chain): ?>-->
        <dl class="dss-chain">
          <dt>门店服务</dt>
          <dd><a href="javascript:void(0);" dstype="show_chain"><i class="iconfont">&#xe720;</i>门店自提</a>· 选择有现货的门店下单，可立即提货</dd>
        </dl>
        <!--<?php endif; ?>-->
        <!-- S 物流与运费新布局展示  -->
        <?php } ?>
      </div>
      <div class="dss-key">

        <!-- S 商品规格值-->
        <?php if(!(empty($goods['spec_name']) || (($goods['spec_name'] instanceof \think\Collection || $goods['spec_name'] instanceof \think\Paginator ) && $goods['spec_name']->isEmpty()))): if(is_array($goods['spec_name']) || $goods['spec_name'] instanceof \think\Collection || $goods['spec_name'] instanceof \think\Paginator): if( count($goods['spec_name'])==0 ) : echo "" ;else: foreach($goods['spec_name'] as $key=>$val): if (isset($goods['spec_value'][$key]) and is_array($goods['spec_value'][$key]) and !empty($goods['spec_value'][$key])) {?>
        <dl dstype="ds-spec">
          <dt><?php echo htmlentities($val); ?></dt>
          <dd>
            <ul nctyle="ul_sign">
              <?php foreach($goods['spec_value'][$key] as $k => $v) {if($key == 1): ?>
              <!-- 图片类型规格-->
              <li class="sp-img"><a href="javascript:void(0);" class="<?php if (isset($goods['goods_spec'][$k])) {echo 'hovered';}?>" data-param="{valid:<?php echo htmlentities($k); ?>}" title="<?php echo htmlentities($v); ?>"><img src="<?php echo $spec_image[$k];?>"/><?php echo htmlentities($v); ?><i></i></a></li>
              <?php else: ?>
              <!-- 文字类型规格-->
              <li class="sp-txt"><a href="javascript:void(0)" class="<?php if (isset($goods['goods_spec'][$k])) { echo 'hovered';} ?>" data-param="{valid:<?php echo htmlentities($k); ?>}"><?php echo htmlentities($v); ?><i></i></a></li>
              <?php endif; }?>
            </ul>
          </dd>
        </dl>
        <?php }?>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <?php endif; ?>
        <!-- E 商品规格值-->
        <?php if($goods['is_virtual'] == 1): ?>
        <dl>
          <dt><?php echo htmlentities(lang('pick_up_method')); ?></dt>
          <dd>
            <ul>
              <li class="sp-txt"><a href="javascript:void(0)" class="hovered"><?php echo htmlentities(lang('e_coupons')); ?><i></i></a></li>
            </ul>
          </dd>
        </dl>
        <!-- 虚拟商品有效期 -->
        <dl>
          <dt><?php echo htmlentities(lang('valid_space')); ?></dt>
          <dd><?php echo htmlentities(lang('available_immediately')); ?> <?php echo htmlentities(date("Y-m-d H:i:s",!is_numeric($goods['virtual_indate'])? strtotime($goods['virtual_indate']) : $goods['virtual_indate'])); ?></dd>
        </dl>
        <?php elseif($goods['is_presell']==1): ?>
        <!-- 预售商品发货时间 -->
        <dl>
          <dt><?php echo htmlentities(lang('pre_sale_space')); ?></dt>
          <dd>
            <ul>
              <li class="sp-txt"><a href="javascript:void(0)" class="hovered"><?php echo htmlentities(date("Y-m-d",!is_numeric($goods['presell_deliverdate'])? strtotime($goods['presell_deliverdate']) : $goods['presell_deliverdate'])); ?>&nbsp;<?php echo htmlentities(lang('daily_delivery')); ?><i></i></a></li>
            </ul>
          </dd>
        </dl>
        <?php endif; if($goods['is_goodsfcode']): ?>
        <!-- 预售商品发货时间 -->
        <dl>
          <dt><?php echo htmlentities(lang('type_purchase')); ?></dt>
          <dd>
            <ul>
              <li class="sp-txt"><a href="javascript:void(0)" class="hovered"><?php echo htmlentities(lang('f_code_priority_purchase')); ?><i></i></a></li>
            </ul>
          </dd>
        </dl>
        <?php endif; ?>
      </div>
      <!-- S 购买数量及库存 -->
      <div class="dss-buy">
        <?php if ($goods['goods_state'] != 0 && $goods['goods_storage'] >= 0) {?>
        <div class="dss-figure-input">
           <a href="javascript:void(0)" class="decrease iconfont" <?php if($goods['is_goodsfcode'] != 1): ?>dstype="decrease"<?php endif; ?>>&#xe6dc;</a>
          <input type="text" name="" id="quantity" value="1" size="3" maxlength="6" class="input-text" <?php if($goods['is_goodsfcode'] == 1): ?>readonly<?php endif; ?>>
          <a href="javascript:void(0)" class="increase iconfont" <?php if($goods['is_goodsfcode'] != 1): ?>dstype="increase"<?php endif; ?>>&#xe6db;</a>
        </div>
        <div class="dss-point" style="display: none;"><i></i>
          <!-- S 库存 -->
          <span><?php echo htmlentities(lang('selected_item_stock')); ?><strong dstype="goods_stock"><?php echo htmlentities($goods['goods_storage']); ?></strong><?php echo htmlentities(lang('ds_jian')); ?></span>
          <!-- E 库存 -->
          <?php if ($goods['is_virtual'] == 1 && $goods['virtual_limit'] > 0) { ?>
          <!-- 虚拟商品限购数 -->
          <span class="look">，<?php echo htmlentities(lang('per_person_limit_purchase')); ?><strong>
          <!-- 虚拟抢购 设置了虚拟抢购限购数 该数小于原商品限购数 -->
          <?php echo (isset($goods['promotion_type']) && $goods['promotion_type'] == 'groupbuy' && $goods['upper_limit'] > 0 && $goods['upper_limit'] < $goods['virtual_limit']) ? $goods['upper_limit'] : $goods['virtual_limit'];?> </strong><?php echo htmlentities(lang('item_shop')); ?>。</span>
          <?php } else if (isset($goods['promotion_type']) && $goods['promotion_type'] == 'groupbuy' && $goods['upper_limit'] > 0){ ?>
          <!-- 抢购限购 -->
          <span class="look">，<?php echo htmlentities(lang('per_person_limit_purchase')); ?><strong> <?php echo htmlentities($goods['upper_limit']); ?> </strong><?php echo htmlentities(lang('item_shop')); ?>。</span>
          <?php }if($goods['is_goodsfcode'] == 1): ?>
          <span class="look">，<?php echo htmlentities(lang('f_code_priority_purchase')); ?>。</span>
          <?php endif; ?>
        </div>
        <?php } ?>

        <!-- S 提示已选规格及库存不足无法购买 -->
        <?php if($goods['goods_state'] == 0 || $goods['goods_storage'] <= 0): ?>
        <div dstype="goods_prompt" class="dss-point"><i></i> <span><?php echo htmlentities(lang('selected_item')); ?><strong><?php echo htmlentities(lang('understock')); ?></strong>；<?php echo htmlentities(lang('select_other_goods_store')); ?><a href="javascript:void(0);" dstype="arrival_notice" class="arrival" title="<?php echo htmlentities(lang('arrival_notice')); ?>"><?php echo htmlentities(lang('arrival_notice')); ?></a><?php echo htmlentities(lang('prompt')); ?>。</span> </div>
        <?php endif; ?>
        <!-- E 提示已选规格及库存不足无法购买 -->
        <div class="dss-btn">
          <!-- 限制购买-->
          <?php if($IsHaveBuy=="0"): ?>
          <!-- 加入购物车-->
          <?php if($goods['cart'] == true): ?>
          <a href="javascript:void(0);" dstype="addcart_submit" class="addcart <?php if($goods['goods_state'] == 0 || $goods['goods_storage'] <= 0): ?>no-addcart<?php endif; ?>" title="<?php echo htmlentities(lang('goods_index_add_to_cart')); ?>"><i class="iconfont">&#xe69a;</i><?php echo htmlentities(lang('goods_index_add_to_cart')); ?></a>
          <?php endif; ?>
          <!-- 立即购买-->
          <a href="javascript:void(0);" dstype="buynow_submit" class="buynow <?php if ($goods['goods_state'] == 0 || $goods['goods_storage'] <= 0 || ($goods['is_virtual'] == 1 && $goods['virtual_indate'] < TIMESTAMP)) {?>no-buynow<?php }?>" title="<?php echo htmlentities($goods['buynow_text']); ?>"><?php echo htmlentities($goods['buynow_text']); ?></a>
          <?php endif; if($IsHaveBuy=="1"): ?>
          <a href="javascript:void(0);" class="buynow no-buynow" title="<?php echo htmlentities(lang('have_participated_rush')); ?>"><?php echo htmlentities(lang('have_participated_rush')); ?></a>
          <?php endif; ?>

          <!-- end-->
          
          <!-- S 加入购物车弹出提示框 -->
          <div class="dss-cart-popup">
              <dl>
                  <dt><?php echo htmlentities(lang('goods_index_cart_success')); ?><a title="<?php echo htmlentities(lang('goods_index_close')); ?>" onClick="$('.dss-cart-popup').css({'display':'none'});">X</a></dt>
                  <dd> <?php echo htmlentities(lang('goods_index_cart_have')); ?><strong id="bold_num"></strong>  <?php echo htmlentities(lang('goods_index_number_of_goods')); ?><?php echo htmlentities(lang('goods_index_total_price')); ?>:<em id="bold_mly" class="saleP"></em></dd>
                  <dd class="btns">
                      <a href="javascript:void(0);" class="dss-btn-mini dss-btn-orange" onclick="location.href='<?php echo url('Cart/index'); ?>'"><?php echo htmlentities(lang('goods_index_view_cart')); ?></a>
                      <a href="javascript:void(0);" class="dss-btn-mini" value="" onclick="$('.dss-cart-popup').css({'display':'none'});"><?php echo htmlentities(lang('goods_index_continue_shopping')); ?></a>
                  </dd>
              </dl>
          </div>
          <!-- E 加入购物车弹出提示框 -->
        </div>
        <!-- E 购买按钮 -->
        <div class="qrcode_btn iconfont">&#xe72d;
              <div class="dss-goods-code">
                    <div class="qrcode">
                        <img src="<?php echo htmlentities(HOME_SITE_URL); ?>/qrcode?url=<?php echo urlencode(config('ds_config.h5_site_url')); ?>%2fhome%2fgoodsdetail%3fgoods_id%3d<?php echo htmlentities($goods['goods_id']); ?>"/>
                    </div>
                    <p><?php echo htmlentities(lang('mobile_end_purchase')); ?></p>
                    <b class="iconfont">&#xe687;</b>
                </div>
          </div>
      </div>
      <?php }else{?>
      <div class="dss-buy">
        <div class="dss-saleout">
          <dl>
            <dt><i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('goods_index_is_no_show')); ?></dt>
            <dd><?php echo htmlentities(lang('goods_index_is_no_show_message_one')); ?></dd>
            <dd><?php echo htmlentities(lang('goods_index_is_no_show_message_two_1')); ?>&nbsp;<a href="<?php echo url('Store/index',['store_id'=>$goods['store_id']]); ?>" class="dsbtn-mini"><?php echo htmlentities(lang('goods_index_is_no_show_message_two_2')); ?></a>&nbsp;<?php echo htmlentities(lang('goods_index_is_no_show_message_two_3')); ?> </dd>
          </dl>
        </div>
      </div>
      <?php }?>
      <!-- E 购买数量及库存 -->
    </div>
        

        <div class="intro_r">
            <div class="mt">
                <h2>看了又看</h2>
                <span></span>
            </div>
            <div class="mc">
                <ul>
                    <?php if(is_array($goods_commend) || $goods_commend instanceof \think\Collection || $goods_commend instanceof \think\Paginator): if( count($goods_commend)==0 ) : echo "" ;else: foreach($goods_commend as $key=>$goods_commend_child): ?>
                    <li>
                        <div class="p_img">
                            <a href="<?php echo url('Goods/index',['goods_id'=>$goods_commend_child['goods_id']]); ?>"  title="<?php echo htmlentities($goods_commend_child['goods_advword']); ?>">
                                <img src="<?php echo goods_thumb($goods_commend_child, 240); ?>" alt="<?php echo htmlentities($goods_commend_child['goods_name']); ?>"/>
                            </a>
                            <div class="p_name"><?php echo htmlentities($goods_commend_child['goods_name']); ?></div>
                        </div>
                        <div class="p_price">
                            <?php echo htmlentities(lang('currency')); ?><?php echo htmlentities($goods_commend_child['goods_price']); ?>
                        </div> 
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="mb">
                <a class="next" href="javascript:void(0)"><i class="iconfont">&#xe688;</i></a>
                <a class="prev" href="javascript:void(0)"><i class="iconfont">&#xe689;</i></a>
            </div>
        </div>

        
    </div>
<!-- S 优惠套装 -->
<div class="dss-promotion" id="ds-bundling" style="display:none;"></div>
<!-- E 优惠套装 -->

<div id="content" class="dss-goods-layout expanded" >
  <div class="dss-goods-main" id="main-nav-holder">
    <div class="tabbar pngFix" id="main-nav">
      <div class="dss-goods-title-nav">
        <ul id="categorymenu">
          <li class="current"><a id="tabGoodsIntro" href="#content"><?php echo htmlentities(lang('goods_index_goods_info')); ?></a></li>
          <li><a id="tabGoodsRate" href="#content"><?php echo htmlentities(lang('goods_index_evaluation')); ?><em>(<?php echo htmlentities($goods_evaluate_info['all']); ?>)</em></a></li>
          <li><a id="tabGoodsTraded" href="#content"><?php echo htmlentities(lang('goods_index_sold_record')); ?><em>(<?php echo htmlentities($goods['goods_salenum']); ?>)</em></a></li>
          <li><a id="tabGuestbook" href="#content"><?php echo htmlentities(lang('goods_index_goods_consult')); ?></a></li>
        </ul>
      </div>
    </div>
    <div class="dss-intro">
      <div class="content bd" id="dsGoodsIntro">
        <?php if(is_array($goods['goods_attr']) || isset($goods['brand_name'])){?>
        <ul class="ds-goods-sort">
          <?php if ($goods['goods_serial']) {?>
          <li><?php echo htmlentities(lang('merchant_item_number')); ?>：<?php echo htmlentities($goods['goods_serial']); ?></li>
          <?php }if(isset($goods['brand_name'])){echo '<li>'.lang('goods_index_brand').lang('ds_colon').$goods['brand_name'].'</li>'; } if(is_array($goods['goods_attr']) && !empty($goods['goods_attr'])){ foreach ($goods['goods_attr'] as $val){ $val= array_values($val);echo '<li>'.$val[0].lang('ds_colon').$val[1].'</li>'; } }?>
        </ul>
        <?php }?>
        <div class="dss-goods-info-content">
          <?php if(isset($plate_top)): ?>
          <div class="top-template"><?php echo htmlspecialchars_decode($plate_top['storeplate_content']); ?></div>
          <?php endif; ?>
          <div class="default"><?php echo htmlspecialchars_decode($goods['goods_body']); ?></div>
          <?php if(isset($plate_bottom)): ?>
          <div class="bottom-template"><?php echo htmlspecialchars_decode($plate_bottom['storeplate_content']); ?></div>
          <?php endif; ?>
        </div>
      </div>
    </div>
    <div class="dss-comment">
      <div class="dss-goods-title-bar hd" style="display: none">
        <h4><a href="javascript:void(0);"><?php echo htmlentities(lang('goods_index_evaluation')); ?></a></h4>
      </div>
      <div class="dss-goods-info-content bd" id="dsGoodsRate" style="display: none">
        <div class="dss-top">
          <div class="rate">
            <p><strong><?php echo htmlentities($goods_evaluate_info['good_percent']); ?></strong><sub>%</sub><?php echo htmlentities(lang('high_praise')); ?></p>
            <span><?php echo htmlentities(lang('total')); ?><?php echo htmlentities($goods_evaluate_info['all']); ?><?php echo htmlentities(lang('people_participation_rating')); ?></span></div>
          <div class="percent">
            <dl>
              <dt><?php echo htmlentities(lang('high_praise')); ?><em>(<?php echo htmlentities($goods_evaluate_info['good_percent']); ?>%)</em></dt>
              <dd><i style="width: <?php echo htmlentities($goods_evaluate_info['good_percent']); ?>%"></i></dd>
            </dl>
            <dl>
              <dt><?php echo htmlentities(lang('medium_rating')); ?><em>(<?php echo htmlentities($goods_evaluate_info['normal_percent']); ?>%)</em></dt>
              <dd><i style="width: <?php echo htmlentities($goods_evaluate_info['normal_percent']); ?>%"></i></dd>
            </dl>
            <dl>
              <dt><?php echo htmlentities(lang('poor_rating')); ?><em>(<?php echo htmlentities($goods_evaluate_info['bad_percent']); ?>%)</em></dt>
              <dd><i style="width: <?php echo htmlentities($goods_evaluate_info['bad_percent']); ?>%"></i></dd>
            </dl>
          </div>
          <div class="btns"><span><?php echo htmlentities(lang('evaluation_purchased_goods')); ?></span>
            <p><a href="<?php if($goods['is_virtual']): ?><?php echo url('Membervrorder/index'); else: ?><?php echo url('Memberorder/index'); ?><?php endif; ?>" class="dss-btn dss-btn-red" ><i class="iconfont">&#xe71b;</i><?php echo htmlentities(lang('evaluation_item')); ?></a></p>
          </div>
        </div>
        <div class="dss-goods-title-nav">
          <ul id="comment_tab">
            <li data-type="all" class="current"><a href="javascript:void(0);"><?php echo htmlentities(lang('goods_index_evaluation')); ?>(<?php echo htmlentities($goods_evaluate_info['all']); ?>)</a></li>
            <li data-type="1"><a href="javascript:void(0);"><?php echo htmlentities(lang('high_praise')); ?>(<?php echo htmlentities($goods_evaluate_info['good']); ?>)</a></li>
            <li data-type="2"><a href="javascript:void(0);"><?php echo htmlentities(lang('medium_rating')); ?>(<?php echo htmlentities($goods_evaluate_info['normal']); ?>)</a></li>
            <li data-type="3"><a href="javascript:void(0);"><?php echo htmlentities(lang('poor_rating')); ?>(<?php echo htmlentities($goods_evaluate_info['bad']); ?>)</a></li>
          </ul>
        </div>
        <!-- 商品评价内容部分 -->
        <div id="goodseval" class="dss-commend-main"></div>
      </div>
    </div>
    <div class="dsg-salelog">
      <div class="dss-goods-title-bar hd" style="display: none">
        <h4><a href="javascript:void(0);"><?php echo htmlentities(lang('goods_index_sold_record')); ?></a></h4>
      </div>
      <div class="dss-goods-info-content bd" id="dsGoodsTraded" style="display: none">
        
        <!-- 成交记录内容部分 -->
        <div id="salelog_demo" class="dss-loading"> </div>
      </div>
    </div>
    <div class="dss-consult">
      <div class="dss-goods-title-bar hd" style="display: none">
        <h4><a href="javascript:void(0);"><?php echo htmlentities(lang('goods_index_goods_consult')); ?></a></h4>
      </div>
      <div class="dss-goods-info-content bd" id="dsGuestbook" style="display: none">
        <!-- 咨询留言内容部分 -->
        <div id="consulting_demo" class="dss-loading"> </div>
      </div>
    </div>
    <?php if(!(empty($goods_commend) || (($goods_commend instanceof \think\Collection || $goods_commend instanceof \think\Paginator ) && $goods_commend->isEmpty()))): ?>
    <div class="dss-recommend">
      <div class="title">
        <h4><?php echo htmlentities(lang('goods_index_goods_commend')); ?></h4>
      </div>
      <div class="content">
        <ul>
          <?php if(is_array($goods_commend) || $goods_commend instanceof \think\Collection || $goods_commend instanceof \think\Paginator): if( count($goods_commend)==0 ) : echo "" ;else: foreach($goods_commend as $key=>$goods_commend_child): if($goods['goods_id'] != $goods_commend_child['goods_id']): ?>
          <li>
            <dl>
              <dt class="goods-name"><a href="<?php echo url('Goods/index',['goods_id'=>$goods_commend_child['goods_id']]); ?>"  title="<?php echo htmlentities($goods_commend_child['goods_advword']); ?>"><?php echo htmlentities($goods_commend_child['goods_name']); ?><em><?php echo htmlentities($goods_commend_child['goods_advword']); ?></em></a></dt>
              <dd class="goods-pic"><a href="<?php echo url('Goods/index',['goods_id'=>$goods_commend_child['goods_id']]); ?>"  title="<?php echo htmlentities($goods_commend_child['goods_advword']); ?>"><img class="lazyload" data-original="<?php echo goods_thumb($goods_commend_child, 240); ?>" alt="<?php echo htmlentities($goods_commend_child['goods_name']); ?>"/></a></dd>
              <dd class="goods-price"><?php echo htmlentities(lang('currency')); ?><?php echo htmlentities($goods_commend_child['goods_price']); ?></dd>
            </dl>
          </li>
          <?php endif; ?>
          <?php endforeach; endif; else: echo "" ;endif; ?>
          
        </ul>
        <div class="clear"></div>
      </div>
    </div>
    <?php endif; ?>
  </div>
  <div class="dss-sidebar">



<div class="dss-info">
    <div class="title">
        <h4><?php if($store_info['is_platform_store']): ?><em><?php echo htmlentities(lang('platform_store')); ?></em><?php else: ?><img src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/store_grade/<?php echo htmlentities($store_info['grade_id']); ?>.png" class="pngFix"><?php endif; ?>&nbsp;<a href="<?php echo url('Store/index',['store_id'=>$store_info['store_id']]); ?>" ><?php echo htmlentities($store_info['store_name']); ?></a>
        <span member_id="<?php echo htmlentities($store_info['member_id']); ?>"></span>
        <?php if(isset($store_info['member_id']) || !empty($store_info['store_qq']) || !empty($store_info['store_ww'])): if(!(empty($store_info['store_qq']) || (($store_info['store_qq'] instanceof \think\Collection || $store_info['store_qq'] instanceof \think\Paginator ) && $store_info['store_qq']->isEmpty()))): ?>
                <a  href="<?php echo htmlentities(HTTP_TYPE); ?>wpa.qq.com/msgrd?v=3&uin=<?php echo htmlentities($store_info['store_qq']); ?>&site=qq&menu=yes" title="QQ: <?php echo htmlentities($store_info['store_qq']); ?>"><img border="0" src="<?php echo htmlentities(HTTP_TYPE); ?>wpa.qq.com/pa?p=2:<?php echo htmlentities($store_info['store_qq']); ?>:52" style=" vertical-align: middle;"/></a>
                <?php endif; if(!(empty($store_info['store_ww']) || (($store_info['store_ww'] instanceof \think\Collection || $store_info['store_ww'] instanceof \think\Paginator ) && $store_info['store_ww']->isEmpty()))): ?>
                <a  href="http://amos.im.alisoft.com/msg.aw?v=2&amp;uid=<?php echo htmlentities($store_info['store_ww']); ?>&site=cntaobao&s=1" ><img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=<?php echo htmlentities($store_info['store_ww']); ?>&site=cntaobao&s=2" alt="<?php echo htmlentities(lang('ds_message_me')); ?>" style=" vertical-align: middle;"/></a>
                <?php endif; ?>
        <?php endif; ?>        
        </h4>
    </div>
    <div class="content">
        <dl class="all-rate">
            <dt><span class="t_adjust"><?php echo htmlentities(lang('comprehensive_score')); ?></span><span>：</span></dt>
            <dd>
                <div class="rating"><span style="width: <?php echo htmlentities($store_info['store_credit_percent']); ?>%"></span></div>
                <em><?php echo htmlentities($store_info['store_credit_average']); ?></em><?php echo htmlentities(lang('credit_unit')); ?></dd>
        </dl>
        <div class="dss-detail-rate">
            <h5><?php echo htmlentities(lang('ds_dynamic_evaluation')); ?>：</h5>
            <ul>
                <?php if(!(empty($store_info['store_credit']) || (($store_info['store_credit'] instanceof \think\Collection || $store_info['store_credit'] instanceof \think\Paginator ) && $store_info['store_credit']->isEmpty()))): if(is_array($store_info['store_credit']) || $store_info['store_credit'] instanceof \think\Collection || $store_info['store_credit'] instanceof \think\Paginator): if( count($store_info['store_credit'])==0 ) : echo "" ;else: foreach($store_info['store_credit'] as $key=>$value): ?>
                <li> <?php echo htmlentities($value['text']); ?><span class="credit"><?php echo htmlentities($value['credit']); ?> <?php echo htmlentities(lang('credit_unit')); ?></span>
                    <?php if(isset($value['percent_class'])): ?>
                    <span class="<?php echo htmlentities($value['percent_class']); ?>"><i></i><?php echo htmlentities($value['percent_text']); ?><em><?php echo htmlentities($value['percent']); ?></em></span> </li>
                <?php endif; ?>
               <?php endforeach; endif; else: echo "" ;endif; ?>
                <?php endif; ?>
            </ul>
        </div>
        
        <!--只有实名认证实体店认证后才显示保障体系-->
          <?php if($store_info['store_baozh']): ?>
        <dl class="messenger">
            <dt><span class="t_adjust"><?php echo htmlentities(lang('merchant_guarantee')); ?></span><span>：</span></dt>
            <dd>
                <!--新加的保障-->
                <?php if($store_info['store_shiti']): ?>
                <span id="certMatershiti" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('physical_certification')); ?>"></span>
                <?php endif; if($store_info['store_qtian']): ?>
                <span id="certMaterqtian" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('physical_filming')); ?>"></span>
                <?php endif; if($store_info['store_zhping']): ?>
                <span id="certMaterzhping" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('genuine_protection')); ?>"></span>
                <?php endif; if($store_info['store_erxiaoshi']): ?>
                <span id="certMatererxiaoshi" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('delivery_within_hours')); ?>"></span>
                <?php endif; if($store_info['store_tuihuo']): ?>
                <span id="certMatertuihuo" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('return_commitment')); ?>"></span>
                <?php endif; if($store_info['store_shiyong']): ?>
                <span id="certMatershiyong" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('trial_center')); ?>"></span>
                <?php endif; if($store_info['store_xiaoxie']): ?>
                <span id="certMaterxiaoxie" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('consumer_protection')); ?>"></span>
                <?php endif; if($store_info['store_huodaofk']): ?>
                <span id="certMaterhuodaofk" class="text-hidden fl ml5" title="<?php echo htmlentities(lang('support_cash_delivery')); ?>"></span>
                <?php endif; ?>
                <!--新加的保障-->
            </dd>
        </dl>
        <?php endif; ?>
        <!--保证金金额-->
        <?php if($store_info['store_avaliable_deposit'] > 0): ?>
        <dl class="messenger">
            <dt><span class="t_adjust"><?php echo htmlentities(lang('guaranteed_amount')); ?></span><span>：</span></dt>
            <dd style="width: 100px;"><?php echo htmlentities($store_info['store_avaliable_deposit']); ?>
            </dd>
        </dl>
       <?php endif; ?>

        <dl class="no-border">
            <dt><span class="t_adjust"><?php echo htmlentities(lang('company_name')); ?></span><span>：</span></dt>
            <dd><?php echo htmlentities($store_info['store_company_name']); ?></dd>
        </dl>
        <dl class="no-border">
            <dt><span class="t_adjust"><?php echo htmlentities(lang('ds_srore_location')); ?></span><span>：</span></dt>
            <dd><?php echo htmlentities($store_info['area_info']); ?></dd>
        </dl>
        <?php if(!(empty($store_info['store_phone']) || (($store_info['store_phone'] instanceof \think\Collection || $store_info['store_phone'] instanceof \think\Paginator ) && $store_info['store_phone']->isEmpty()))): ?>
        <dl class="no-border">
            <dt><span class="t_adjust"><?php echo htmlentities(lang('phone_space')); ?></span><span>：</span></dt>
            <dd><?php echo htmlentities($store_info['store_phone']); ?></dd>
        </dl>
        <?php endif; ?>
        <dl>
            <dt><span class="t_adjust"><?php echo htmlentities(lang('business_licence_number_electronic')); ?></span><span>：</span></dt>
            <dd>
                <?php if(!$store_info['is_platform_store']): if($store_info['business_licence_number_electronic']): ?>
                <a href="<?php echo htmlentities($store_info['business_licence_number_electronic']); ?>" ><?php echo htmlentities(lang('ds_view')); ?></a>
                <?php endif; else: if(config('ds_config.business_licence')): ?>
                <a href="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.business_licence')); ?>" ><?php echo htmlentities(lang('ds_view')); ?></a>
                <?php endif; ?>
                <?php endif; ?>
            </dd>
        </dl>
        <div class="shop-other" id="shop-other">
            <div class="goto">
                <a href="javascript:collect_store('<?php echo htmlentities($store_info['store_id']); ?>','count','store_collect')" ><i class="iconfont">&#xe6e4;</i><?php echo htmlentities(lang('ds_collect')); ?></a>
                <a href="<?php echo url('Storesnshome/index',['sid'=>$store_info['store_id']]); ?>" ><i class="iconfont">&#xe635;</i><?php echo htmlentities(lang('ds_dynamics')); ?></a>
            </div>
            <div class="shop_btn">
                <?php if($store_info['store_longitude'] != ""): ?>
                <div class="dss-info-btn-map iconfont">&#xe720;
                    <div class="dss-info-map" id="map_container" style="width:208px;height:208px;"></div>
                </div>
                <?php endif; ?>
                <div class="dss-info-btn-qrcode iconfont" >&#xe72d;
                    <div class="dss-info-qrcode"><img src="<?php echo store_qrcode($store_info['store_id']); ?>" title="<?php echo htmlentities(lang('shop_primitive')); ?><?php echo url('Store/goods_all',['store_id'=>$store_info['store_id']]); ?>" style="width:208px;height:208px"></div>
                </div>
                
                
            </div>
            
        </div>
    </div>
</div>
<!--店铺基本信息 E-->
<script type="text/javascript">
    var BASESITEROOT = "<?php echo htmlentities(BASE_SITE_ROOT); ?>";
    var BASESITEURL = "<?php echo htmlentities(BASE_SITE_URL); ?>";
    var HOMESITEURL = "<?php echo htmlentities(HOME_SITE_URL); ?>";
    var cityName = "<?php echo htmlentities($store_info['store_address']); ?>";
    var address = "<?php echo htmlentities($store_info['area_info']); ?>";
    var store_name = "<?php echo htmlentities($store_info['store_company_name']); ?>";
    var store_longitude = "<?php echo htmlentities($store_info['store_longitude']); ?>";
    var store_latitude = "<?php echo htmlentities($store_info['store_latitude']); ?>"
    function initialize() {
        var map = new BMap.Map("map_container");          // 创建地图实例
        if(store_longitude != "" && store_latitude != ""){
                    var point = new BMap.Point(store_longitude,store_latitude);  // 创建点坐标
                    map.centerAndZoom(point, 15);
                    map.enableScrollWheelZoom(true);
                    map.clearOverlays(); 
                    var new_point = new BMap.Point(store_longitude,store_latitude);
                    var marker = new BMap.Marker(new_point);
                    map.addOverlay(marker);
                    map.panTo(new_point);
		}
    }
    function loadScript() {
        var script = document.createElement("script");
        script.src = "<?php echo htmlentities(HTTP_TYPE); ?>api.map.baidu.com/api?v=2.0&callback=initialize";
        document.body.appendChild(script);
    }

    // 当鼠标放在店铺地图上再加载百度地图。
    $(function(){
        $('.dss-info-btn-map').one('mouseover',function(){
            loadScript();
        });
        $('.dss-info-btn-map').one('click',function(){
            loadScript();
        });
    });
</script>

<script>
    $(function(){
        var store_id = "<?php echo htmlentities($store_info['store_id']); ?>";
        var goods_id = "<?php echo htmlentities(app('request')->param('goods_id')); ?>";
        var controller = "<?php echo htmlentities(app('request')->controller()); ?>";
        var action  = "<?php echo app('request')->action()?app('request')->action() : 'index'; ?>";
        $.getJSON("<?php echo url('Store/ajax_flowstat_record'); ?>",{store_id:store_id,goods_id:goods_id,controller_param:controller,action_param:action});
    });
</script>
      <div class="dss-message-bar">
          <div class="common_title">
              <h2><?php echo htmlentities(lang('ds_message_center')); ?></h2>
          </div>
			
			<?php if(!empty($store_info['store_whatsappurl'])): ?>
			<div class="service-list" store_id="<?php echo htmlentities($store_info['store_id']); ?>" store_name="<?php echo htmlentities($store_info['store_name']); ?>">
				<dl>
					<dt>点击咨询</dt>	
				</dl>
				<div style="text-align: center;cursor:pointer">
					<a href="<?php echo htmlentities($store_info['store_whatsappurl']); ?>" target="_blank"><img border="0" src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/seller/icon-whatsapp.png" style="width: 100px;vertical-align: middle;"/></a>
				</div>
				
			</div>
			<?php endif; ?>
          <!--<?php if(!empty($store_info['store_presales']) || !empty($store_info['store_aftersales']) || $store_info['store_workingtime'] !=''): ?>-->
          <!--<div class="service-list" store_id="<?php echo htmlentities($store_info['store_id']); ?>" store_name="<?php echo htmlentities($store_info['store_name']); ?>">-->
          <!--    <?php if(!(empty($store_info['store_presales']) || (($store_info['store_presales'] instanceof \think\Collection || $store_info['store_presales'] instanceof \think\Paginator ) && $store_info['store_presales']->isEmpty()))): ?>-->
          <!--    <dl>-->
          <!--        <dt><?php echo htmlentities(lang('ds_message_presales')); ?></dt>-->
          <!--        <?php if(is_array($store_info['store_presales']) || $store_info['store_presales'] instanceof \think\Collection || $store_info['store_presales'] instanceof \think\Paginator): if( count($store_info['store_presales'])==0 ) : echo "" ;else: foreach($store_info['store_presales'] as $key=>$val): ?>-->
          <!--        <dd><span><?php echo htmlentities($val['name']); ?></span><span>-->
          <!--                <?php if($val['type'] == 1): ?>-->
          <!--                <a  href="<?php echo htmlentities(HTTP_TYPE); ?>wpa.qq.com/msgrd?v=3&uin=<?php echo htmlentities($val['num']); ?>&site=qq&menu=yes" title="QQ: <?php echo htmlentities($val['num']); ?>"><img border="0" src="<?php echo htmlentities(HTTP_TYPE); ?>wpa.qq.com/pa?p=2:<?php echo htmlentities($val['num']); ?>:51" style=" vertical-align: middle;"/></a>-->
          <!--                <?php elseif($val['type'] ==2): ?>-->
          <!--                <a  href="http://amos.im.alisoft.com/msg.aw?v=2&amp;uid=<?php echo htmlentities($val['num']); ?>&site=cntaobao&s=1&charset=UTF-8" ><img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=<?php echo htmlentities($val['num']); ?>&site=cntaobao&s=2&charset=UTF-8" alt="<?php echo htmlentities(lang('ds_message_me')); ?>"/></a>-->
          <!--                <?php elseif($val['type']==3): ?>-->
          <!--                <span c_name="<?php echo htmlentities($val['name']); ?>" member_id="<?php echo htmlentities($val['num']); ?>"></span>-->
          <!--                <?php endif; ?>-->
          <!--            </span></dd>-->
          <!--        <?php endforeach; endif; else: echo "" ;endif; ?>-->
          <!--    </dl>-->
          <!--    <?php endif; ?>-->
          <!--    <?php if(!(empty($store_info['store_aftersales']) || (($store_info['store_aftersales'] instanceof \think\Collection || $store_info['store_aftersales'] instanceof \think\Paginator ) && $store_info['store_aftersales']->isEmpty()))): ?>-->
          <!--    <dl>-->
          <!--        <dt><?php echo htmlentities(lang('ds_message_service')); ?></dt>-->
          <!--        <?php if(is_array($store_info['store_aftersales']) || $store_info['store_aftersales'] instanceof \think\Collection || $store_info['store_aftersales'] instanceof \think\Paginator): if( count($store_info['store_aftersales'])==0 ) : echo "" ;else: foreach($store_info['store_aftersales'] as $key=>$val): ?>-->
          <!--        <dd><span><?php echo htmlentities($val['name']); ?></span>-->
          <!--            <span>-->
          <!--                <?php if($val['type'] == 1): ?>-->
          <!--                <a href="<?php echo htmlentities(HTTP_TYPE); ?>wpa.qq.com/msgrd?v=3&uin=<?php echo htmlentities($val['num']); ?>&site=qq&menu=yes" title="QQ: <?php echo htmlentities($val['num']); ?>" ><img border="0" src="<?php echo htmlentities(HTTP_TYPE); ?>wpa.qq.com/pa?p=2:<?php echo htmlentities($val['num']); ?>:52" alt="<?php echo htmlentities(lang('ds_message_me')); ?>" style=" vertical-align: middle;"></a>-->
          <!--                <?php elseif($val['type'] ==2): ?>-->
          <!--                <a  href="http://amos.im.alisoft.com/msg.aw?v=2&amp;uid=<?php echo htmlentities($val['num']); ?>&site=cntaobao&s=1&charset=UTF-8" ><img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=<?php echo htmlentities($val['num']); ?>&site=cntaobao&s=2&charset=UTF-8" alt="<?php echo htmlentities(lang('ds_message_me')); ?>"/></a>-->
          <!--                <?php elseif($val['type']==3): ?>-->
          <!--                <span c_name="<?php echo htmlentities($val['name']); ?>" member_id="<?php echo htmlentities($val['num']); ?>"></span>-->
          <!--                <?php endif; ?>-->
          <!--            </span>-->
          <!--        </dd>-->
          <!--          <?php endforeach; endif; else: echo "" ;endif; ?>-->
          <!--    </dl>-->
          <!--    <?php endif; ?>-->
          <!--    <?php if($store_info['store_workingtime'] !=''): ?>-->
          <!--    <dl class="workingtime">-->
          <!--        <dt><?php echo htmlentities(lang('ds_message_working')); ?></dt>-->
          <!--        <dd>-->
          <!--            <p><?php echo html_entity_decode($store_info['store_workingtime']); ?></p>-->
          <!--        </dd>-->
          <!--    </dl>-->
          <!--    <?php endif; ?>-->
          <!--</div>-->
          <!--<?php endif; ?>-->
      </div>





<div class="common_module">
            <div class="common_title">
                <h2><?php echo htmlentities(lang('ds_hot_goods_rankings')); ?></h2>
            </div>
            <div class="common_content">
                <ul>
                    <?php if(is_array($hot_sales) || $hot_sales instanceof \think\Collection || $hot_sales instanceof \think\Paginator): if( count($hot_sales)==0 ) : echo "" ;else: foreach($hot_sales as $key=>$val): ?>
                    <li>
                        <div class="p_img">
                            <a href="<?php echo url('Goods/index',['goods_id'=>$val['goods_id']]); ?>"><img src="<?php echo goods_thumb($val, 240); ?>" width="85" height="85"></a>
                        </div>
                        <div class="p_num <?php if($key < 3): ?>active<?php endif; ?>"><?php echo $key+1; ?></div>
                        <div class="p_info">
                            <div class="p_name">
                                <a href="<?php echo url('Goods/index',['goods_id'=>$val['goods_id']]); ?>"><?php echo htmlentities($val['goods_name']); ?></a>
                            </div>
                            <div class="p_price"><?php echo htmlentities(lang('currency')); ?><em><?php echo htmlentities($val['goods_promotion_price']); ?></em></div>
                            <div class="p_sales"><?php echo htmlentities(lang('ds_sell_out')); ?><strong><?php echo htmlentities($val['goods_salenum']); ?></strong><?php echo htmlentities(lang('ds_bi')); ?></div>
                        </div>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
        <div class="common_module">
            <div class="common_title">
                <h2><?php echo htmlentities(lang('ds_hot_collect_rankings')); ?></h2>
            </div>
            <div class="common_content">
                <ul>
                    <?php if(is_array($hot_collect) || $hot_collect instanceof \think\Collection || $hot_collect instanceof \think\Paginator): if( count($hot_collect)==0 ) : echo "" ;else: foreach($hot_collect as $key=>$val): ?>
                    <li>
                        <div class="p_img">
                            <a href="<?php echo url('Goods/index',['goods_id'=>$val['goods_id']]); ?>"><img src="<?php echo goods_thumb($val, 240); ?>" width="85" height="85"></a>
                        </div>
                        <div class="p_num <?php if($key < 3): ?>active<?php endif; ?>"><?php echo $key+1; ?></div>
                        <div class="p_info">
                            <div class="p_name">
                                <a href="<?php echo url('Goods/index',['goods_id'=>$val['goods_id']]); ?>"><?php echo htmlentities($val['goods_name']); ?></a>
                            </div>
                            <div class="p_price"><?php echo htmlentities(lang('currency')); ?><em><?php echo htmlentities($val['goods_promotion_price']); ?></em></div>
                            <div class="p_sales"><?php echo htmlentities(lang('ds_collection_popularity')); ?><?php echo htmlentities(lang('ds_colon')); ?><strong><?php echo htmlentities($val['goods_collect']); ?></strong></div>
                        </div>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    <!--侧边推荐 END-->





    <?php if(isset($viewed_goods)): ?>
    <!-- 最近浏览 -->
    <div class="dss-sidebar-container dss-top-bar">
      <div class="title">
        <h4><?php echo htmlentities(lang('recent_browsing')); ?></h4>
      </div>
      <div class="content">
        <div id="hot_sales_list" class="dss-top-panel">
          <ol>
            <?php if(is_array($viewed_goods) || $viewed_goods instanceof \think\Collection || $viewed_goods instanceof \think\Paginator): if( count($viewed_goods)==0 ) : echo "" ;else: foreach($viewed_goods as $key=>$g): ?>
            <li>
              <dl>
                <dt><a href="<?php echo url('Goods/index',['goods_id'=>$g['goods_id']]); ?>"><?php echo htmlentities($g['goods_name']); ?></a></dt>
                <dd class="goods-pic"><a href="<?php echo url('Goods/index',['goods_id'=>$g['goods_id']]); ?>"><span class="thumb size40"><i></i><img src="<?php echo goods_thumb($g, 240); ?>"  onload="javascript:ResizeImage(this,40,40);"></span></a>
                  <p><span class="thumb size100"><i></i><img src="<?php echo goods_thumb($g, 240); ?>" onload="javascript:ResizeImage(this,100,100);" title="<?php echo htmlentities($g['goods_name']); ?>"><big></big><small></small></span></p>
                </dd>
                <dd class="price pngFix"><?php echo ds_price_format($g['goods_promotion_price']); ?></dd>
              </dl>
            </li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </ol>
        </div>
        <a href="<?php echo url('Membergoodsbrowse/listinfo'); ?>" class="dsh-sidebar-all-viewed"><?php echo htmlentities(lang('full_browsing_history')); ?></a> </div>
    </div>
    <?php endif; ?>
  </div>
</div>

<form id="buynow_form" method="post" action="<?php echo url('Buy/buy_step1'); ?> ">
  <input id="cart_id" name="cart_id[]" type="hidden"/>
</form>

</div>
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.SuperSlide.2.1.1.js"></script>
<script>
    jQuery(".intro_r").slide({titCell:".mb ul",mainCell:".mc ul",autoPage:true,effect:"top",vis:2,trigger:"click"});
</script>
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.lazyload.min.js"></script>
<script src="<?php echo htmlentities(BASE_SITE_ROOT); ?>/static/home/default/store/styles/<?php echo htmlentities($store_theme); ?>/js/jquery.jqzoom.js"></script>
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.ajaxContent.pack.js"></script>
<!-- <script type="text/javascript" src="<?php echo htmlentities(HTTP_TYPE); ?>api.map.baidu.com/api?v=2.0&ak=<?php echo htmlentities($baidu_ak); ?>"></script> -->
<script>
    $("img.lazyload").lazyload({
        effect: "fadeIn",
        placeholder:"<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/loading.gif"
    });
      $(function () {
          /*商品缩略图放大镜*/
          $(".jqzoom").jqueryzoom({
              xzoom: 450,
              yzoom: 450,
              offset: 1,
              position: "right",
              preload: 1,
              lens: 1
          });
          //初始化对比按钮
          initCompare()
           $('[dstype="show_chain"]').click(function(){
                ajax_form('show_chain', '查看门店', '<?php echo url("Goods/show_chain",["goods_id"=>$goods['goods_id'],]); ?>', 640);
            });
      });
    //收藏分享处下拉操作
    jQuery.divselect = function(divselectid,inputselectid) {
      var inputselect = $(inputselectid);
      $(divselectid).mouseover(function(){
          var ul = $(divselectid+" ul");
          ul.slideDown("fast");
          if(ul.css("display")=="none"){
              ul.slideDown("fast");
          }
      });
      $(divselectid).on('mouseleave',function(){
          $(divselectid+" ul").hide();
      });
    };
$(function(){


    <?php if($goods['goods_state'] == '1' && $goods['goods_storage'] > 0): ?>
    // 加入购物车
    $('a[dstype="addcart_submit"]').click(function(){
    <?php if(session('is_login') != '1'): ?>
        login_dialog()
        <?php else: ?>
    	if (typeof(allow_buy) != 'undefined' && allow_buy === false) return ;
        var buy_goods_quantity = checkQuantity();
        if(buy_goods_quantity>0){
            addcart(<?php echo htmlentities($goods['goods_id']); ?>, buy_goods_quantity,'addcart_callback');
        }
        <?php endif; ?>
    });
        <?php if (!($goods['is_virtual'] == 1 && $goods['virtual_indate'] < TIMESTAMP)) {?>
        // 立即购买
        $('a[dstype="buynow_submit"]').click(function(){
            if (typeof(allow_buy) != 'undefined' && allow_buy === false) return ;
            var buy_goods_quantity = checkQuantity();
            if(buy_goods_quantity>0){
                buynow(<?php echo htmlentities($goods['goods_id']); ?>,buy_goods_quantity);
            }
        });
        <?php }?>
    <?php endif; ?>


    // 到货通知
    <?php if($goods['goods_storage'] == '0' || $goods['goods_state'] == '0'): ?>
    $('a[dstype="arrival_notice"]').click(function(){
            <?php if(session('is_login') != '1'): ?>
        login_dialog();
        <?php else: ?>
        ajax_form('arrival_notice', '<?php echo htmlentities(lang('arrival_notice')); ?>',"<?php echo url('Goods/arrival_notice',['goods_id'=>$goods['goods_id']]); ?>", 350);
        <?php endif; ?>
    });
    <?php endif; if(($goods['goods_state'] == 0 || $goods['goods_storage'] <= 0) && $goods['is_appoint'] == 1): ?>
    $('a[dstype="appoint_submit"]').click(function(){
        <?php if(session('is_login') !== '1'): ?>
        login_dialog();
        <?php else: ?>
        ajax_form('arrival_notice', '<?php echo htmlentities(lang('make_appointment_immediately')); ?>', "<?php echo url('Goods/arrival_notice',['goods_id'=>$goods['goods_id'],'type'=>'2']); ?>", 350);
        <?php endif; ?>
    });
    <?php endif; ?>


    // 规格选择
    $('dl[dstype="ds-spec"]').find('a').each(function(){
        $(this).click(function(){
            if ($(this).hasClass('hovered')) {
                return false;
            }
            $(this).parents('ul:first').find('a').removeClass('hovered');
            $(this).addClass('hovered');
            checkSpec();
        });
    });

});
function checkSpec() {
    var spec_param = <?php echo $spec_list; ?>;
    var spec = new Array();
    $('ul[nctyle="ul_sign"]').find('.hovered').each(function(){
        var data_str = ''; eval('data_str =' + $(this).attr('data-param'));
        spec.push(data_str.valid);
    });
    spec1 = spec.sort(function(a,b){
        return a-b;
    });
    var spec_sign = spec1.join('|');
    $.each(spec_param, function(i, n){
        if (n.sign == spec_sign) {
            window.location.href = n.url;
        }
    });
}

// 验证购买数量
function checkQuantity(){
    var quantity = parseInt($("#quantity").val());
    if (quantity < 1) {
        layer.msg("<?php echo htmlentities(lang('goods_index_pleaseaddnum')); ?>");
        $("#quantity").val('1');
        return false;
    }
    max = parseInt($('[dstype="goods_stock"]').text());
    <?php if($goods['is_virtual'] == 1 && $goods['virtual_limit'] > 0): ?>
    max = <?php echo htmlentities($goods['virtual_limit']); ?>;
    if(quantity > max){
        layer.msg('<?php echo htmlentities(lang('maximum_purchase')); ?>'+max+'<?php echo htmlentities(lang('piece')); ?>');
        return false;
    }
    <?php endif; if(!(empty($goods['upper_limit']) || (($goods['upper_limit'] instanceof \think\Collection || $goods['upper_limit'] instanceof \think\Paginator ) && $goods['upper_limit']->isEmpty()))): ?>       
    max = <?php echo htmlentities($goods['upper_limit']); ?>;
    if(quantity > max){
        layer.msg('<?php echo htmlentities(lang('maximum_purchase')); ?>'+max+'<?php echo htmlentities(lang('piece')); ?>');
        return false;
    }
    <?php endif; ?>
    if(quantity > max){
        layer.msg("<?php echo htmlentities(lang('goods_index_add_too_much')); ?>");
        return false;
    }
    return quantity;
}
// 立即购买js
function buynow(goods_id,quantity){
    
    <?php if(session('is_login') !== '1'): ?>
	login_dialog();
    <?php else: ?>
    if (!quantity) {
        return;
    }
    <?php if(session('store_id') == $goods['store_id']): ?>
    layer.msg('<?php echo htmlentities(lang('cannot_buy_own_store_goods')); ?>');return;
    <?php endif; ?>
    $("#cart_id").val(goods_id+'|'+quantity);
    $("#buynow_form").submit();
    <?php endif; ?>
}

$(function(){
    //选择地区查看运费
    $('#transport_pannel>a').click(function(){
    	var id = $(this).attr('dstype');
    	if (id=='undefined') return false;
    	var _self = this,tpl_id = '<?php echo htmlentities($goods['transport_id']); ?>';
	    var url = HOMESITEURL+'/Goods/calc.html?rand='+Math.random();
	    $('#transport_price').css('display','none');
	    $('#loading_price').css('display','');
	    $.getJSON(url, {'id':id,'tid':tpl_id}, function(data){
	    	if (data == null) return false;
	        if(data != 'undefined') {$('#nc_kd').html('<?php echo htmlentities(lang('freight')); ?>$Think.lang.ds_colon}<em>' + data + '</em><?php echo htmlentities(lang('goods_index_yuan')); ?>');}else{'<?php echo htmlentities(lang('goods_index_trans_for_seller')); ?>';}
	        $('#transport_price').css('display','');
	    	$('#loading_price').css('display','none');
	        $('#ncrecive').html($(_self).html());
	    });
    });
    $("#ds-bundling").load("<?php echo url('Goods/get_bundling',['goods_id'=>$goods['goods_id']]); ?>", function(){
        if($(this).html() != '') {
            $(this).show();
        }
    });
    $("#salelog_demo").load("<?php echo url('Goods/salelog',['goods_id'=>$goods['goods_id'],'store_id'=>$goods['store_id'],'vr'=>$goods['is_virtual']]); ?>", function(){
        // Membership card
       $(this).find('[dstype="mcard"]').membershipCard({type:'shop'});
    });
	$("#consulting_demo").load("<?php echo url('Goods/consulting',['goods_id'=>$goods['goods_id'],'store_id'=>$goods['store_id']]); ?>", function(){
		// Membership card
		$(this).find('[dstype="mcard"]').membershipCard({type:'shop'});
	});

/** goods.php **/
	// 商品详情默认情况下显示全部
	$('#tabGoodsIntro').click(function(){
		$('.bd').css('display','none');
		$('#dsGoodsIntro').css('display','');
		$('.hd').css('display','none');
	});
	// 点击评价隐藏其他以及其标题栏
	$('#tabGoodsRate').click(function(){
		$('.bd').css('display','none');
		$('#dsGoodsRate').css('display','');
		$('.hd').css('display','none');
	});
	// 点击成交隐藏其他以及其标题
	$('#tabGoodsTraded').click(function(){
		$('.bd').css('display','none');
		$('#dsGoodsTraded').css('display','');
		$('.hd').css('display','none');
	});
	// 点击咨询隐藏其他以及其标题
	$('#tabGuestbook').click(function(){
		$('.bd').css('display','none');
		$('#dsGuestbook').css('display','');
		$('.hd').css('display','none');
	});
	//商品排行Tab切换
	$(".dss-top-tab > li > a").mouseover(function(e) {
		if (e.target == this) {
			var tabs = $(this).parent().parent().children("li");
			var panels = $(this).parent().parent().parent().children(".dss-top-panel");
			var index = $.inArray(this, $(this).parent().parent().find("a"));
			if (panels.eq(index)[0]) {
				tabs.removeClass("current ").eq(index).addClass("current ");
				panels.addClass("hide").eq(index).removeClass("hide");
			}
		}
	});

//触及显示缩略图
	$('.goods-pic > .thumb').hover(
		function(){
			$(this).next().css('display','block');
		},
		function(){
			$(this).next().css('display','none');
		}
	);

	/* 商品购买数量增减js */
	// 增加
	$('a[dstype="increase"]').click(function(){
            num = parseInt($('#quantity').val());
            <?php if($goods['is_virtual'] == 1 && $goods['virtual_limit'] > 0): ?>
	    max = <?php echo htmlentities($goods['virtual_limit']); ?>;
	    if(num >= max){
	        layer.msg('<?php echo htmlentities(lang('maximum_purchase')); ?>'+max+'<?php echo htmlentities(lang('piece')); ?>');
	        return false;
	    }
            <?php endif; if(!(empty($goods['upper_limit']) || (($goods['upper_limit'] instanceof \think\Collection || $goods['upper_limit'] instanceof \think\Paginator ) && $goods['upper_limit']->isEmpty()))): ?>       
	    max = <?php echo htmlentities($goods['upper_limit']); ?>;
	    if(num >= max){
	        layer.msg('<?php echo htmlentities(lang('maximum_purchase')); ?>'+max+'<?php echo htmlentities(lang('piece')); ?>');
	        return false;
	    }
	    <?php endif; ?>
		max = parseInt($('[dstype="goods_stock"]').text());
		if(num < max){
			$('#quantity').val(num+1);
		}
	});
	//减少
	$('a[dstype="decrease"]').click(function(){
		num = parseInt($('#quantity').val());
		if(num > 1){
			$('#quantity').val(num-1);
		}
	});
    $('#categorymenu').on('click', 'li', function() {
        $('#categorymenu li').removeClass('current');
        $(this).addClass('current');
    });
    //评价列表
    $('#comment_tab').on('click', 'li', function() {
        $('#comment_tab li').removeClass('current');
        $(this).addClass('current');
        load_goodseval($(this).attr('data-type'));
    });
    load_goodseval('all');
    function load_goodseval(type) {
        var url = "<?php echo url('Goods/comments',['goods_id'=>$goods['goods_id']]); ?>";
        url += '&type=' + type;
        $("#goodseval").load(url, function(){
            $(this).find('[dstype="mcard"]').membershipCard({type:'shop'});
        });
    }

    //记录浏览历史
	$.get("<?php echo url('Goods/addbrowse',['gid'=>$goods['goods_id']]); ?>");


    // 满即送、加价购显示隐藏
    $('[dstype="show-rule"]').click(function(){
        $(this).parent().find('[dstype="rule-content"]').show();
    });
    $('[dstype="hide-rule"]').click(function(){
        $(this).parents('[dstype="rule-content"]:first').hide()
    });

    $('.dss-buy').bind({
        mouseover:function(){$(".dss-point").show();},
        mouseout:function(){$(".dss-point").hide();}
    });

});

/* 加入购物车后的效果函数 */
function addcart_callback(data){
if(data.state=='true'){
    $('#bold_num').html(data.num);
    $('#bold_mly').html(price_format(data.amount));
    $('.dss-cart-popup').fadeIn('fast');
}else{
  layer.msg(data.message)
}
}

<?php if($goods['goods_state'] == 1 && $goods['goods_verify'] == 1 && $goods['is_virtual'] == 0){ ?>
var $cur_area_list,$cur_tab,next_tab_id = 0,cur_select_area = [],calc_area_id = '',calced_area = [],cur_select_area_ids = [];
$(document).ready(function(){
	$("#dss-freight-selector").hover(function() {
		//如果店铺没有设置默认显示区域，马上异步请求
		<?php if (!$store_info['deliver_region']) { ?>
		if (typeof ds_a === "undefined") {
	 		$.getJSON(HOMESITEURL + "/Goods/json_area?callback=?", function(data) {
	 			ds_a = data;
	 			$cur_tab = $('#dss-stock').find('li[data-index="0"]');
	 			_loadArea(0);
	 		});
		}
		<?php } ?>
		$(this).addClass("hover");
		$(this).on('mouseleave',function(){
			$(this).removeClass("hover");
		});
	});

	$('ul[class="area-list"]').on('click','a',function(){
		$('#dss-freight-selector').unbind('mouseleave');
		var tab_id = parseInt($(this).parents('div[data-widget="tab-content"]:first').attr('data-area'));
		if (tab_id == 0) {cur_select_area = [];cur_select_area_ids = []};
		if (tab_id == 1 && cur_select_area.length > 1) {
			cur_select_area.pop();
			cur_select_area_ids.pop();
			if (cur_select_area.length > 1) {
				cur_select_area.pop();
				cur_select_area_ids.pop();
			}
		}
		next_tab_id = tab_id + 1;
		var area_id = $(this).attr('data-value');
		$cur_tab = $('#dss-stock').find('li[data-index="'+tab_id+'"]');
		$cur_tab.find('em').html($(this).html());
		$cur_tab.find('i').html('');
		if (tab_id < 2) {
			calc_area_id = area_id;
			cur_select_area.push($(this).html());
			cur_select_area_ids.push(area_id);
			$cur_tab.find('a').removeClass('hover');
			$cur_tab.nextAll().remove();
			if (typeof ds_a === "undefined") {
    	 		$.getJSON(HOMESITEURL + "/Goods/json_area?callback=?", function(data) {
    	 			ds_a = data;
    	 			_loadArea(area_id);
    	 		});
			} else {
				_loadArea(area_id);
			}
		} else {
			//点击第三级，不需要显示子分类
			if (cur_select_area.length == 3) {
				cur_select_area.pop();
				cur_select_area_ids.pop();
			}
			cur_select_area.push($(this).html());
			cur_select_area_ids.push(area_id);
			$('#dss-freight-selector > div[class="text"] > div').html(cur_select_area.join(''));
			$('#dss-freight-selector').removeClass("hover");
			_calc();
		}
		$('#dss-stock').find('li[data-widget="tab-item"]').on('click','a',function(){
			var tab_id = parseInt($(this).parent().attr('data-index'));
			if (tab_id < 2) {
				$(this).parent().nextAll().remove();
				$(this).addClass('hover');
				$('#dss-stock').find('div[data-widget="tab-content"]').each(function(){
					if ($(this).attr("data-area") == tab_id) {
						$(this).show();
					} else {
						$(this).hide();
					}
				});
			}
		});
	});
	function _loadArea(area_id){
		if (ds_a[area_id] && ds_a[area_id].length > 0) {
			$('#dss-stock').find('div[data-widget="tab-content"]').each(function(){
				if ($(this).attr("data-area") == next_tab_id) {
					$(this).show();
					$cur_area_list = $(this).find('ul');
					$cur_area_list.html('');
				} else {
					$(this).hide();
				}
			});
			var areas = [];
			areas = ds_a[area_id];
			for (i = 0; i < areas.length; i++) {
				if (areas[i][1].length > 8) {
					$cur_area_list.append("<li class='longer-area'><a data-value='" + areas[i][0] + "' href='#none'>" + areas[i][1] + "</a></li>");
				} else {
				    $cur_area_list.append("<li><a data-value='" + areas[i][0] + "' href='#none'>" + areas[i][1] + "</a></li>");
				}
			}
			if (area_id > 0){
				$cur_tab.after('<li data-index="' + (next_tab_id) + '" data-widget="tab-item"><a class="hover" href="#none" ><em><?php echo htmlentities(lang('ds_please_choose')); ?></em><i class="iconfont">&#xe689;</i></a></li>');
			}
		} else {
			//点击第一二级时，已经到了最后一级
			$cur_tab.find('a').addClass('hover');
			$('#dss-freight-selector > div[class="text"] > div').html(cur_select_area);
			$('#dss-freight-selector').removeClass("hover");
			_calc();
		}
	}
	//计算运费，是否配送
	function _calc() {
		$.cookie('dregion', cur_select_area_ids.join(' ')+'|'+cur_select_area.join(' '), { expires: 30 });
		<?php if (! $goods['transport_id']) { ?>
		return;
		<?php } ?>
		var _args = '';
		_args += "&tid=<?php echo $goods['transport_id']?>";
		<?php if ($store_info['is_platform_store']) { ?>
		_args += "&super=1";
		<?php } ?>
		if (_args != '') {
			_args += '&area_id=' + calc_area_id ;
			if (typeof calced_area[calc_area_id] == 'undefined') {
				//需要请求配送区域设置
				$.getJSON(HOMESITEURL + "/Goods/calc.html?" + _args + "&myf=<?php echo $store_info['store_free_price']?>&callback=?", function(data){
					allow_buy = data.total ? true : false;
					calced_area[calc_area_id] = data.total;
					if (data.total === false) {
						$('#dss-freight-prompt > strong').html('<?php echo htmlentities(lang('goods_out_stock')); ?>').next().remove();
						$('a[dstype="buynow_submit"]').addClass('no-buynow');
						$('a[dstype="addcart_submit"]').addClass('no-buynow');
						$('#store-free-time').hide();
					} else {
						$('#dss-freight-prompt > strong').html('<?php echo htmlentities(lang('goods_stock')); ?> ').next().remove();
						$('#dss-freight-prompt > strong').after('<span>' + data.total + '</span>');
						$('a[dstype="buynow_submit"]').removeClass('no-buynow');
						$('a[dstype="addcart_submit"]').removeClass('no-buynow');
						$('#store-free-time').show();
					}
				});
			} else {
				if (calced_area[calc_area_id] === false) {
					$('#dss-freight-prompt > strong').html('<?php echo htmlentities(lang('goods_out_stock')); ?>').next().remove();
					$('a[dstype="buynow_submit"]').addClass('no-buynow');
					$('a[dstype="addcart_submit"]').addClass('no-buynow');
					$('#store-free-time').hide();
				} else {
					$('#dss-freight-prompt > strong').html('<?php echo htmlentities(lang('goods_stock')); ?>').next().remove();
					$('#dss-freight-prompt > strong').after('<span>' + calced_area[calc_area_id] + '</span>');
					$('a[dstype="buynow_submit"]').removeClass('no-buynow');
					$('a[dstype="addcart_submit"]').removeClass('no-buynow');
					$('#store-free-time').show();
				}
			}
		}
	}
	//如果店铺设置默认显示配送区域
	<?php if ($store_info['deliver_region']) { ?>
	if (typeof ds_a === "undefined") {
 		$.getJSON(HOMESITEURL + "/Goods/json_area.html?callback=?", function(data) {
 			ds_a = data;
 			$cur_tab = $('#dss-stock').find('li[data-index="0"]');
 			_loadArea(0);
 			$('ul[class="area-list"]').find('a[data-value="<?php echo htmlentities((isset($store_info['deliver_region_ids']['0']) && ($store_info['deliver_region_ids']['0'] !== '')?$store_info['deliver_region_ids']['0']:"")); ?>"]').click();
 		    <?php if (isset($store_info['deliver_region_ids'][1])) { ?>
 			$('ul[class="area-list"]').find('a[data-value="<?php echo $store_info['deliver_region_ids'][1];?>"]').click();
 		    <?php } if (isset($store_info['deliver_region_ids'][2])) { ?>
 			$('ul[class="area-list"]').find('a[data-value="<?php echo $store_info['deliver_region_ids'][2];?>"]').click();
 			<?php } ?>
 		});
	}
	<?php } ?>
});
<?php }?>



                                //缩略图切换
                                $('.small-pic-li').each(function(i, o) {
                                    var lilength = $('.small-pic-li').length;
                                    $(o).hover(function() {
                                        $(o).siblings().removeClass('active');
                                        $(o).addClass('active');
                                        $('#zoomimg').attr('src', $(o).find('img').attr('data-img'));
                                        $('#zoomimg').attr('jqimg', $(o).find('img').attr('data-big'));
                                        $('.next-btn').removeClass('disabled');
                                        if (i == 0) {
                                            $('.next-left').addClass('disabled');
                                        }
                                        if (i + 1 == lilength) {
                                            $('.next-right').addClass('disabled');
                                        }
                                    });
                                })

                                //前一张缩略图
                                $('.next-left').click(function() {
                                    var newselect = $('.small-pic>.active').prev();
                                    if(!newselect.length){
                                        return;
                                    }
                                    $('.small-pic>.active').removeClass('active');
                                    $(newselect).addClass('active');
                                    $('#zoomimg').attr('src', $(newselect).find('img').attr('data-img'));
                                    $('#zoomimg').attr('jqimg', $(newselect).find('img').attr('data-big'));
                                    var index = $('.small-pic>li').index(newselect);
                                    $('.small-pic').css('left',(-parseInt(index/4)*79*4)+'px')
                                    if (index == 0) {
                                        $('.next-left').addClass('disabled');
                                    }
                                    $('.next-right').removeClass('disabled');
                                })

                                //后前一张缩略图
                                $('.next-right').click(function() {
                                    var newselect = $('.small-pic>.active').next();
                                    if(!newselect.length){
                                        return;
                                    }
                                    $('.small-pic>.active').removeClass('active');
                                    $(newselect).addClass('active');
                                    $('#zoomimg').attr('src', $(newselect).find('img').attr('data-img'));
                                    $('#zoomimg').attr('jqimg', $(newselect).find('img').attr('data-big'));
                                    var index = $('.small-pic>li').index(newselect);
                                    $('.small-pic').css('left',(-parseInt(index/4)*79*4)+'px')
                                    if (index + 1 == $('.small-pic>li').length) {
                                        $('.next-right').addClass('disabled');
                                    }
                                    $('.next-left').removeClass('disabled');
                                })

                                /**
                                 * 加减数量
                                 * n 点击一次要改变多少
                                 * maxnum 允许的最大数量(库存)
                                 * number ，input的id
                                 */
                                function altergoodsnum(n) {
                                    var num = parseInt($('#quantity').val());
                                    var maxnum = parseInt($('#quantity').attr('max'));
                                    num += n;
                                    num <= 0 ? num = 1 : num;
                                    if (num >= maxnum) {
                                        $(this).addClass('no-mins');
                                        num = maxnum;
                                    }
                                    $('#store_count').text(maxnum - num); //更新库存数量
                                    $('#quantity').val(num)
                                }

</script>







<div class="server">
    <div class="ensure">
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
    </div>
    <div class="mall_desc">
        <?php if(!(empty($article_list) || (($article_list instanceof \think\Collection || $article_list instanceof \think\Paginator ) && $article_list->isEmpty()))): if(is_array($article_list) || $article_list instanceof \think\Collection || $article_list instanceof \think\Paginator): $_60740d797c936 = is_array($article_list) ? array_slice($article_list,0,4, true) : $article_list->slice(0,4, true); if( count($_60740d797c936)==0 ) : echo "" ;else: foreach($_60740d797c936 as $key=>$art): ?>
        <dl> 
            <dt><?php echo htmlentities($art['ac_name']); ?></dt>
            <dd>
                <?php if(!(empty($art['list']) || (($art['list'] instanceof \think\Collection || $art['list'] instanceof \think\Paginator ) && $art['list']->isEmpty()))): if(is_array($art['list']) || $art['list'] instanceof \think\Collection || $art['list'] instanceof \think\Paginator): if( count($art['list'])==0 ) : echo "" ;else: foreach($art['list'] as $key=>$list): ?>
                <a href="<?php if($list['article_url'] !=''): ?><?php echo htmlentities($list['article_url']); else: ?><?php echo url('Article/show',['article_id'=>$list['article_id']]); ?><?php endif; ?>"><?php echo htmlentities($list['article_title']); ?></a>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                <?php endif; ?>
            </dd>
        </dl>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <?php endif; ?>
        <dl class="mall_mobile">
            <dt><?php echo htmlentities(lang('ds_mobile_mall')); ?></dt>
            <dd>
                <a href="#" class="join">
                    <!-- <img src="<?php echo htmlentities(HOME_SITE_URL); ?>/qrcode?url=<?php echo htmlentities(config('ds_config.h5_site_url')); ?>" width="105" height="105" > -->
                    <img src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logowx')); ?>" width="105" height="105" >
                </a>
            </dd> 
        </dl>
    </div>
</div>






<?php if(config('ds_config.node_site_use') == '1' && !isset($wait) && request()->controller() != 'Payment' && request()->controller() != 'Showgroupbuy'): ?>
<?php echo get_chat(); ?>
<?php endif; ?>
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.cookie.js"></script>
<script src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/js/compare.js"></script>
<link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/perfect-scrollbar.min.css">
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/qtip/jquery.qtip.min.js"></script>
<link href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/qtip/jquery.qtip.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.lazyload.min.js"></script>
<script>
    //懒加载
    $("img.lazyload").lazyload({
//        placeholder : "<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/loading.gif",
        effect: "fadeIn",
        skip_invisible : false,
        threshold : 200,
    });
</script>
<div class="footer-info">
    <!-- <div class="links w1200">
        <?php foreach($navs['footer'] as $nav): ?>
        <a href="<?php echo htmlentities($nav['nav_url']); ?>" <?php if($nav['nav_new_open'] == 1): ?><?php endif; ?>><?php echo htmlentities($nav['nav_title']); ?></a>|
        <?php endforeach; ?>
    </div> -->
    <p class="copyright"><?php echo htmlentities(config('ds_config.flow_static_code')); ?></p>
</div>
