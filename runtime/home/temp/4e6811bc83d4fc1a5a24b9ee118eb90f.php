<?php /*a:3:{s:77:"D:\wwwroot\shops.domibuy.com\app\home\view\default\mall\showjoinin\index.html";i:1612516962;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\base_joinin.html";i:1612516962;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\mall_footer.html";i:1612516962;}*/ ?>
<!doctype html>
<html>
    <head>
        <title> - <?php echo htmlentities(lang('tenants')); ?></title>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/common.css">
        <link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/seller_joinin.css">
        <link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery-ui.min.css">
        <script>
            var BASESITEROOT = "<?php echo htmlentities(BASE_SITE_ROOT); ?>";
            var BASESITEURL = "<?php echo htmlentities(BASE_SITE_URL); ?>";
            var HOMESITEURL = "<?php echo htmlentities(HOME_SITE_URL); ?>";
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
    <div id="append_parent"></div>
    <div id="ajaxwaitid"></div>
    <div class="public-top">
        <div class="w1200">
            <span class="top-link">
                <?php echo htmlentities(lang('welcome_to')); ?> <em><?php echo htmlentities(config('ds_config.site_name')); ?></em>
            </span>
            <ul class="login-regin">
                <?php if(session('member_id')): ?>
                <li class="line"> <a href="<?php echo url('Member/index'); ?>"><?php echo session('member_nickname'); ?></a></li>
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
                    <a href="<?php echo url('Seller/index'); ?>"><?php echo htmlentities(lang('business_center')); ?><b></b></a>
                    <div class="dropdown-menu">
                        <ol>
                            <li><a href="<?php echo url('Showjoinin/index'); ?>"><?php echo htmlentities(lang('tenants')); ?></a></li>
                            <li><a href="<?php echo url('Sellerlogin/login'); ?>"><?php echo htmlentities(lang('merchant_login')); ?></a></li>
                        </ol>
                    </div>
                </li>
                <li class="moblie-qrcode">
                    <span class="outline"></span>
                    <span class="blank"></span>
                    <a href="javascript:void(0)"><?php echo htmlentities(lang('wechat_end')); ?></a>
                    <div class="dropdown-menu">
                        <img src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logowx')); ?>" width="90" height="90" />
                    </div>
                </li>
                <!-- <li class="app-qrcode">
                    <span class="outline"></span>
                    <span class="blank"></span>
                    <a href="javascript:void(0)">APP</a>
                    <div class="dropdown-menu">
                        <img width="90" height="90" src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logowx')); ?>" />
                        <h3><?php echo htmlentities(lang('scan_qr_code')); ?></h3>
                        <p><?php echo htmlentities(lang('download_mobile_client')); ?></p>
                    </div>
                </li> -->
            </ul>
        </div>
    </div>
    <div class="header">
        <h2 class="header_logo">
            <a href="<?php echo htmlentities(HOME_SITE_URL); ?>"><img src="<?php echo ds_get_pic(ATTACH_COMMON,config('ds_config.site_logo')); ?>"/></a>
        </h2>
        <span class="header_span"><?php echo htmlentities(lang('tenants')); ?></span>
    </div>
    <div class="header_nav">
        <ul class="header_menu w1200">
            <li class="<?php if(app('request')->controller()=='Showjoinin'): ?>cur<?php endif; ?>"><a href="<?php echo url('Showjoinin/index'); ?>"><?php echo htmlentities(lang('homepage')); ?></a></li>
            <li class="<?php if(app('request')->controller()=='Sellerjoinin'): ?>cur<?php endif; ?>"><a href="<?php echo url('Sellerjoinin/index'); ?>"><?php echo htmlentities(lang('merchant_entry_application')); ?></a></li>
            <li class="<?php if(app('request')->controller()=='Seller'): ?>cur<?php endif; ?>"><a href="<?php echo url('Seller/index'); ?>"><?php echo htmlentities(lang('business_management_center')); ?></a></li>
            <li class="<?php if(app('request')->controller()=='Showhelp'): ?>cur<?php endif; ?>"><a href="<?php echo url('Showhelp/index'); ?>"><?php echo htmlentities(lang('business_showhelp_center')); ?></a></li>
        </ul>
    </div>
   <script type="text/javascript">
    function show_list(t_id) {
        var obj = $(".sidebar dl[show_id='" + t_id + "']");
        var show_class = obj.find("dt i").attr('class');
        if (show_class == 'right') {
            obj.find("dd").show();
            obj.find("dt i").attr('class', 'down');
        } else {
            obj.find("dd").hide();
            obj.find("dt i").attr('class', 'right');
        }
    }
