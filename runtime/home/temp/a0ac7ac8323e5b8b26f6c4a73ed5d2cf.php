<?php /*a:5:{s:99:"D:\wwwroot\shops.domibuy.com\app\home\view\default\seller\sellergoodsadd\store_goods_add_step2.html";i:1616001443;s:71:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\seller_top.html";i:1612516962;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\seller_left.html";i:1614396361;s:73:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\seller_items.html";i:1612516962;s:72:"D:\wwwroot\shops.domibuy.com\app\home\view\default\base\mall_footer.html";i:1612516962;}*/ ?>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><?php if(isset($html_title) && $html_title): ?><?php echo htmlentities($html_title); else: ?><?php echo htmlentities(lang('store_callcenter')); ?><?php endif; ?></title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta name="keywords" content="<?php echo htmlentities((isset($seo_keywords) && ($seo_keywords !== '')?$seo_keywords:'')); ?>" />
        <meta name="description" content="<?php echo htmlentities((isset($seo_description) && ($seo_description !== '')?$seo_description:'')); ?>" />
        <link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/common.css">
        <link rel="stylesheet" href="<?php echo htmlentities(HOME_SITE_ROOT); ?>/css/seller.css">
        <link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery-ui.min.css">
        <script>
            var BASESITEROOT = "<?php echo htmlentities(BASE_SITE_ROOT); ?>";
            var HOMESITEROOT = "<?php echo htmlentities(HOME_SITE_ROOT); ?>";
            var BASESITEURL = "<?php echo htmlentities(BASE_SITE_URL); ?>";
            var HOMESITEURL = "<?php echo htmlentities(HOME_SITE_URL); ?>";
        </script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery-2.1.4.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery-ui.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery.ui.datepicker-zh-CN.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/common.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.validate.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/additional-methods.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/layer/layer.js"></script>
        <script src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/js/member.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
        <script>
            jQuery.browser={};(function(){jQuery.browser.msie=false; jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)./)){ jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();
        </script>
    </head>
    <body>
        <div id="append_parent"></div>
        <div id="ajaxwaitid"></div>
        
 
<div class="seller_main">
    <div class="seller_left">
    <div class="seller_left_1">
        <div class="logo">
            <a href="<?php echo url('Seller/index'); ?>">
                <img src="<?php if(config('ds_config.seller_center_logo') == ''): ?><?php echo htmlentities(BASE_SITE_ROOT); ?>/uploads/home/common/seller_center_logo.png<?php else: ?><?php echo htmlentities(BASE_SITE_ROOT); ?>/uploads/home/common/<?php echo htmlentities(config('ds_config.seller_center_logo')); ?><?php endif; ?>"/>
            </a>
        </div>
        <div class="sidebar">
            <a href="<?php echo url('Store/index',['store_id'=>session('store_id')]); ?>" ><i class="iconfont">&#xe6da;</i><?php echo htmlentities(lang('ds_mystroe')); ?></a>
            <!--<?php if(config('ds_config.node_site_use') == '1'): ?>-->
            <!--<a href="javascript:void(0);" id="chat_show_user"><i class="iconfont">&#xe71b;</i><?php echo htmlentities(lang('ds_chat')); ?></a>-->
            <!--<?php endif; ?>-->
            <?php if(is_array($seller_menu) || $seller_menu instanceof \think\Collection || $seller_menu instanceof \think\Paginator): if( count($seller_menu)==0 ) : echo "" ;else: foreach($seller_menu as $menu_key=>$menu): ?>
            <a href="<?php echo htmlentities($menu['url']); ?>" <?php if($menu_key == $curmenu): ?>class="active"<?php endif; ?>><i class="iconfont"><?php echo $menu['ico']; ?></i><?php echo htmlentities($menu['text']); ?></a>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <div class="mb">
            <a href="<?php echo url('Sellerlogin/logout'); ?>"><?php echo htmlentities(lang('exit')); ?></a>
        </div>
    </div>
    <div class="seller_left_2">
        <div class="mt">
            <?php if(is_array($seller_menu) || $seller_menu instanceof \think\Collection || $seller_menu instanceof \think\Paginator): if( count($seller_menu)==0 ) : echo "" ;else: foreach($seller_menu as $menu_key=>$menu): if($menu_key == $curmenu): ?><?php echo htmlentities($menu['text']); ?><?php endif; ?>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <div class="mc">
            <?php if(is_array($seller_menu) || $seller_menu instanceof \think\Collection || $seller_menu instanceof \think\Paginator): if( count($seller_menu)==0 ) : echo "" ;else: foreach($seller_menu as $menu_key=>$menu): if($menu_key == $curmenu): if(is_array($menu['submenu']) || $menu['submenu'] instanceof \think\Collection || $menu['submenu'] instanceof \think\Paginator): if( count($menu['submenu'])==0 ) : echo "" ;else: foreach($menu['submenu'] as $key=>$submenu): ?>
            <a href="<?php echo htmlentities($submenu['url']); ?>" <?php if($submenu['name'] == $cursubmenu): ?>class="active"<?php endif; ?>><?php echo htmlentities($submenu['text']); ?></a>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <?php endif; ?>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
</div>
    <div class="seller_right">
<style type="text/css">
#fixedNavBar { filter:progid:DXImageTransform.Microsoft.gradient(enabled='true',startColorstr='#CCFFFFFF', endColorstr='#CCFFFFFF');background:rgba(255,255,255,0.8); width: 90px; margin-left:600px; border-radius: 4px; position: fixed; z-index: 999; top: 172px; right: 0%;}
#fixedNavBar h3 { font-size: 12px; line-height: 24px; text-align: center; margin-top: 4px;}
#fixedNavBar ul { width: 80px; margin: 0 auto 5px auto;}
#fixedNavBar li { margin-top: 5px;}
#fixedNavBar li a { font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 20px; background-color: #F5F5F5; color: #999; text-align: center; display: block;  height: 20px; border-radius: 10px;}
#fixedNavBar li a:hover { color: #FFF; text-decoration: none; background-color: #27a9e3;}
</style>

<div id="fixedNavBar">
<h3><?php echo htmlentities(lang('page_navigation')); ?></h3>
  <ul>
    <li><a id="demo1Btn" href="#demo1" class="demoBtn"><?php echo htmlentities(lang('basic_information')); ?></a></li>
    <li><a id="demo2Btn" href="#demo2" class="demoBtn"><?php echo htmlentities(lang('detailed_description')); ?></a></li>
    <li><a id="demo3Btn" href="#demo3" class="demoBtn"><?php echo htmlentities(lang('special_goods')); ?></a></li>
    <li><a id="demo4Btn" href="#demo4" class="demoBtn"><?php echo htmlentities(lang('logistics_freight')); ?></a></li>
    <li><a id="demo5Btn" href="#demo5" class="demoBtn"><?php echo htmlentities(lang('invoice_information')); ?></a></li>
    <li><a id="demo6Btn" href="#demo6" class="demoBtn"><?php echo htmlentities(lang('store_goods_index_goods_other_info')); ?></a></li>
  </ul>
</div>
<div class="seller_items">
    <?php if(!(empty($seller_item) || (($seller_item instanceof \think\Collection || $seller_item instanceof \think\Paginator ) && $seller_item->isEmpty()))): ?>
<ul>
    <?php if(is_array($seller_item) || $seller_item instanceof \think\Collection || $seller_item instanceof \think\Paginator): if( count($seller_item)==0 ) : echo "" ;else: foreach($seller_item as $key=>$item): ?>
    <li <?php if($item['name'] == $curitem): ?>class="current"<?php endif; ?>><a href="<?php echo htmlentities($item['url']); ?>"><?php echo htmlentities($item['text']); ?></a></li>
    <?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<?php endif; ?>
</div>
<?php if(isset($edit_goods_sign)): else: ?>
<ul class="add-goods-step">
    <li><i class="icon iconfont">&#xe600;</i>
        <h6>STEP.1</h6>
        <h2><?php echo htmlentities(lang('select_category')); ?></h2>
        <i class="arrow iconfont">&#xe687;</i> </li>
    <li class="current"><i class="icon iconfont">&#xe731;</i>
        <h6>STEP.2</h6>
        <h2><?php echo htmlentities(lang('fill_item_details')); ?></h2>
        <i class="arrow iconfont">&#xe687;</i> </li>
    <li><i class="icon iconfont">&#xe6a2;</i>
        <h6>STEP.3</h6>
        <h2><?php echo htmlentities(lang('store_goods_index_upload_goods_pic')); ?></h2>
        <i class="arrow iconfont">&#xe687;</i> </li>
    <li><i class="icon iconfont">&#xe64d;</i>
        <h6>STEP.4</h6>
        <h2><?php echo htmlentities(lang('store_goods_index_flow_chart_step3')); ?></h2>
    </li>
</ul>
<?php endif; ?>
<div class="item-publish p20">
  <form method="post" id="goods_form" action="<?php if(isset($edit_goods_sign)): ?><?php echo url('Sellergoodsonline/edit_save_goods'); else: ?><?php echo url('Sellergoodsadd/save_goods'); ?><?php endif; ?>">
    <input type="hidden" name="commonid" value="<?php echo htmlentities((isset($goods['goods_commonid']) && ($goods['goods_commonid'] !== '')?$goods['goods_commonid']:'')); ?>" />
    <input type="hidden" name="type_id" value="<?php echo htmlentities((isset($goods_class['type_id']) && ($goods_class['type_id'] !== '')?$goods_class['type_id']:'')); ?>" />
    <div class="dssc-form-goods">
      <h3 id="demo1"><?php echo htmlentities(lang('store_goods_index_goods_base_info')); ?></h3>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_index_goods_class')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd id="gcategory"> <?php echo htmlentities((isset($goods_class['gctag_name']) && ($goods_class['gctag_name'] !== '')?$goods_class['gctag_name']:'')); ?>
            <a class="dssc-btn" href="<?php if(isset($edit_goods_sign)): ?><?php echo url('Sellergoodsonline/edit_class',['commonid'=>$goods['goods_commonid']]); else: ?><?php echo url('Sellergoodsadd/add_step_one'); ?><?php endif; ?>"><?php echo htmlentities(lang('ds_edit')); ?></a>
          <input type="hidden" id="cate_id" name="cate_id" value="<?php echo htmlentities((isset($goods_class['gc_id']) && ($goods_class['gc_id'] !== '')?$goods_class['gc_id']:'')); ?>" class="text" />
          <input type="hidden" name="cate_name" value="<?php echo htmlentities((isset($goods_class['gctag_name']) && ($goods_class['gctag_name'] !== '')?$goods_class['gctag_name']:'')); ?>" class="text"/>
        </dd>
      </dl>
      <dl>
        <dt><i class="required">*</i><?php echo htmlentities(lang('store_goods_index_goods_name')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <input name="g_name" type="text" class="text w400" value="<?php echo htmlentities((isset($goods['goods_name']) && ($goods['goods_name'] !== '')?$goods['goods_name']:'')); ?>" />
          <span></span>
          <p class="hint"><?php echo htmlentities(lang('store_goods_index_goods_name_help')); ?></p>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('selling_point_')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <textarea name="g_jingle" class="textarea h60 w400"><?php echo htmlentities((isset($goods['goods_advword']) && ($goods['goods_advword'] !== '')?$goods['goods_advword']:'')); ?></textarea>
          <span></span>
          <p class="hint"><?php echo htmlentities(lang('price_instructions1')); ?></p>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_ispifa')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <ul class="dssc-form-radio-list">
            <li>
              <input type="radio" name="is_pifa" value="1" id="is_pifa_1" <?php if (isset($goods['goods_ispifa']) && $goods['goods_ispifa'] == 1) {?>checked<?php }?>>
              <label for="is_pifa_1"><?php echo htmlentities(lang('ds_yes')); ?></label>
            </li>
            <li>
              <input type="radio" name="is_pifa" value="0" id="is_pifa_0" <?php if ($goods['goods_ispifa'] == 0) {?>checked<?php }?>>
              <label for="is_pifa_0"><?php echo htmlentities(lang('ds_no')); ?></label>
            </li>
          </ul>
          <p class="hint vital"><?php echo htmlentities(lang('store_goods_ispifa_tips')); ?></p>
        </dd>
      </dl>
      <dl class="goods_pifashow" <?php if ($goods['goods_ispifa'] == 0) {?>style="display:none;"<?php }?>>
        <dt ds_type="no_spec"><i class="required">*</i><?php echo htmlentities(lang('store_goods_pifaprice')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd ds_type="no_spec">
          <input name="g_startnum1" id="g_startnum1" value="<?php echo htmlentities((isset($goods_pifainfo['startnum1']) && ($goods_pifainfo['startnum1'] !== '')?$goods_pifainfo['startnum1']:'')); ?>" type="text"  class="text w60" />
          <em class="add-on">???</em> <span></span>
          <input name="g_endnum1" id="g_endnum1" value="<?php echo htmlentities((isset($goods_pifainfo['endnum1']) && ($goods_pifainfo['endnum1'] !== '')?$goods_pifainfo['endnum1']:'')); ?>" type="text"  class="text w60" />
          &nbsp;&nbsp;&nbsp;
          <input name="g_pifaprice1" id="g_pifaprice1" value="<?php echo htmlentities((isset($goods_pifainfo['pifaprice1']) && ($goods_pifainfo['pifaprice1'] !== '')?$goods_pifainfo['pifaprice1']:'')); ?>" type="text"  class="text w60" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em> <span></span>
          <p class="hint"><?php echo htmlentities(lang('store_goods_pifaprice_tips')); ?></p>
        </dd>
      </dl>
      <dl class="goods_pifashow" <?php if ($goods['goods_ispifa'] == 0) {?>style="display:none;"<?php }?>>
        <dt ds_type="no_spec"></dt>
        <dd ds_type="no_spec">
          <input name="g_startnum2" id="g_startnum2" value="<?php echo htmlentities((isset($goods_pifainfo['startnum2']) && ($goods_pifainfo['startnum2'] !== '')?$goods_pifainfo['startnum2']:'')); ?>" type="text"  class="text w60" />
          <em class="add-on">???</em> <span></span>
          <input name="g_endnum2" id="g_endnum2" value="<?php echo htmlentities((isset($goods_pifainfo['endnum2']) && ($goods_pifainfo['endnum2'] !== '')?$goods_pifainfo['endnum2']:'')); ?>" type="text"  class="text w60" />
          &nbsp;&nbsp;&nbsp;
          <input name="g_pifaprice2" id="g_pifaprice2" value="<?php echo htmlentities((isset($goods_pifainfo['pifaprice2']) && ($goods_pifainfo['pifaprice2'] !== '')?$goods_pifainfo['pifaprice2']:'')); ?>" type="text"  class="text w60" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em> <span></span>
        </dd>
      </dl>
      <dl class="goods_pifashow" <?php if ($goods['goods_ispifa'] == 0) {?>style="display:none;"<?php }?>>
        <dt ds_type="no_spec"></dt>
        <dd ds_type="no_spec">
          <input name="g_startnum3" id="g_startnum3" value="<?php echo htmlentities((isset($goods_pifainfo['startnum3']) && ($goods_pifainfo['startnum3'] !== '')?$goods_pifainfo['startnum3']:'')); ?>" type="text"  class="text w60" />
          <em class="add-on">???</em> <span></span>
          <input name="g_endnum3" id="g_endnum3" value="<?php echo htmlentities((isset($goods_pifainfo['endnum3']) && ($goods_pifainfo['endnum3'] !== '')?$goods_pifainfo['endnum3']:'')); ?>" type="text"  class="text w60" />
          &nbsp;&nbsp;&nbsp;
          <input name="g_pifaprice3" id="g_pifaprice3" value="<?php echo htmlentities((isset($goods_pifainfo['pifaprice3']) && ($goods_pifainfo['pifaprice3'] !== '')?$goods_pifainfo['pifaprice3']:'')); ?>" type="text"  class="text w60" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em> <span></span>
        </dd>
      </dl>
      <dl class="goods_pifahide" <?php if ($goods['goods_ispifa'] == 1) {?>style="display:none;"<?php }?>>
        <dt ds_type="no_spec"><i class="required">*</i><?php echo htmlentities(lang('store_goods_index_store_price')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd ds_type="no_spec">
          <input name="g_price" id="g_price" value="<?php echo htmlentities((isset($goods['goods_price']) && ($goods['goods_price'] !== '')?$goods['goods_price']:'')); ?>" type="text"  class="text w60" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em> <span></span>
          <p class="hint"><?php echo htmlentities(lang('store_goods_index_store_price_help')); ?>???<?php echo htmlentities(lang('price_instructions2')); ?><br>
            <?php echo htmlentities(lang('price_instructions3')); ?></p>
        </dd>
      </dl>
      <dl>
        <dt ds_type="no_spec"><?php echo htmlentities(lang('store_goods_index_weight')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd ds_type="no_spec">
          <input name="goods_weight" value="<?php echo htmlentities((isset($goods['goods_weight']) && ($goods['goods_weight'] !== '')?$goods['goods_weight']:'')); ?>" type="text"  class="text w60" /> <span></span>
          <p class="hint">kg</p>
        </dd>
      </dl>
      <dl class="goods_pifahide" <?php if ($goods['goods_ispifa'] == 1) {?>style="display:none;"<?php }?>>
        <dt><?php echo htmlentities(lang('market_price')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
            <input name="g_marketprice" id="g_marketprice" value="<?php if($goods['goods_marketprice']>0): ?><?php echo htmlentities($goods['goods_marketprice']); ?><?php endif; ?>" type="text" class="text w60" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em> <span></span>
          <p class="hint"><?php echo htmlentities(lang('store_goods_index_store_price_help')); ?><?php echo htmlentities(lang('price_instructions4')); ?></p>
        </dd>
      </dl>
      <dl class="goods_pifahide" <?php if ($goods['goods_ispifa'] == 1) {?>style="display:none;"<?php }?>>
        <dt><?php echo htmlentities(lang('cost_price')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <input name="g_costprice" id="g_costprice" value="<?php echo htmlentities((isset($goods['goods_costprice']) && ($goods['goods_costprice'] !== '')?$goods['goods_costprice']:'')); ?>" type="text" class="text w60" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em> <span></span>
          <p class="hint"><?php echo htmlentities(lang('price_instructions5')); ?></p>
        </dd>
      </dl>
      <dl class="goods_pifahide" <?php if ($goods['goods_ispifa'] == 1) {?>style="display:none;"<?php }?>>
        <dt><?php echo htmlentities(lang('discount')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <input name="g_discount" id="g_discount" value="<?php echo htmlentities((isset($goods['goods_discount']) && ($goods['goods_discount'] !== '')?$goods['goods_discount']:'')); ?>" type="text" class="text w60" readonly="readonly" style="background:#E7E7E7 none;" /><em class="add-on">%</em>
          <p class="hint"><?php echo htmlentities(lang('specifications_instructions1')); ?></p>
        </dd>
      </dl>
      <?php if(is_array($spec_list) && !empty($spec_list)){$i = '0';foreach ($spec_list as $k=>$val){?>
      <dl ds_type="spec_group_dl_<?php echo htmlentities($i); ?>" dstype="spec_group_dl" class="spec-bg" <?php if($k == '1'): ?>spec_img="t"<?php endif; ?>>
        <dt>
          <input name="sp_name[<?php echo htmlentities($k); ?>]" type="text" class="text w60 tip2 tr" title="<?php echo htmlentities(lang('specifications_instructions2')); ?>" value="<?php if (isset($goods['spec_name'][$k])) { echo $goods['spec_name'][$k];} else {echo $val['sp_name'];}?>" maxlength="10" dstype="spec_name" data-param="{id:<?php echo $k;?>,name:'<?php echo $val['sp_name'];?>'}"/>
          <?php echo htmlentities(lang('ds_colon')); ?>
          </dt>
        <dd <?php if($k == '1'): ?>dstype="sp_group_val"<?php endif; ?>>
          <ul class="spec">
            <?php if(is_array($val['value'])){if(is_array($val['value']) || $val['value'] instanceof \think\Collection || $val['value'] instanceof \think\Paginator): if( count($val['value'])==0 ) : echo "" ;else: foreach($val['value'] as $key=>$v): ?>
            <li><span dstype="input_checkbox">
              <input type="checkbox" value="<?php echo htmlentities($v['spvalue_name']); ?>" ds_type="<?php echo htmlentities($v['spvalue_id']); ?>" <?php if($k == '1'): ?>class="sp_val"<?php endif; ?> name="sp_val[<?php echo htmlentities($k); ?>][<?php echo htmlentities($v['spvalue_id']); ?>]">
              </span><span dstype="pv_name"><?php echo htmlentities($v['spvalue_name']); ?></span>
            </li>
            <?php endforeach; endif; else: echo "" ;endif; }?>
            <li data-param="{gc_id:<?php echo htmlentities($goods_class['gc_id']); ?>,sp_id:<?php echo htmlentities($k); ?>,url:'<?php echo url('Sellergoodsadd/ajax_add_spec'); ?>'}">
              <div dstype="specAdd1"><a href="javascript:void(0);" class="dssc-btn" dstype="specAdd"><i class="iconfont">&#xe6db;</i><?php echo htmlentities(lang('add_specification_value')); ?></a></div>
              <div dstype="specAdd2" style="display:none;">
                <input class="text w60" type="text" placeholder="<?php echo htmlentities(lang('specification_value_name')); ?>" maxlength="20">
                <a href="javascript:void(0);" dstype="specAddSubmit" class="dssc-btn dssc-btn-acidblue ml5 mr5"><?php echo htmlentities(lang('ds_ok')); ?></a><a href="javascript:void(0);" dstype="specAddCancel" class="dssc-btn dssc-btn-orange"><?php echo htmlentities(lang('ds_cancel')); ?></a></div>
            </li>
          </ul>
          <?php if(isset($edit_goods_sign) && $k == '1'){?>
          <p class="hint"><?php echo htmlentities(lang('specifications_instructions3')); ?></p>
          <?php }?>
        </dd>
      </dl>
      <?php $i++;}}?>
      <dl ds_type="spec_dl" class="spec-bg" style="display:none; overflow: visible;">
        <dt><?php echo htmlentities(lang('srore_goods_index_goods_stock_set')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd class="spec-dd">
          <table border="0" cellpadding="0" cellspacing="0" class="spec_table">
            <thead>
              <?php if(!(empty($spec_list) || (($spec_list instanceof \think\Collection || $spec_list instanceof \think\Paginator ) && $spec_list->isEmpty()))): $spec_i=0; if(is_array($spec_list) || $spec_list instanceof \think\Collection || $spec_list instanceof \think\Paginator): if( count($spec_list)==0 ) : echo "" ;else: foreach($spec_list as $k=>$val): ?>
            <th dstype="spec_name_<?php echo htmlentities($k); ?>" data-type="spec_name_<?php echo $spec_i; ?>" style="display:none"><?php if (isset($goods['spec_name'][$k])) { echo $goods['spec_name'][$k];} else {echo $val['sp_name'];}?></th>
              <?php $spec_i++; ?>
			  <?php endforeach; endif; else: echo "" ;endif; ?>
              <?php endif; ?>
              <th class="w90"><?php echo htmlentities(lang('market_price')); ?>
                <div class="batch"><i class="iconfont" title="<?php echo htmlentities(lang('batch_operation')); ?>">&#xe731;</i>
                  <div class="batch-input" style="display:none;">
                    <h6><?php echo htmlentities(lang('batch_setting_price')); ?>???</h6>
                    <a href="javascript:void(0)" class="close">X</a>
                    <input name="" type="text" class="text price" />
                    <a href="javascript:void(0)" class="dssc-btn-mini" data-type="marketprice"><?php echo htmlentities(lang('set')); ?></a><span class="arrow"></span></div>
                </div></th>
              <th class="w90"><span class="red">*</span><?php echo htmlentities(lang('store_goods_index_price')); ?>
                <div class="batch"><i class="iconfont" title="<?php echo htmlentities(lang('batch_operation')); ?>">&#xe731;</i>
                  <div class="batch-input" style="display:none;">
                    <h6><?php echo htmlentities(lang('batch_setting_price')); ?>???</h6>
                    <a href="javascript:void(0)" class="close">X</a>
                    <input name="" type="text" class="text price" />
                    <a href="javascript:void(0)" class="dssc-btn-mini" data-type="price"><?php echo htmlentities(lang('set')); ?></a><span class="arrow"></span></div>
                </div></th>
              <th class="w60"><?php echo htmlentities(lang('store_goods_index_weight')); ?>
                <div class="batch"><i class="iconfont" title="<?php echo htmlentities(lang('batch_operation')); ?>">&#xe731;</i>
                  <div class="batch-input" style="display:none;">
                    <h6><?php echo htmlentities(lang('batch_setting_weight')); ?>???</h6>
                    <a href="javascript:void(0)" class="close">X</a>
                    <input name="" type="text" class="text stock" />
                    <a href="javascript:void(0)" class="dssc-btn-mini" data-type="goods_weight"><?php echo htmlentities(lang('set')); ?></a><span class="arrow"></span></div>
                </div></th>  
              <th class="w60"><span class="red">*</span><?php echo htmlentities(lang('store_goods_index_stock')); ?>
                <div class="batch"><i class="iconfont" title="<?php echo htmlentities(lang('batch_operation')); ?>">&#xe731;</i>
                  <div class="batch-input" style="display:none;">
                    <h6><?php echo htmlentities(lang('batch_setting_inventory')); ?>???</h6>
                    <a href="javascript:void(0)" class="close">X</a>
                    <input name="" type="text" class="text stock" />
                    <a href="javascript:void(0)" class="dssc-btn-mini" data-type="stock"><?php echo htmlentities(lang('set')); ?></a><span class="arrow"></span></div>
                </div></th>
              <th class="w70"><?php echo htmlentities(lang('warning_value')); ?>
                <div class="batch"><i class="iconfont" title="<?php echo htmlentities(lang('batch_operation')); ?>">&#xe731;</i>
                  <div class="batch-input" style="display:none;">
                    <h6><?php echo htmlentities(lang('set_warning_value_batches')); ?>???</h6>
                    <a href="javascript:void(0)" class="close">X</a>
                    <input name="" type="text" class="text stock" />
                    <a href="javascript:void(0)" class="dssc-btn-mini" data-type="alarm"><?php echo htmlentities(lang('set')); ?></a><span class="arrow"></span></div>
                </div></th>
              <th class="w100"><?php echo htmlentities(lang('store_goods_index_goods_no')); ?></th>
                </thead>
            <tbody ds_type="spec_table">
            </tbody>
          </table>
          <p class="hint"><?php echo htmlentities(lang('click')); ?><i class="iconfont">&#xe731;</i><?php echo htmlentities(lang('modify_value_column_batches')); ?>???</p>
        </dd>
      </dl>
      <dl>
        <dt ds_type="no_spec"><i class="required">*</i><?php echo htmlentities(lang('store_goods_index_goods_stock')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd ds_type="no_spec">
          <input name="g_storage" value="<?php echo htmlentities((isset($goods['g_storage']) && ($goods['g_storage'] !== '')?$goods['g_storage']:'')); ?>" type="text" class="text w60" />
          <span></span>
          <p class="hint"><?php echo lang('store_goods_index_goods_stock_help'); ?></p>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('stock_warning_value')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <input name="g_alarm" value="<?php echo htmlentities((isset($goods['goods_storage_alarm']) && ($goods['goods_storage_alarm'] !== '')?$goods['goods_storage_alarm']:'')); ?>" type="text" class="text w60" />
          <span></span>
          <p class="hint"><?php echo htmlentities(lang('minimum_stock_warning_value')); ?><br>
           <?php echo htmlentities(lang('fill_warning_number_value')); ?></p>
        </dd>
      </dl>
      <dl>
        <dt ds_type="no_spec"><?php echo htmlentities(lang('store_goods_index_goods_no')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd ds_type="no_spec">
          <p>
            <input name="g_serial" value="<?php echo htmlentities((isset($goods['goods_serial']) && ($goods['goods_serial'] !== '')?$goods['goods_serial']:'')); ?>" type="text"  class="text"  />
          </p>
          <p class="hint"><?php echo lang('store_goods_index_goods_no_help'); ?></p>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_album_goods_pic')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <div class="dssc-goods-default-pic">
            <div class="goodspic-uplaod">
              <div class="upload-thumb"> <img dstype="goods_image" src="<?php echo goods_thumb($goods, 240); ?>"/> </div>
              <input type="hidden" name="image_path" id="image_path" dstype="goods_image" value="<?php echo htmlentities((isset($goods['goods_image']) && ($goods['goods_image'] !== '')?$goods['goods_image']:'')); ?>" />
              <span></span>
              <p class="hint"><?php echo htmlentities(lang('store_goods_step2_description_one')); printf(lang('store_goods_step2_description_two'),intval(config('ds_config.image_max_filesize'))/1024);?></p>
              <div class="handle">
                <div class="dssc-upload-btn"> <a href="javascript:void(0);"><span>
                  <input type="file" hidefocus="true" size="1" class="input-file" name="goods_image" id="goods_image">
                  </span>
                  <p><i class="iconfont">&#xe733;</i><?php echo htmlentities(lang('store_goods_brand_pic_upload')); ?></p>
                  </a> </div>
                <a class="dssc-btn" dstype="show_image" href="<?php echo url('Selleralbum/pic_list',['item'=>'goods']); ?>"><i class="iconfont">&#xe72a;</i><?php echo htmlentities(lang('image_space_selection')); ?></a> <a href="javascript:void(0);" dstype="del_goods_demo" class="dssc-btn" style="display: none;"><i class="iconfont">&#xe67a;</i><?php echo htmlentities(lang('close_album')); ?></a></div>
            </div>
          </div>
          <div id="demo"></div>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_video')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <div class="dssc-goods-default-pic">
            <div class="goodspic-uplaod">
              <div class="upload-thumb"> 
                  <video controls="" height="240" width="240" dstype="goodsvideo_name" src="<?php if(isset($goods['goodsvideo_name'])): ?><?php echo goods_video($goods['goodsvideo_name']); ?><?php endif; ?>"/>
              </div>
              <input type="hidden" name="goodsvideo_name" id="goodsvideo_name" dstype="goodsvideo_name" value="<?php echo htmlentities((isset($goods['goodsvideo_name']) && ($goods['goodsvideo_name'] !== '')?$goods['goodsvideo_name']:'')); ?>" />
              <span></span>
              <p class="hint"><?php echo htmlentities(lang('store_goods_video_desc')); ?></p>
              <div class="handle">
                <div class="dssc-upload-btn"> <a href="javascript:void(0);"><span>
                  <input type="file" hidefocus="true" size="1" class="input-file" name="goodsvideo" id="goodsvideo">
                  </span>
                  <p><i class="iconfont">&#xe733;</i><?php echo htmlentities(lang('store_goods_video_upload')); ?></p>
                  </a> </div>
                <a class="dssc-btn" dstype="show_video" href="<?php echo url('Sellervideo/video_list'); ?>"><i class="iconfont">&#xe72a;</i><?php echo htmlentities(lang('store_goods_video_select')); ?></a> <a href="javascript:void(0);" dstype="del_goods_video_list" class="dssc-btn" style="display: none;"><i class="iconfont">&#xe67a;</i><?php echo htmlentities(lang('store_goods_video_close')); ?></a></div>
            </div>
          </div>
          <div id="goods_video_list"></div>
        </dd>
      </dl>
      <h3 id="demo2"><?php echo htmlentities(lang('store_goods_index_goods_detail_info')); ?></h3>
      <?php if(!(empty($attr_list) || (($attr_list instanceof \think\Collection || $attr_list instanceof \think\Paginator ) && $attr_list->isEmpty()))): ?>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_index_goods_attr')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <?php if(is_array($attr_list) || $attr_list instanceof \think\Collection || $attr_list instanceof \think\Paginator): if( count($attr_list)==0 ) : echo "" ;else: foreach($attr_list as $k=>$val): ?>
          <span class="mr30">
          <label class="mr5"><?php echo htmlentities($val['attr_name']); ?></label>
          <input type="hidden" name="attr[<?php echo htmlentities($k); ?>][name]" value="<?php echo htmlentities($val['attr_name']); ?>" />
          <?php if(!(empty($val) || (($val instanceof \think\Collection || $val instanceof \think\Paginator ) && $val->isEmpty()))): ?>
          <select name="" attr="attr[<?php echo htmlentities($k); ?>][__NC__]" ds_type="attr_select">
            <option value='' ds_type='0'><?php echo htmlentities(lang('ds_please_choose')); ?></option>
            <?php if(is_array($val['value']) || $val['value'] instanceof \think\Collection || $val['value'] instanceof \think\Paginator): if( count($val['value'])==0 ) : echo "" ;else: foreach($val['value'] as $key=>$v): ?>
            <option value="<?php echo htmlentities($v['attrvalue_name']); ?>" <?php if(isset($attr_checked) && in_array($v['attrvalue_id'], $attr_checked)){?>selected="selected"<?php }?> ds_type="<?php echo htmlentities($v['attrvalue_id']); ?>"><?php echo htmlentities($v['attrvalue_name']); ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
          <?php endif; ?>
          </span>
          <?php endforeach; endif; else: echo "" ;endif; ?>
        </dd>
      </dl>
      <?php endif; ?>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_index_goods_desc')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd id="dsProductDetails">
          <div class="tabs">
            <ul class="ui-tabs-nav">
              <li class="ui-tabs-selected"><a href="#panel-1"><i class="iconfont">&#xe60c;</i> <?php echo htmlentities(lang('computer_side')); ?></a></li>
              <li class="selected"><a href="#panel-2"><i class="iconfont">&#xe60e;</i><?php echo htmlentities(lang('mobile_side')); ?></a></li>
            </ul>
            <div id="panel-1" class="ui-tabs-panel">
                <?php echo build_editor(['name'=>'goods_body','content'=>htmlspecialchars_decode($goods['goods_body'])]); ?>
                <textarea name="goods_body" id="goods_body" style="height:400px"></textarea>
              <div class="hr8">
                
                <a class="dssc-btn mt5" dstype="show_desc" href="<?php echo url('Selleralbum/pic_list',['item'=>'des']); ?>"><i class="iconfont">&#xe72a;</i><?php echo htmlentities(lang('store_goods_album_insert_users_photo')); ?></a> <a href="javascript:void(0);" dstype="del_desc" class="dssc-btn mt5" style="display: none;"><i class=" iconfont">&#xe67a;</i><?php echo htmlentities(lang('close_album')); ?></a>
              </div>
              <p id="des_demo"></p>
            </div>
            <div id="panel-2" class="ui-tabs-panel ui-tabs-hide">
              <div class="dssc-mobile-editor">
                <div class="pannel">
                  <div class="size-tip"><span dstype="img_count_tip"><?php echo htmlentities(lang('picture_number_than')); ?><em>20</em><?php echo htmlentities(lang('ds_zhang')); ?></span><i>|</i><span dstype="txt_count_tip"><?php echo htmlentities(lang('words_must_not_exceed')); ?><em>5000</em><?php echo htmlentities(lang('sellergoodsadd_words')); ?></span></div>
                  <div class="control-panel" dstype="mobile_pannel">
                    <?php if(!(empty($goods['mb_body']) || (($goods['mb_body'] instanceof \think\Collection || $goods['mb_body'] instanceof \think\Paginator ) && $goods['mb_body']->isEmpty()))): if(is_array($goods['mb_body']) || $goods['mb_body'] instanceof \think\Collection || $goods['mb_body'] instanceof \think\Paginator): if( count($goods['mb_body'])==0 ) : echo "" ;else: foreach($goods['mb_body'] as $key=>$val): if($val['type'] == 'text'): ?>
                    <div class="module m-text">
                      <div class="tools"><a dstype="mp_up" href="javascript:void(0);"><?php echo htmlentities(lang('sellergoodsadd_up')); ?></a><a dstype="mp_down" href="javascript:void(0);"><?php echo htmlentities(lang('sellergoodsadd_down')); ?></a><a dstype="mp_edit" href="javascript:void(0);"><?php echo htmlentities(lang('ds_edit')); ?></a><a dstype="mp_del" href="javascript:void(0);"><?php echo htmlentities(lang('ds_del')); ?></a></div>
                      <div class="content">
                        <div class="text-div"><?php echo htmlentities($val['value']); ?></div>
                      </div>
                      <div class="cover"></div>
                    </div>
                    <?php endif; if($val['type'] == 'image'): ?>
                    <div class="module m-image">
                      <div class="tools"><a dstype="mp_up" href="javascript:void(0);"><?php echo htmlentities(lang('sellergoodsadd_up')); ?></a><a dstype="mp_down" href="javascript:void(0);"><?php echo htmlentities(lang('sellergoodsadd_down')); ?></a><a dstype="mp_rpl" href="javascript:void(0);"><?php echo htmlentities(lang('sellergoodsadd_replace')); ?></a><a dstype="mp_del" href="javascript:void(0);"><?php echo htmlentities(lang('ds_del')); ?></a></div>
                      <div class="content">
                        <div class="image-div"><img src="<?php echo htmlentities($val['value']); ?>"></div>
                      </div>
                      <div class="cover"></div>
                    </div>
                    <?php endif; ?>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    <?php endif; ?>
                  </div>
                  <div class="add-btn">
                    <ul class="btn-wrap">
                      <li><a href="javascript:void(0);" dstype="mb_add_img"><i class="iconfont">&#xe72a;</i>
                        <p><?php echo htmlentities(lang('sellergoodsadd_picture')); ?></p>
                        </a></li>
                      <li><a href="javascript:void(0);" dstype="mb_add_txt"><i class="iconfont">&#xe8ed;</i>
                        <p><?php echo htmlentities(lang('sellergoodsadd_text')); ?></p>
                        </a></li>
                    </ul>
                  </div>
                </div>
                <div class="explain">
                  <dl>
                    <dt><?php echo htmlentities(lang('request_information1')); ?></dt>
                    <dd><?php echo htmlentities(lang('request_information2')); ?></dd>
                    <dd><?php echo htmlentities(lang('request_information3')); ?></dd>
                  </dl><dl>
                    <dt><?php echo htmlentities(lang('request_information4')); ?></dt>
                    <dd><?php echo htmlentities(lang('request_information5')); ?></dd>
                    <dd><?php echo htmlentities(lang('request_information6')); ?></dd>
                    <dd><?php echo htmlentities(lang('request_information7')); ?></dd>
                  </dl><dl>
                    <dt><?php echo htmlentities(lang('request_information8')); ?></dt>
                    <dd><?php echo htmlentities(lang('request_information9')); ?></dd>
                    <dd><?php echo htmlentities(lang('request_information10')); ?></dd>
                    <dd><?php echo htmlentities(lang('request_information11')); ?></dd>
                    <dd><?php echo htmlentities(lang('request_information12')); ?></dd>
                  </dl>
                </div>
              </div>
              <div class="dssc-mobile-edit-area" dstype="mobile_editor_area">
                <div dstype="mea_img" class="dssc-mea-img" style="display: none;"></div>
                <div class="dssc-mea-text" dstype="mea_txt" style="display: none;">
                  <p id="meat_content_count" class="text-tip"></p>
                  <textarea class="textarea valid" dstype="meat_content"></textarea>
                  <div class="button"><a class="dssc-btn dssc-btn-blue" dstype="meat_submit" href="javascript:void(0);"><?php echo htmlentities(lang('ds_common_button_confirm')); ?></a><a class="dssc-btn ml10" dstype="meat_cancel" href="javascript:void(0);"><?php echo htmlentities(lang('ds_cancel')); ?></a></div>
                  <a class="text-close" dstype="meat_cancel" href="javascript:void(0);">X</a>
                </div>
              </div>
              <input name="m_body" autocomplete="off" type="hidden" value='<?php echo htmlentities((isset($goods['mobile_body']) && ($goods['mobile_body'] !== '')?$goods['mobile_body']:'')); ?>'>
            </div>
              <div class="dssc-upload-btn"> <a href="javascript:void(0);"><span>
                  <input type="file" hidefocus="true" size="1" class="input-file" name="add_album" id="add_album" multiple="multiple">
                  </span>
                  <p><i class="iconfont" data_type="0" dstype="add_album_i">&#xe733;</i><?php echo htmlentities(lang('store_goods_brand_pic_upload')); ?></p>
                  </a>
                </div>
          </div>
        </dd>
      </dl>
      <dl style="overflow: visible;">
        <dt><?php echo htmlentities(lang('store_goods_index_goods_brand')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <div class="dssc-brand-select">
            <div class="selection">
              <input name="b_name" id="b_name" value="<?php echo htmlentities((isset($goods['brand_name']) && ($goods['brand_name'] !== '')?$goods['brand_name']:'')); ?>" type="text" class="text w180" readonly="readonly" />
              <input type="hidden" name="b_id" id="b_id" value="<?php echo htmlentities((isset($goods['brand_id']) && ($goods['brand_id'] !== '')?$goods['brand_id']:'')); ?>" />
              <em class="add-on" dstype="add-on"><i class="iconfont">&#xe73a;</i></em></div>
            <div class="dssc-brand-select-container">
              <div class="brand-index" data-tid="<?php echo htmlentities($goods_class['type_id']); ?>" data-url="<?php echo url('Sellergoodsadd/ajax_get_brand'); ?>">
                <div class="letter" dstype="letter">
                  <ul>
                    <li><a href="javascript:void(0);" data-letter="all"><?php echo htmlentities(lang('ds_all')); ?></a></li>
                    <li><a href="javascript:void(0);" data-letter="A">A</a></li>
                    <li><a href="javascript:void(0);" data-letter="B">B</a></li>
                    <li><a href="javascript:void(0);" data-letter="C">C</a></li>
                    <li><a href="javascript:void(0);" data-letter="D">D</a></li>
                    <li><a href="javascript:void(0);" data-letter="E">E</a></li>
                    <li><a href="javascript:void(0);" data-letter="F">F</a></li>
                    <li><a href="javascript:void(0);" data-letter="G">G</a></li>
                    <li><a href="javascript:void(0);" data-letter="H">H</a></li>
                    <li><a href="javascript:void(0);" data-letter="I">I</a></li>
                    <li><a href="javascript:void(0);" data-letter="J">J</a></li>
                    <li><a href="javascript:void(0);" data-letter="K">K</a></li>
                    <li><a href="javascript:void(0);" data-letter="L">L</a></li>
                    <li><a href="javascript:void(0);" data-letter="M">M</a></li>
                    <li><a href="javascript:void(0);" data-letter="N">N</a></li>
                    <li><a href="javascript:void(0);" data-letter="O">O</a></li>
                    <li><a href="javascript:void(0);" data-letter="P">P</a></li>
                    <li><a href="javascript:void(0);" data-letter="Q">Q</a></li>
                    <li><a href="javascript:void(0);" data-letter="R">R</a></li>
                    <li><a href="javascript:void(0);" data-letter="S">S</a></li>
                    <li><a href="javascript:void(0);" data-letter="T">T</a></li>
                    <li><a href="javascript:void(0);" data-letter="U">U</a></li>
                    <li><a href="javascript:void(0);" data-letter="V">V</a></li>
                    <li><a href="javascript:void(0);" data-letter="W">W</a></li>
                    <li><a href="javascript:void(0);" data-letter="X">X</a></li>
                    <li><a href="javascript:void(0);" data-letter="Y">Y</a></li>
                    <li><a href="javascript:void(0);" data-letter="Z">Z</a></li>
                    <li><a href="javascript:void(0);" data-letter="0-9"><?php echo htmlentities(lang('ds_other')); ?></a></li>
                    <li><a href="javascript:void(0);" data-empty="0"><?php echo htmlentities(lang('sellergoodsadd_empty')); ?></a></li>
                  </ul>
                </div>
                <div class="search" dstype="search">
                  <input name="search_brand_keyword" id="search_brand_keyword" type="text" class="text" placeholder="<?php echo htmlentities(lang('brand_name_keyword_search')); ?>"/><a href="javascript:void(0);" class="dssc-btn-mini" style="vertical-align: top;">Go</a></div>
              </div>
              <div class="brand-list" dstype="brandList">
                <ul dstype="brand_list">
                  <?php if(!(empty($brand_list) || (($brand_list instanceof \think\Collection || $brand_list instanceof \think\Paginator ) && $brand_list->isEmpty()))): if(is_array($brand_list) || $brand_list instanceof \think\Collection || $brand_list instanceof \think\Paginator): if( count($brand_list)==0 ) : echo "" ;else: foreach($brand_list as $key=>$val): ?>
                  <li data-id='<?php echo htmlentities($val['brand_id']); ?>'data-name='<?php echo htmlentities($val['brand_name']); ?>'><em><?php echo htmlentities($val['brand_initial']); ?></em><?php echo htmlentities($val['brand_name']); ?></li>
                  <?php endforeach; endif; else: echo "" ;endif; ?>
                  <?php endif; ?>
                </ul>
              </div>
              <div class="no-result" dstype="noBrandList" style="display: none;"><?php echo htmlentities(lang('does_not_match')); ?>"<strong><?php echo htmlentities(lang('search_keywords')); ?></strong>"<?php echo htmlentities(lang('conditional_brand')); ?></div>
            </div>
          </div>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('associated_layout')); ?>???</dt>
        <dd> <span class="mr50">
          <label><?php echo htmlentities(lang('top_layout')); ?></label>
          <select name="plate_top">
            <option><?php echo htmlentities(lang('ds_please_choose')); ?></option>
            <?php if (!empty($plate_list[1])) {foreach ($plate_list[1] as $val) {?>
            <option value="<?php echo htmlentities($val['storeplate_id']); ?>" <?php if ($goods['plateid_top'] == $val['storeplate_id']) {?>selected="selected"<?php }?>><?php echo htmlentities($val['storeplate_name']); ?></option>
            <?php }}?>
          </select>
          </span> <span class="mr50">
          <label><?php echo htmlentities(lang('bottom_layout')); ?></label>
          <select name="plate_bottom">
            <option><?php echo htmlentities(lang('ds_please_choose')); ?></option>
            <?php if (!empty($plate_list[0])) {foreach ($plate_list[0] as $val) {?>
            <option value="<?php echo htmlentities($val['storeplate_id']); ?>" <?php if ($goods['plateid_bottom'] == $val['storeplate_id']) {?>selected="selected"<?php }?>><?php echo htmlentities($val['storeplate_name']); ?></option>
            <?php }}?>
          </select>
          </span> </dd>
      </dl>
      <!--<h3 id="demo3"><?php echo htmlentities(lang('special_goods')); ?></h3>-->
      <!-- ??????????????????????????????????????? S -->
      <!--<?php if($goods_class['gc_virtual'] == 1): ?>-->
      <!--<dl class="special-01">-->
      <!--  <dt><?php echo htmlentities(lang('virtual_goods')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <ul class="dssc-form-radio-list">-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_gv" value="1" id="is_gv_1" <?php if (isset($goods['is_virtual']) && $goods['is_virtual'] == 1) {?>checked<?php }?>>-->
      <!--        <label for="is_gv_1"><?php echo htmlentities(lang('ds_yes')); ?></label>-->
      <!--      </li>-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_gv" value="0" id="is_gv_0" <?php if ($goods['is_virtual'] == 0) {?>checked<?php }?>>-->
      <!--        <label for="is_gv_0"><?php echo htmlentities(lang('ds_no')); ?></label>-->
      <!--      </li>-->
      <!--    </ul>-->
      <!--    <p class="hint vital"><?php echo htmlentities(lang('virtual_goods_instructions1')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<dl class="special-01" dstype="virtual_valid" <?php if ($goods['is_virtual'] == 0) {?>style="display:none;"<?php }?>>-->
      <!--  <dt><i class="required">*</i><?php echo htmlentities(lang('virtual_goods_instructions2')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <input type="text" name="g_vindate" id="g_vindate" class="w80 text" value="<?php if($goods['is_virtual'] == 1 && !empty($goods['virtual_indate'])) { echo date('Y-m-d', $goods['virtual_indate']);}?>"><em class="add-on"><i class="iconfont">&#xe8d6;</i></em>-->
      <!--    <span></span>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('virtual_goods_instructions3')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<dl class="special-01" dstype="virtual_valid" <?php if ($goods['is_virtual'] == 0) {?>style="display:none;"<?php }?>>-->
      <!--  <dt><i class="required">*</i><?php echo htmlentities(lang('virtual_goods_instructions4')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <input type="text" name="g_vlimit" id="g_vlimit" class="w80 text" value="<?php if ($goods['is_virtual'] == 1) {echo $goods['virtual_limit'];}?>">-->
      <!--    <span></span>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('virtual_goods_instructions5')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<dl class="special-01" dstype="virtual_valid" <?php if ($goods['is_virtual'] == 0) {?>style="display:none;"<?php }?>>-->
      <!--  <dt><?php echo htmlentities(lang('virtual_goods_instructions6')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <ul class="dssc-form-radio-list">-->
      <!--      <li>-->
      <!--        <input type="radio" name="g_vinvalidrefund" id="g_vinvalidrefund_1" value="1" <?php if ($goods['virtual_invalid_refund'] ==1) {?>checked<?php }?>>-->
      <!--        <label for="g_vinvalidrefund_1"><?php echo htmlentities(lang('ds_yes')); ?></label>-->
      <!--      </li>-->
      <!--      <li>-->
      <!--        <input type="radio" name="g_vinvalidrefund" id="g_vinvalidrefund_0" value="0" <?php if ($goods['virtual_invalid_refund'] == 0) {?>checked<?php }?>>-->
      <!--        <label for="g_vinvalidrefund_0"><?php echo htmlentities(lang('ds_no')); ?></label>-->
      <!--      </li>-->
      <!--    </ul>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('virtual_goods_instructions7')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<?php endif; ?>-->
      <!-- ??????????????????????????????????????? E --> 
      <!-- F?????????????????? S -->
      <!--<dl class="special-02" dstype="virtual_null" <?php if (isset($goods['is_virtual']) && $goods['is_virtual'] == 1) {?>style="display:none;"<?php }?>>-->
      <!--  <dt><?php echo htmlentities(lang('f_code_goods')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <ul class="dssc-form-radio-list">-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_fc" id="is_goodsfcode_1" value="1" <?php if (isset($goods['is_goodsfcode']) && $goods['is_goodsfcode'] == 1) {?>checked<?php }?>>-->
      <!--        <label for="is_goodsfcode_1"><?php echo htmlentities(lang('ds_yes')); ?></label>-->
      <!--      </li>-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_fc" id="is_goodsfcode_0" value="0" <?php if (isset($goods['is_goodsfcode']) && $goods['is_goodsfcode'] == 0) {?>checked<?php }?>>-->
      <!--        <label for="is_goodsfcode_0"><?php echo htmlentities(lang('ds_no')); ?></label>-->
      <!--      </li>-->
      <!--    </ul>-->
      <!--    <p class="hint vital"><?php echo htmlentities(lang('f_code_guidelines1')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<dl class="special-02" dstype="fcode_valid" <?php if (isset($goods['is_goodsfcode']) && $goods['is_goodsfcode'] == 0) {?>style="display:none;"<?php }?>>-->
      <!--  <dt>-->
      <!--    <?php if(!isset($edit_goods_sign)): ?>-->
      <!--    <i class="required">*</i>-->
      <!--    <?php endif; ?>-->
      <!--    <?php echo htmlentities(lang('f_code_guidelines2')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <input type="text" name="g_fccount" id="g_fccount" class="w80 text" value="">-->
      <!--    <span></span>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('f_code_guidelines3')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<dl class="special-02" dstype="fcode_valid" <?php if (isset($goods['is_goodsfcode']) && $goods['is_goodsfcode'] == 0) {?>style="display:none;"<?php }?>>-->
      <!--  <dt>-->
      <!--    <?php if(!isset($edit_goods_sign)): ?>-->
      <!--    <i class="required">*</i>-->
      <!--    <?php endif; ?>-->
      <!--    <?php echo htmlentities(lang('f_code_guidelines4')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <input type="text" name="g_fcprefix" id="g_fcprefix" class="w80 text" value="">-->
      <!--    <span></span>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('f_code_guidelines5')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<?php if (isset($goods['is_goodsfcode']) && $goods['is_goodsfcode'] == 1) {?>-->
      <!--<dl class="special-02" dstype="fcode_valid">-->
      <!--  <dt>-->
      <!--  <a class="dssc-btn-mini dssc-btn-red" href="<?php echo url('Sellergoodsonline/download_f_code_excel',['commonid'=>$goods['goods_commonid']]); ?>"><?php echo htmlentities(lang('download_code_f')); ?></a>&nbsp;&nbsp;<?php echo htmlentities(lang('sellergoodsadd_f_code')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <ul class="dssc-form-radio-list">-->
      <!--      <?php if(!(empty($fcode_array) || (($fcode_array instanceof \think\Collection || $fcode_array instanceof \think\Paginator ) && $fcode_array->isEmpty()))): ?>-->
      <!--      <?php if(is_array($fcode_array) || $fcode_array instanceof \think\Collection || $fcode_array instanceof \think\Paginator): if( count($fcode_array)==0 ) : echo "" ;else: foreach($fcode_array as $key=>$val): ?>-->
      <!--      <li>-->
      <!--          <?php echo htmlentities($val['goodsfcode_code']); ?>(<?php if($val['goodsfcode_state'] == 1): ?><?php echo htmlentities(lang('sellergoodsadd_employ')); else: ?><?php echo htmlentities(lang('sellergoodsadd_unused')); ?><?php endif; ?>)-->
      <!--      </li>-->
      <!--      <?php endforeach; endif; else: echo "" ;endif; ?>-->
      <!--      <?php endif; ?>-->
      <!--    </ul>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<?php }?>-->
      <!-- F?????????????????? E --> 
      <!-- ???????????? S -->
      <!--<dl class="special-03" dstype="virtual_null" <?php if (isset($goods['is_virtual']) && $goods['is_virtual'] == 1) {?>style="display:none;"<?php }?>>-->
      <!--  <dt><?php echo htmlentities(lang('sellergoodsadd_presell')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <ul class="dssc-form-radio-list">-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_presell" id="is_presell_1" value="1" <?php if(isset($goods['is_presell']) && $goods['is_presell'] == 1) {?>checked<?php }?>>-->
      <!--        <label for="is_presell_1"><?php echo htmlentities(lang('ds_yes')); ?></label>-->
      <!--      </li>-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_presell" id="is_presell_0" value="0" <?php if(isset($goods['is_presell']) && $goods['is_presell'] == 0) {?>checked<?php }?>>-->
      <!--        <label for="is_presell_0"><?php echo htmlentities(lang('ds_no')); ?></label>-->
      <!--      </li>-->
      <!--    </ul>-->
      <!--    <p class="hint vital"><?php echo htmlentities(lang('booking_information')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!--<dl class="special-03" dstype="is_presell" <?php if (isset($goods['is_presell']) && $goods['is_presell'] == 0) {?>style="display:none;"<?php }?>>-->
      <!--  <dt><i class="required">*</i><?php echo htmlentities(lang('delivery_date')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <input type="text" name="g_deliverdate" id="g_deliverdate" class="w80 text" value="<?php if (isset($goods['presell_deliverdate']) && $goods['presell_deliverdate'] > 0) {echo date('Y-m-d', $goods['presell_deliverdate']);}?>"><em class="add-on"><i class="iconfont">&#xe8d6;</i></em>-->
      <!--    <span></span>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('merchant_delivery_time')); ?>???</p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <!-- ???????????? E --> 
      <!-- ?????????????????? S -->
      <h3 id="demo4"><?php echo htmlentities(lang('store_goods_index_goods_transport')); ?></h3>
      <!--<dl>-->
      <!--  <dt><?php echo htmlentities(lang('store_goods_index_goods_szd')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--     <input type="hidden" value="<?php echo $goods['areaid_2'] ? $goods['areaid_2'] : $goods['areaid_1'];?>" name="region" id="region">-->
      <!--     <input type="hidden" value="<?php echo htmlentities((isset($goods['areaid_1']) && ($goods['areaid_1'] !== '')?$goods['areaid_1']:'')); ?>" name="province_id" id="_area_1">-->
      <!--     <input type="hidden" value="<?php echo htmlentities((isset($goods['areaid_2']) && ($goods['areaid_2'] !== '')?$goods['areaid_2']:'')); ?>" name="city_id" id="_area_2">-->
      <!--    </p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <dl dstype="virtual_null" <?php if($goods['is_virtual'] == 1): ?>style="display:none;"<?php endif; ?>>
        <dt><?php echo htmlentities(lang('store_goods_index_goods_transfee_charge')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <ul class="dssc-form-radio-list">
            <li>
              <input id="freight_0" dstype="freight" name="freight" class="radio" type="radio" <?php if (intval($goods['transport_id']) == 0) {?>checked="checked"<?php }?> value="0">
              <label for="freight_0"><?php echo htmlentities(lang('fixed_freight')); ?></label>
              <div dstype="div_freight" <?php if (intval($goods['transport_id']) != 0) {?>style="display: none;"<?php }?>>
                <input id="g_freight" class="w50 text" ds_type='transport' type="text" value="<?php printf('%.2f', floatval($goods['goods_freight']));?>" name="g_freight"><em class="add-on"><i class="iconfont">&#xe65c;</i></em> </div>
            </li>
            <!--<li>-->
            <!--  <input id="freight_1" dstype="freight" name="freight" class="radio" type="radio" <?php if (intval($goods['transport_id']) != 0) {?>checked="checked"<?php }?> value="1">-->
            <!--  <label for="freight_1"><?php echo htmlentities(lang('store_goods_index_use_tpl')); ?></label>-->
            <!--  <div dstype="div_freight" <?php if (intval($goods['transport_id']) == 0) {?>style="display: none;"<?php }?>>-->
            <!--    <input id="transport_id" type="hidden" value="<?php echo htmlentities($goods['transport_id']); ?>" name="transport_id">-->
            <!--    <input id="transport_title" type="hidden" value="<?php echo htmlentities($goods['transport_title']); ?>" name="transport_title">-->
            <!--    <span id="postageName" class="transport-name" <?php if ($goods['transport_title'] != '' && intval($goods['transport_id'])) {?>style="display: inline-block;"<?php }?>><?php echo htmlentities($goods['transport_title']); ?></span>-->
            <!--    <a href="JavaScript:void(0);" onclick="window.open('<?php echo url('Sellertransport/index',['type'=>'select']); ?>')" class="dsbtn" id="postageButton"><i class="iconfont">&#xe6f1;</i><?php echo htmlentities(lang('store_goods_index_select_tpl')); ?></a> -->
            <!--  </div>-->
            <!--</li>-->
          </ul>
          <p class="hint"> <?php echo htmlentities(lang('freight_set')); ?></p>
        </dd>
      </dl>
      <!-- ?????????????????? E -->
      <h3 id="demo5" dstype="virtual_null" <?php if ($goods['is_virtual'] == 1) {?>style="display:none;"<?php }?>><?php echo htmlentities(lang('invoice_information')); ?></h3>
      <dl dstype="virtual_null" <?php if ($goods['is_virtual'] == 1) {?>style="display:none;"<?php }?>>
        <dt><?php echo htmlentities(lang('whether_add_tax_invoice')); ?>???</dt>
        <dd>
          <ul class="dssc-form-radio-list">
            <li>
              <label>
                <input name="g_vat" value="1" <?php if (!empty($goods) && $goods['goods_vat'] == 1) { ?>checked="checked" <?php } ?> type="radio" />
                <?php echo htmlentities(lang('ds_yes')); ?></label>
            </li>
            <li>
              <label>
                <input name="g_vat" value="0" <?php if (empty($goods) || $goods['goods_vat'] == 0) { ?>checked="checked" <?php } ?> type="radio"/>
                <?php echo htmlentities(lang('ds_no')); ?></label>
            </li>
          </ul>
          <p class="hint"></p>
        </dd>
      </dl>
      <h3 id="demo6"><?php echo htmlentities(lang('store_goods_index_goods_other_info')); ?></h3>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_index_store_goods_class')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd><span class="new_add"><a href="javascript:void(0)" id="add_sgcategory" class="dssc-btn"><?php echo htmlentities(lang('store_goods_index_new_class')); ?></a> </span>
          <?php if(!(empty($store_class_goods) || (($store_class_goods instanceof \think\Collection || $store_class_goods instanceof \think\Paginator ) && $store_class_goods->isEmpty()))): if(is_array($store_class_goods) || $store_class_goods instanceof \think\Collection || $store_class_goods instanceof \think\Paginator): if( count($store_class_goods)==0 ) : echo "" ;else: foreach($store_class_goods as $key=>$v): ?>
          <select name="sgcate_id[]" class="sgcategory">
            <option value="0"><?php echo htmlentities(lang('ds_please_choose')); ?></option>
            <?php if(is_array($store_goods_class) || $store_goods_class instanceof \think\Collection || $store_goods_class instanceof \think\Paginator): if( count($store_goods_class)==0 ) : echo "" ;else: foreach($store_goods_class as $key=>$val): ?>
            <option value="<?php echo htmlentities($val['storegc_id']); ?>" <?php if ($v==$val['storegc_id']) { ?>selected="selected"<?php } ?>><?php echo htmlentities($val['storegc_name']); ?></option>
            <?php if (isset($val['child']) && count($val['child'])>0){if(is_array($val['child']) || $val['child'] instanceof \think\Collection || $val['child'] instanceof \think\Paginator): if( count($val['child'])==0 ) : echo "" ;else: foreach($val['child'] as $key=>$child_val): ?>
            <option value="<?php echo htmlentities($child_val['storegc_id']); ?>" <?php if ($v==$child_val['storegc_id']) { ?>selected="selected"<?php } ?>>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo htmlentities($child_val['storegc_name']); ?></option>
            <?php endforeach; endif; else: echo "" ;endif; }?>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
          <?php endforeach; endif; else: echo "" ;endif; else: ?>
          <select name="sgcate_id[]" class="sgcategory">
            <option value="0"><?php echo htmlentities(lang('ds_please_choose')); ?></option>
            <?php if(!(empty($store_goods_class) || (($store_goods_class instanceof \think\Collection || $store_goods_class instanceof \think\Paginator ) && $store_goods_class->isEmpty()))): if(is_array($store_goods_class) || $store_goods_class instanceof \think\Collection || $store_goods_class instanceof \think\Paginator): if( count($store_goods_class)==0 ) : echo "" ;else: foreach($store_goods_class as $key=>$val): ?>
            <option value="<?php echo htmlentities($val['storegc_id']); ?>"><?php echo htmlentities($val['storegc_name']); ?></option>
            <?php if (isset($val['child']) && count($val['child'])>0){if(is_array($val['child']) || $val['child'] instanceof \think\Collection || $val['child'] instanceof \think\Paginator): if( count($val['child'])==0 ) : echo "" ;else: foreach($val['child'] as $key=>$child_val): ?>
            <option value="<?php echo htmlentities($child_val['storegc_id']); ?>">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo htmlentities($child_val['storegc_name']); ?></option>
            <?php endforeach; endif; else: echo "" ;endif; }?>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <?php endif; ?>
          </select>
          <?php endif; ?>
          <p class="hint"><?php echo htmlentities(lang('store_goods_index_belong_multiple_store_class')); ?></p>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_index_goods_show')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <ul class="dssc-form-radio-list">
            <li>
              <label>
                <input name="g_state" value="1" type="radio" <?php if (empty($goods) || $goods['goods_state'] == 1 || $goods['goods_state'] == 10) {?>checked="checked"<?php }?> />
                 <?php echo htmlentities(lang('store_goods_index_immediately_sales')); ?></label>
            </li>
            <li>
              <label>
                <input name="g_state" value="0" type="radio" dstype="auto" />
                 <?php echo htmlentities(lang('store_goods_step2_start_time')); ?>
              </label>
              <input type="text" class="w80 text" name="starttime" disabled="disabled" style="background:#E7E7E7 none;" id="starttime" value="<?php echo date('Y-m-d'); ?>" />
              <select disabled="disabled" style="background:#E7E7E7 none;" name="starttime_H" id="starttime_H">
                  <?php if(is_array($hour_array) || $hour_array instanceof \think\Collection || $hour_array instanceof \think\Paginator): if( count($hour_array)==0 ) : echo "" ;else: foreach($hour_array as $key=>$val): ?>
                  <option value="<?php echo htmlentities($val); ?>" <?php $sign_h = 0;if($val>=date('h') && $sign_h != 1){?>selected="selected"<?php $sign_H = 1;}?>><?php echo htmlentities($val); ?></option>
                  <?php endforeach; endif; else: echo "" ;endif; ?>
              </select>
              <?php echo htmlentities(lang('store_goods_step2_hour')); ?>
              <select disabled="disabled" style="background:#E7E7E7 none;" name="starttime_i" id="starttime_i">
                <?php if(is_array($minute_array) || $minute_array instanceof \think\Collection || $minute_array instanceof \think\Paginator): if( count($minute_array)==0 ) : echo "" ;else: foreach($minute_array as $key=>$val): ?>
                <option value="<?php echo htmlentities($val); ?>" <?php $sign_mi = 0;if($val>=date('i') && $sign_mi != 1){?>selected="selected"<?php $sign_mi = 1;}?>><?php echo htmlentities($val); ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
              </select>
               <?php echo htmlentities(lang('store_goods_step2_minute')); ?></li>
            <li>
              <label>
                <input name="g_state" value="0" type="radio" <?php if (!empty($goods) && $goods['goods_state'] == 0) {?>checked="checked"<?php }?> />
                <?php echo htmlentities(lang('store_goods_index_in_warehouse')); ?> </label>
            </li>
          </ul>
        </dd>
      </dl>
      <!--<dl>-->
      <!--  <dt><?php echo htmlentities(lang('sellergoodsadd_make')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>-->
      <!--  <dd>-->
      <!--    <ul class="dssc-form-radio-list">-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_appoint" id="is_appoint_1" value="1"  <?php if($goods['is_appoint'] == 1) {?>checked<?php }?>>-->
      <!--        <label for="is_appoint_1"><?php echo htmlentities(lang('ds_yes')); ?></label>-->
      <!--      </li>-->
      <!--      <li>-->
      <!--        <input type="radio" name="is_appoint" id="is_appoint_0" value="0"  <?php if($goods['is_appoint'] == 0) {?>checked<?php }?>>-->
      <!--        <label for="is_appoint_0"><?php echo htmlentities(lang('ds_no')); ?></label>-->
      <!--      </li>-->
      <!--    </ul>-->
      <!--    <p class="hint"><?php echo htmlentities(lang('booking_information')); ?></p>-->
      <!--  </dd>-->
      <!--</dl>-->
      <dl dstype="is_appoint"  <?php if ($goods['is_appoint'] == 0) {?>style="display:none;"<?php }?>>
        <dt><i class="required">*</i><?php echo htmlentities(lang('release_date')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <input type="text" name="g_saledate" id="g_saledate" class="w80 text" value="<?php if ($goods['appoint_satedate'] > 0) {echo date('Y-m-d', $goods['appoint_satedate']);}?>">
          <span></span>
          <p class="hint"><?php echo htmlentities(lang('booking_goods')); ?></p>
        </dd>
      </dl>
      <dl>
        <dt><?php echo htmlentities(lang('store_goods_index_goods_recommend')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
        <dd>
          <ul class="dssc-form-radio-list">
            <li>
              <label>
                <input name="g_commend" value="1" <?php if (empty($goods) || $goods['goods_commend'] == 1) { ?>checked="checked" <?php } ?> type="radio" />
                <?php echo htmlentities(lang('ds_yes')); ?></label>
            </li>
            <li>
              <label>
                <input name="g_commend" value="0" <?php if (!empty($goods) && $goods['goods_commend'] == 0) { ?>checked="checked" <?php } ?> type="radio"/>
                <?php echo htmlentities(lang('ds_no')); ?></label>
            </li>
          </ul>
          <p class="hint"><?php echo htmlentities(lang('store_goods_index_recommend_tip')); ?></p>
        </dd>
      </dl>
    </div>
    <div class="bottom tc hr32">
        <input type="submit" class="submit" value="<?php if (isset($edit_goods_sign)) {echo lang('ds_submit');} else {?><?php echo htmlentities(lang('store_goods_add_next')); ?>???<?php echo htmlentities(lang('store_goods_index_upload_goods_pic')); }?>" />
    </div>
  </form>
</div>


<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.ajaxContent.pack.js"></script>
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/mlselection.js"></script>
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/fileupload/jquery.iframe-transport.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/fileupload/jquery.ui.widget.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/fileupload/jquery.fileupload.js" charset="utf-8"></script>

<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.mousewheel.js"></script>
<script type="text/javascript" src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.charCount.js"></script>


<!--[if lt IE 8]>
  <script src="<?php echo htmlentities(BASE_SITE_ROOT); ?>/js/json2.js"></script>
<![endif]-->
<script src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/js/sellergoods_add_step2.js"></script>


<script type="text/javascript">
var DEFAULT_GOODS_IMAGE = "<?php echo goods_thumb(array(), 60); ?>";

$(function(){
    $("#region").ds_region({show_deep:2,tip_type:1});
	//??????????????????tab??????
	$(".tabs").tabs();
    $.validator.addMethod('checkPrice', function(value,element){
    	_g_price = parseFloat($('input[name="g_price"]').val());
        _g_marketprice = parseFloat($('input[name="g_marketprice"]').val());
        if (_g_price > _g_marketprice) {
            return false;
        }else {
            return true;
        }
    }, '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('not_higher_than')); ?>');
	jQuery.validator.addMethod("checkFCodePrefix", function(value, element) {       
		return this.optional(element) || /^[a-zA-Z]+$/.test(value);       
	},'<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information1')); ?>');  
    $('#goods_form').validate({
        errorPlacement: function(error, element){
            $(element).nextAll('span').append(error);
        },
        //?????????????????????????????????
        <?php if (isset($edit_goods_sign)) {?>
        submitHandler:function(form){
            ds_ajaxpost('goods_form', 'default', "<?php echo url('Sellergoodsonline/edit_save_goods'); ?>");
        },
        <?php }?>
        rules : {
            g_name : {
                required    : true,
                minlength   : 3,
                maxlength   : 50
            },
            g_jingle : {
                maxlength   : 140
            },
            g_price : {
                required    : true,
                number      : true,
                min         : 0.01,
                max         : 9999999,
                checkPrice  : true
            },
            goods_weight : {
                required    : false,
                number      : true,
            },
            g_marketprice : {
                number      : true,
                min         : 0.01,
                max         : 9999999
            },
            g_costprice : {
                number      : true,
                min         : 0.00,
                max         : 9999999
            },
            g_storage  : {
                required    : true,
                digits      : true,
                min         : 0,
                max         : 999999999
            },
            image_path : {
                required    : false
            },
            g_vindate : {
                required    : function() {if ($("#is_gv_1").prop("checked")) {return true;} else {return false;}}
            },
			g_vlimit : {
				required	: function() {if ($("#is_gv_1").prop("checked")) {return true;} else {return false;}},
				range		: [1,10]
			},
			g_fccount : {
				<?php if (!isset($edit_goods_sign)) {?>required	: function() {if ($("#is_goodsfcode_1").prop("checked")) {return true;} else {return false;}},<?php }?>
				range		: [1,100]
			},
			g_fcprefix : {
				<?php if (!isset($edit_goods_sign)) {?>required	: function() {if ($("#is_goodsfcode_1").prop("checked")) {return true;} else {return false;}},<?php }?>
				checkFCodePrefix : true,
				rangelength	: [3,5]
			},
			g_saledate : {
				required	: function () {if ($('#is_appoint_1').prop("checked")) {return true;} else {return false;}}
			},
			g_deliverdate : {
				required	: function () {if ($('#is_presell_1').prop("checked")) {return true;} else {return false;}}
			}
        },
        messages : {
            g_name  : {
                required    : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_name_null')); ?>',
                minlength   : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_name_help')); ?>',
                maxlength   : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_name_help')); ?>'
            },
            g_jingle : {
                maxlength   : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information2')); ?>'
            },
            g_price : {
                required    : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_store_price_null')); ?>',
                number      : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_store_price_error')); ?>',
                min         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_store_price_interval')); ?>',
                max         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_store_price_interval')); ?>'
            },
            goods_weight : {
                required    : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_weight_null')); ?>',
                number      : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_weight_error')); ?>',
            },
            g_marketprice : {
                number      : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information4')); ?>',
                min         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>0.01~9999999<?php echo htmlentities(lang('prompt_information6')); ?>',
                max         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>0.01~9999999<?php echo htmlentities(lang('prompt_information6')); ?>'
            },
            g_costprice : {
                number      : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information4')); ?>',
                min         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>0.00~9999999<?php echo htmlentities(lang('prompt_information6')); ?>',
                max         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>0.00~9999999<?php echo htmlentities(lang('prompt_information6')); ?>'
            },
            g_storage : {
                required    : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_stock_null')); ?>',
                digits      : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_stock_error')); ?>',
                min         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_stock_checking')); ?>',
                max         : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('store_goods_index_goods_stock_checking')); ?>'
            },
            image_path : {
                required    : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information8')); ?>'
            },
            g_vindate : {
                required    : '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information9')); ?>'
            },
			g_vlimit : {
				required	: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>1~10<?php echo htmlentities(lang('prompt_information6')); ?>',
				range		: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>1~10<?php echo htmlentities(lang('prompt_information6')); ?>'
			},
			g_fccount : {
				required	: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>1~100<?php echo htmlentities(lang('prompt_information6')); ?>',
				range		: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>1~100<?php echo htmlentities(lang('prompt_information6')); ?>'
			},
			g_fcprefix : {
				required	: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>3~5<?php echo htmlentities(lang('prompt_information7')); ?>',
				rangelength	: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information5')); ?>3~5<?php echo htmlentities(lang('prompt_information7')); ?>'
			},
			g_saledate : {
				required	: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information9')); ?>'
			},
			g_deliverdate : {
				required	: '<i class="iconfont">&#xe64c;</i><?php echo htmlentities(lang('prompt_information9')); ?>'
			}
        }
    });
    <?php if (isset($goods)) {?>
	setTimeout("setArea(<?php echo $goods['areaid_1'];?>, <?php echo $goods['areaid_2'];?>)", 1000);
	<?php }?>
});
// ??????????????????????????????
var spec_group_checked = new Array();
<?php for($i=0; $i<$sign_i; $i++){ ?>  
        spec_group_checked["<?php echo $i;?>"]='';
<?php } ?>
var str = '';
var V = new Array();

<?php for ($i=0; $i<$sign_i; $i++){?>
var spec_group_checked_<?php echo $i;?> = new Array();
<?php }?>

$(function(){
	$('dl[dstype="spec_group_dl"]').on('click', 'span[dstype="input_checkbox"] > input[type="checkbox"]',function(){
		into_array();
		goods_stock_set();
	});

	// ??????????????????????????????????????????????????????????????????????????????0
	// ????????????????????? ?????????input??????disable??????
	$('input[type="submit"]').click(function(){
		$('input[data_type="price"]').each(function(){
			if($(this).val() == ''){
				$(this).val($('input[name="g_price"]').val());
			}
		});
                $('input[data_type="goods_weight"]').each(function(){
			if($(this).val() == ''){
				$(this).val($('input[name="goods_weight"]').val());
			}
		});
		$('input[data_type="stock"]').each(function(){
			if($(this).val() == ''){
				$(this).val('0');
			}
		});
		$('input[data_type="alarm"]').each(function(){
			if($(this).val() == ''){
				$(this).val('0');
			}
		});
		if($('dl[ds_type="spec_dl"]').css('display') == 'none'){
			$('dl[ds_type="spec_dl"]').find('input').prop('disabled','disabled');
		}
	});
	
});

// ??????????????????????????????
function into_array(){
<?php for ($i=0; $i<$sign_i; $i++){?>
		
		spec_group_checked_<?php echo $i;?> = new Array();
		$('dl[ds_type="spec_group_dl_<?php echo $i;?>"]').find('input[type="checkbox"]:checked').each(function(){
			i = $(this).attr('ds_type');
			v = $(this).val();
			c = null;
			if ($(this).parents('dl:first').attr('spec_img') == 't') {
				c = 1;
			}
			spec_group_checked_<?php echo $i;?>[spec_group_checked_<?php echo $i;?>.length] = [v,i,c];
		});

		spec_group_checked["<?php echo $i;?>"] = spec_group_checked_<?php echo $i;?>;

<?php }?>
}

// ??????????????????
function goods_stock_set(){
    //  ???????????? ????????????????????????
    $('input[name="goods_weight"]').attr('readonly','readonly').css('background','#E7E7E7 none');
    $('input[name="g_price"]').attr('readonly','readonly').css('background','#E7E7E7 none');
    $('input[name="g_storage"]').attr('readonly','readonly').css('background','#E7E7E7 none');

    $('dl[ds_type="spec_dl"]').show();
    str = '<tr>';
    <?php recursionSpec(0,$sign_i);?>
    //?????????????????????
<?php if(!(empty($spec_list) || (($spec_list instanceof \think\Collection || $spec_list instanceof \think\Paginator ) && $spec_list->isEmpty()))): if(is_array($spec_list) || $spec_list instanceof \think\Collection || $spec_list instanceof \think\Paginator): if( count($spec_list)==0 ) : echo "" ;else: foreach($spec_list as $k=>$val): ?>
$('[dstype=spec_name_'+(<?php echo htmlentities($k); ?>)+']').hide();
<?php endforeach; endif; else: echo "" ;endif; ?>
<?php endif; ?>
var total_length=0;
for(var i in checked_group){
$('[data-type=spec_name_'+(checked_group[i])+']').show();
if(total_length==0){
    total_length=1;
}
total_length=total_length*spec_group_checked[checked_group[i]].length;
}

var k=new Array();
var l=0;
var n=0;
for(var j=0;j<total_length;j++){
    var spec_id_array=[];
    var sub_str='';
    sub_str += '<input type="hidden" name="spec[spec_bunch][goods_id]" ds_type="spec_bunch|id" value="" />';
    for(var i in checked_group){
        
        
        if(typeof(k[checked_group[i]])=='undefined'){
            k[checked_group[i]]=0;
        }
        spec_id_array.push(spec_group_checked[checked_group[i]][k[checked_group[i]]][1]);
        if (spec_group_checked[checked_group[i]][k[checked_group[i]]][2] != null) { sub_str += '<input type="hidden" name="spec[spec_bunch][color]" value="'+spec_group_checked[checked_group[i]][k[checked_group[i]]][1]+'" />';}
        sub_str +='<td><input type="hidden" name="spec[spec_bunch][sp_value]['+spec_group_checked[checked_group[i]][k[checked_group[i]]][1]+']" value="'+spec_group_checked[checked_group[i]][k[checked_group[i]]][0]+'" />'+spec_group_checked[checked_group[i]][k[checked_group[i]]][0]+'</td>';    
        //checked_group???????????????????????????
		//spec_group_checked???????????????????????????
		//k????????????????????????
		//total_length??????????????????????????????
		
		//????????????????????????????????????????????????????????????????????????????????????????????????????????????0
		
		//?????????????????????
		//???????????????????????????
		//?????????????????????????????????
		//????????????????????????????????????
		//???????????????????????????
		//??????????????????
		//??????????????????
        if(i==(checked_group.length-1)){
            k[checked_group[i]]++;
            if(k[checked_group[i]]==spec_group_checked[checked_group[i]].length){
                for(var m = (checked_group.length-1);m>=0;m--){
                    if(k[checked_group[m]]<(spec_group_checked[checked_group[m]].length-1)){
                        k[checked_group[m]]++;
						break;
                    }else{
                        k[checked_group[m]]=0;
                    }
                }
            }
        }
    }

    sub_str +='<td><input class="text price" type="text" name="spec[spec_bunch][marketprice]" data_type="marketprice" ds_type="spec_bunch|marketprice" value="" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em></td><td><input class="text price" type="text" name="spec[spec_bunch][price]" data_type="price" ds_type="spec_bunch|price" value="" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em></td><td><input class="text stock" type="text" name="spec[spec_bunch][goods_weight]" data_type="goods_weight" ds_type="spec_bunch|goods_weight" value="" /></td><td><input class="text stock" type="text" name="spec[spec_bunch][stock]" data_type="stock" ds_type="spec_bunch|stock" value="" /></td><td><input class="text stock" type="text" name="spec[spec_bunch][alarm]" data_type="alarm" ds_type="spec_bunch|alarm" value="" /></td><td><input class="text sku" type="text" name="spec[spec_bunch][sku]" ds_type="spec_bunch|sku" value="" /></td></tr>';
    sub_str=sub_str.replace(/spec_bunch/g, 'i_'+spec_id_array.sort(function(a,b){return a - b}).join(''));
    str +=sub_str;
}
    //?????????????????????

    if(str == '<tr>'){
        //  ???????????? ????????????????????????
        $('input[name="goods_weight"]').removeAttr('readonly').css('background','');
        $('input[name="g_price"]').removeAttr('readonly').css('background','');
        $('input[name="g_storage"]').removeAttr('readonly').css('background','');
        $('dl[ds_type="spec_dl"]').hide();
    }else{
        $('tbody[ds_type="spec_table"]').empty().html(str)
            .find('input[ds_type]').each(function(){
                s = $(this).attr('ds_type');
                try{$(this).val(V[s]);}catch(ex){$(this).val('');};
                if ($(this).attr('data_type') == 'marketprice' && $(this).val() == '') {
                    $(this).val($('input[name="g_marketprice"]').val());
                }
                if ($(this).attr('data_type') == 'price' && $(this).val() == ''){
                    $(this).val($('input[name="g_price"]').val());
                }
                if ($(this).attr('data_type') == 'goods_weight' && $(this).val() == ''){
                    $(this).val($('input[name="goods_weight"]').val());
                }
                if ($(this).attr('data_type') == 'stock' && $(this).val() == ''){
                    $(this).val('0');
                }
                if ($(this).attr('data_type') == 'alarm' && $(this).val() == ''){
                    $(this).val('0');
                }
            }).end()
            .find('input[data_type="stock"]').change(function(){
                computeStock();    // ????????????
            }).end()
            .find('input[data_type="goods_weight"]').change(function(){
                computeWeight();    // ????????????
            }).end()
            .find('input[data_type="price"]').change(function(){
                computePrice();     // ????????????
            }).end()
            .find('input[ds_type]').change(function(){
                s = $(this).attr('ds_type');
                V[s] = $(this).val();
            });
    }
}

<?php 
/**
 * 
 * 
 *  ???????????????js?????????????????????	PHP
 * 
 *  ???????????? ??? 2????????????
 *  $('input[type="checkbox"]').click(function(){
 *      str = '';
 *      for (var i=0; i<spec_group_checked[0].length; i++ ){
 *      td_1 = spec_group_checked[0][i];
 *          for (var j=0; j<spec_group_checked[1].length; j++){
 *              td_2 = spec_group_checked[1][j];
 *              str += '<tr><td>'+td_1[0]+'</td><td>'+td_2[0]+'</td><td><input type="text" /></td><td><input type="text" /></td><td><input type="text" /></td>';
 *          }
 *      }
 *      $('table[class="spec_table"] > tbody').empty().html(str);
 *  });
 */
function recursionSpec($len,$sign) {
echo "var checked_group=new Array();\n";
for($i=0; $i< $sign; $i++){
    echo "if(spec_group_checked['".$i."'].length>0){ checked_group.push('".$i."'); }\n";
}


}

if (!empty($goods) && !empty($sp_value) && !empty($spec_checked) && !empty($spec_list)){?>
    
//  ?????????????????????JS
$(function(){
	var E_SP = new Array();
	var E_SPV = new Array();
	<?php 
	$string = '';
	foreach ($spec_checked as $v) {
		$string .= "E_SP[".$v['id']."] = '".$v['name']."';";
	}
	echo $string;
	echo "\n";
	$string = '';
	foreach ($sp_value as $k=>$v) {
		$string .= "E_SPV['".$k."'] = '".$v."';";
	}
	echo $string;
	 ?>
	V = E_SPV;
	$('dl[ds_type="spec_dl"]').show();
	$('dl[dstype="spec_group_dl"]').find('input[type="checkbox"]').each(function(){
            
		//  ???????????? ????????????????????????
                $('input[name="goods_weight"]').attr('readonly','readonly').css('background','#E7E7E7 none');
		$('input[name="g_price"]').attr('readonly','readonly').css('background','#E7E7E7 none');
		$('input[name="g_storage"]').attr('readonly','readonly').css('background','#E7E7E7 none');
		s = $(this).attr('ds_type');
		if (!(typeof(E_SP[s]) == 'undefined')){
			$(this).prop('checked',true);
			v = $(this).parents('li').find('span[dstype="pv_name"]');
			if(E_SP[s] != ''){
				$(this).val(E_SP[s]);
				v.html('<input type="text" maxlength="20" value="'+E_SP[s]+'" />');
			}else{
				v.html('<input type="text" maxlength="20" value="'+v.html()+'" />');
			}
			change_img_name($(this));			// ???????????????????????????
		}
	});

    into_array();	// ??????????????????????????????
    str = '<tr>';
    <?php recursionSpec(0,$sign_i);?>
        
    //?????????????????????

var total_length=0;
for(var i in checked_group){
$('[data-type=spec_name_'+(checked_group[i])+']').show();
if(total_length==0){
    total_length=1;
}
total_length=total_length*spec_group_checked[checked_group[i]].length;
}

var k=new Array();
var l=0;
var n=0;
for(var j=0;j<total_length;j++){
    var spec_id_array=[];
    var sub_str='';
    sub_str += '<input type="hidden" name="spec[spec_bunch][goods_id]" ds_type="spec_bunch|id" value="" />';
    for(var i in checked_group){
        
        
        if(typeof(k[checked_group[i]])=='undefined'){
            k[checked_group[i]]=0;
        }
        spec_id_array.push(spec_group_checked[checked_group[i]][k[checked_group[i]]][1]);
        if (spec_group_checked[checked_group[i]][k[checked_group[i]]][2] != null) { sub_str += '<input type="hidden" name="spec[spec_bunch][color]" value="'+spec_group_checked[checked_group[i]][k[checked_group[i]]][1]+'" />';}
        sub_str +='<td><input type="hidden" name="spec[spec_bunch][sp_value]['+spec_group_checked[checked_group[i]][k[checked_group[i]]][1]+']" value="'+spec_group_checked[checked_group[i]][k[checked_group[i]]][0]+'" />'+spec_group_checked[checked_group[i]][k[checked_group[i]]][0]+'</td>';    
        
        if(i==(checked_group.length-1)){
            k[checked_group[i]]++;
            if(k[checked_group[i]]==spec_group_checked[checked_group[i]].length){
                for(var m = (checked_group.length-1);m>=0;m--){
                    if(k[checked_group[m]]<(spec_group_checked[checked_group[m]].length-1)){
                        k[checked_group[m]]++;
						break;
                    }else{
                        k[checked_group[m]]=0;
                    }
                }
            }
        }
    }
    
    sub_str +='<td><input class="text price" type="text" name="spec[spec_bunch][marketprice]" data_type="marketprice" ds_type="spec_bunch|marketprice" value="" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em></td><td><input class="text price" type="text" name="spec[spec_bunch][price]" data_type="price" ds_type="spec_bunch|price" value="" /><em class="add-on"><i class="iconfont">&#xe65c;</i></em></td><td><input class="text stock" type="text" name="spec[spec_bunch][goods_weight]" data_type="goods_weight" ds_type="spec_bunch|goods_weight" value="" /></td><td><input class="text stock" type="text" name="spec[spec_bunch][stock]" data_type="stock" ds_type="spec_bunch|stock" value="" /></td><td><input class="text stock" type="text" name="spec[spec_bunch][alarm]" data_type="alarm" ds_type="spec_bunch|alarm" value="" /></td><td><input class="text sku" type="text" name="spec[spec_bunch][sku]" ds_type="spec_bunch|sku" value="" /></td></tr>';
    sub_str=sub_str.replace(/spec_bunch/g, 'i_'+spec_id_array.sort(function(a,b){return a - b}).join(''));
    str +=sub_str;
}
    //?????????????????????
    
    
    if(str == '<tr>'){
        $('dl[ds_type="spec_dl"]').hide();
        $('input[name="goods_weight"]').removeAttr('readonly').css('background','');
        $('input[name="g_price"]').removeAttr('readonly').css('background','');
        $('input[name="g_storage"]').removeAttr('readonly').css('background','');
    }else{
        $('tbody[ds_type="spec_table"]').empty().html(str)
            .find('input[ds_type]').each(function(){
                s = $(this).attr('ds_type');
                try{$(this).val(E_SPV[s]);}catch(ex){$(this).val('');};
            }).end()
            .find('input[data_type="stock"]').change(function(){
                computeStock();    // ????????????
            }).end()
            .find('input[data_type="goods_weight"]').change(function(){
                computeWeight();    // ????????????
            }).end()
            .find('input[data_type="price"]').change(function(){
                computePrice();     // ????????????
            }).end()
            .find('input[type="text"]').change(function(){
                s = $(this).attr('ds_type');
                V[s] = $(this).val();
            });
    }
});
<?php }?>
</script> 








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
    //?????????
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