</script>         
        


    


<div class="join_banner">
    <div class="bd">
        <ul>
            <?php if(!(empty($pic_list) || (($pic_list instanceof \think\Collection || $pic_list instanceof \think\Paginator ) && $pic_list->isEmpty()))): $pic_n = 0; if(is_array($pic_list) || $pic_list instanceof \think\Collection || $pic_list instanceof \think\Paginator): if( count($pic_list)==0 ) : echo "" ;else: foreach($pic_list as $key=>$val): if(!empty($val)): $pic_n++; ?>
            <li style="background-image: url(<?php echo ds_get_pic('admin/Storejion',$val); ?>)" ></li>
            <?php endif; ?>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <?php endif; ?>
        </ul>
    </div>
    <?php if($pic_n > '1'): ?>
    <div class="hd">
        <ul>
            <?php $__FOR_START_384454959__=0;$__FOR_END_384454959__=$pic_n;for($i=$__FOR_START_384454959__;$i < $__FOR_END_384454959__;$i+=1){ ?>
            <li><i></i></li>
            <?php } ?>
        </ul>
    </div>
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>
    <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.SuperSlide.2.1.1.js"></script>
    <script>
        jQuery(".join_banner").slide({mainCell: ".bd ul", autoPlay: true, interTime: 4000});
    </script>
    <?php endif; ?>
</div>

<div class="indextip">
    <div class="container"> <span class="title"><i class="iconfont">&#xe651;</i>
    <h3><?php echo htmlentities(lang('prompt')); ?></h3>
    </span>
        <span class="content"><?php echo htmlentities($show_txt); ?></span>
    </div>
</div>

<div class="index-notice-box">
    <ul class="index-notice clearfix">
        <li>
            <h1><?php echo htmlentities(lang('application_for_entry')); ?></h1>
            <p><?php echo htmlentities(lang('fill_in_entry_information')); ?></p>
            <a href="<?php if(session('is_login') == '1'): ?><?php echo url('Sellerjoinin/step0'); else: ?>javascript:login_dialog();<?php endif; ?>" class="index-notice-btn setUpShop"><?php echo htmlentities(lang('my_settled_in')); ?></a>
        </li>
        <li>
            <h1><?php echo htmlentities(lang('settled_in_progress')); ?></h1>
            <p><?php echo htmlentities(lang('understanding_store_opening_condition')); ?></p>
            <a href="<?php if(session('is_login') == '1'): if($joinin_detail['store_type'] == 0): ?><?php echo url('Sellerjoinin/index'); else: ?><?php echo url('Sellerjoininc2c/index'); ?><?php endif; else: ?>javascript:login_dialog();<?php endif; ?>" class="index-notice-btn merchantsSettled"><?php echo htmlentities(lang('check_your_progress')); ?></a>
        </li>
        <li class="index-notice-last"><h1><?php echo htmlentities(lang('information_announcement')); ?></h1>
            <ul class="index-list">
                <?php foreach($index_articles as $i_a): ?>
                <li>
                    <a  title="<?php echo htmlentities($i_a['article_title']); ?>" href="<?php if($i_a['article_url'] !=''): ?><?php echo htmlentities($i_a['article_url']); else: ?><?php echo url('Article/show',['article_id'=>$i_a['article_id']]); ?><?php endif; ?>">
                        <?php echo htmlentities($i_a['article_title']); ?>
                    </a>
                    <em><?php echo htmlentities(lang('important')); ?></em>
                </li>
                <?php endforeach; ?>
            </ul>
        </li>
    </ul>
</div>

<div class="con-floor-3 tenants-con-floor-3">
    <div class="con-topic"><?php echo htmlentities(lang('in_the_process')); ?></div>
    <div class="w1190">
        <div class="con-floor-3-single">
            <i class="iconfont">&#xe672;</i>
            <div>
                <h2><?php echo htmlentities(lang('submit_entry_information')); ?></h2>
                <em><?php echo htmlentities(lang('about')); ?>2<?php echo htmlentities(lang('hours')); ?></em>
                <ul>
                    <li><?php echo htmlentities(lang('fill_enterprise_information')); ?></li>
                    <li><?php echo htmlentities(lang('select_store_type')); ?></li>
                    <li><?php echo htmlentities(lang('fill_brand_information')); ?></li>
                    <li><?php echo htmlentities(lang('member_map_store_name')); ?></li>
                    <li><?php echo htmlentities(lang('confirm_the_contract')); ?></li>
                </ul>
            </div>
        </div>
        <i class="con-floor-3-arrow"></i>
        <div class="con-floor-3-single">
            <i class="iconfont">&#xe736;</i>
            <div>
                <h2><?php echo htmlentities(lang('merchants_waiting_review')); ?></h2>
                <em>3-6<?php echo htmlentities(lang('working_days')); ?></em>
                <ul>
                    <li><?php echo htmlentities(lang('qualification_audit')); ?></li>
                    <li><?php echo htmlentities(lang('brand_audit')); ?></li>
                </ul>
            </div>
        </div>
        <i class="con-floor-3-arrow"></i>
        <div class="con-floor-3-single">
            <i class="iconfont">&#xe65c;</i>
            <div>
                <h2><?php echo htmlentities(lang('pay_fee')); ?></h2>
                <em><?php echo htmlentities(lang('about')); ?>10<?php echo htmlentities(lang('minutes')); ?></em>
                <ul>
                    <li><?php echo htmlentities(lang('real_name_authentication')); ?></li>
                    <li><?php echo htmlentities(lang('sign_agency_agreement')); ?></li>
                    <li><?php echo htmlentities(lang('payment_fee')); ?></li>
                </ul>
            </div>
        </div>
        <i class="con-floor-3-arrow"></i>
        <div class="con-floor-3-single">
            <i class="iconfont">&#xe74f;</i>
            <div>
                <h2><?php echo htmlentities(lang('store_launch')); ?></h2>
                <em><?php echo htmlentities(lang('about')); ?>20<?php echo htmlentities(lang('minutes')); ?></em>
                <ul>
                    <li><?php echo htmlentities(lang('release_of_goods')); ?></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="main mt30">
    <h2 class="index-title"><?php echo htmlentities(lang('entry_guide')); ?></h2>
    <div class="joinin-info">
        <ul class="tabs-nav">
            <?php if(!(empty($help_list) || (($help_list instanceof \think\Collection || $help_list instanceof \think\Paginator ) && $help_list->isEmpty()))): $i = 0; if(is_array($help_list) || $help_list instanceof \think\Collection || $help_list instanceof \think\Paginator): if( count($help_list)==0 ) : echo "" ;else: foreach($help_list as $key=>$val): $i++; ?>
            <li class="<?php if($i==1): ?>tabs-selected<?php endif; ?>">
                <h3><?php echo htmlentities($val['help_title']); ?></h3>
            </li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <?php endif; ?>
        </ul>
        <?php if(!(empty($help_list) || (($help_list instanceof \think\Collection || $help_list instanceof \think\Paginator ) && $help_list->isEmpty()))): $i = 0; if(is_array($help_list) || $help_list instanceof \think\Collection || $help_list instanceof \think\Paginator): if( count($help_list)==0 ) : echo "" ;else: foreach($help_list as $key=>$val): $i++; ?>
        <div class="tabs-panel <?php if($i!=1): ?>tabs-hide<?php endif; ?>"><?php echo htmlspecialchars_decode($val['help_info']); ?></div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <?php endif; ?>
    </div>
</div>

<script>
$(document).ready(function(){
    $(".tabs-nav > li > h3").bind('mouseover', (function(e) {
    	if (e.target == this) {
    		var tabs = $(this).parent().parent().children("li");
    		var panels = $(this).parent().parent().parent().children(".tabs-panel");
    		var index = $.inArray(this, $(this).parent().parent().find("h3"));
    		if (panels.eq(index)[0]) {
    			tabs.removeClass("tabs-selected").eq(index).addClass("tabs-selected");
    			panels.addClass("tabs-hide").eq(index).removeClass("tabs-hide");
    		}
    	}
    }));
});
</script>



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
