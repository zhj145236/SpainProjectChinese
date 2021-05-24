<?php /*a:3:{s:72:"D:\wwwroot\shops.domibuy.com\app\admin\view\store\store_reopen_list.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo htmlentities((isset($html_title) && ($html_title !== '')?$html_title:config('ds_config.site_name'))); ?><?php echo htmlentities(lang('system_backend')); ?></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="<?php echo htmlentities(ADMIN_SITE_ROOT); ?>/css/admin.css">
        <link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery-ui.min.css">
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery-2.1.4.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.validate.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.cookie.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/common.js"></script>
        <script src="<?php echo htmlentities(ADMIN_SITE_ROOT); ?>/js/admin.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery-ui.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery-ui/jquery.ui.datepicker-zh-CN.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/perfect-scrollbar.min.js"></script>
        <script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/layer/layer.js"></script>
        <script type="text/javascript">
            var BASESITEROOT = "<?php echo htmlentities(BASE_SITE_ROOT); ?>";
            var ADMINSITEROOT = "<?php echo htmlentities(ADMIN_SITE_ROOT); ?>";
            var BASESITEURL = "<?php echo htmlentities(BASE_SITE_URL); ?>";
            var HOMESITEURL = "<?php echo htmlentities(HOME_SITE_URL); ?>";
            var ADMINSITEURL = "<?php echo htmlentities(ADMIN_SITE_URL); ?>";
        </script>
    </head>
    <body>
        <div id="append_parent"></div>
        <div id="ajaxwaitid"></div>










<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <div class="subject">
                <h3><?php echo htmlentities(lang('ds_store_manage')); ?></h3>
                <h5></h5>
            </div>
            <?php if($admin_item): ?>
<ul class="tab-base ds-row">
    <?php if(is_array($admin_item) || $admin_item instanceof \think\Collection || $admin_item instanceof \think\Paginator): if( count($admin_item)==0 ) : echo "" ;else: foreach($admin_item as $key=>$item): ?>
    <li><a href="<?php echo htmlentities($item['url']); ?>" <?php if($item['name'] == $curitem): ?>class="current"<?php endif; ?>><span><?php echo htmlentities($item['text']); ?></span></a></li>
    <?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<?php endif; ?>
        </div>
    </div>
  <form method="get" name="formSearch">
      <div class="ds-search-form">
            <dl>
                <dt><?php echo htmlentities(lang('ds_store_name')); ?></dt>
                <dd><input type="text" value="<?php echo htmlentities(app('request')->param('store_name')); ?>" name="store_name" id="store_name" class="txt"></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('ds_store_name')); ?>ID</dt>
                <dd><input type="text" value="<?php echo htmlentities(app('request')->param('store_id')); ?>" name="store_id" id="store_id" class="txt"></dd>
            </dl>
          <dl>
              <dt><?php echo htmlentities(lang('storereopen_state')); ?></dt>
              <dd>
                  <select name="storereopen_state">
                      <option value=""><?php echo htmlentities(lang('ds_please_choose')); ?>...</option>
                      <option <?php if(app('request')->param('storereopen_state') == '0'): ?>selected<?php endif; ?> value="0"><?php echo htmlentities(lang('storereopen_state_0')); ?></option>
                      <option <?php if(app('request')->param('storereopen_state') == '1'): ?>selected<?php endif; ?> value="1"><?php echo htmlentities(lang('storereopen_state_1')); ?></option>
                      <option <?php if(app('request')->param('storereopen_state') == '2'): ?>selected<?php endif; ?> value="2"><?php echo htmlentities(lang('storereopen_state_2')); ?></option>
                  </select>
              </dd>
          </dl>
            <div class="btn_group">
                <a href="javascript:document.formSearch.submit();" class="btn " title="<?php echo htmlentities(lang('ds_query')); ?>"><?php echo htmlentities(lang('ds_query')); ?></a>
                <?php if($filtered): ?>
                <a href="<?php echo url('Store/reopen_list'); ?>" class="btn btn-default" title="<?php echo htmlentities(lang('ds_cancel')); ?>"><?php echo htmlentities(lang('ds_cancel')); ?></a>
                <?php endif; ?>
            </div>
        </div>
</form>
  <form method="post" id="store_form" name="store_form">
    <table class="ds-default-table">
      <thead>
        <tr class="thead">
          <th><?php echo htmlentities(lang('ds_store')); ?>/ID</th>
          <th><?php echo htmlentities(lang('storereopen_grade_price')); ?>(<?php echo htmlentities(lang('ds_yuan')); ?>/<?php echo htmlentities(lang('ds_year')); ?>)</th>
          <th><?php echo htmlentities(lang('storereopen_year')); ?>(<?php echo htmlentities(lang('ds_year')); ?>)</th>
          <th><?php echo htmlentities(lang('storereopen_pay_amount')); ?>(<?php echo htmlentities(lang('ds_year')); ?>)</th>
          <th><?php echo htmlentities(lang('storereopen_state')); ?></th>
          <th><?php echo htmlentities(lang('storereopen_pay_cert')); ?></th>
          <th><?php echo htmlentities(lang('storereopen_pay_cert_explain')); ?></th>
          <th><?php echo htmlentities(lang('ds_handle')); ?></th>
        </tr>
      </thead>
      <tbody>
        <?php if(!(empty($reopen_list) || (($reopen_list instanceof \think\Collection || $reopen_list instanceof \think\Paginator ) && $reopen_list->isEmpty()))): if(is_array($reopen_list) || $reopen_list instanceof \think\Collection || $reopen_list instanceof \think\Paginator): if( count($reopen_list)==0 ) : echo "" ;else: foreach($reopen_list as $k=>$val): ?>
        <tr class="hover edit">
          <td><?php echo htmlentities($val['storereopen_store_name']); ?>/<?php echo htmlentities($val['storereopen_store_id']); ?></td>
          <td><?php echo htmlentities($val['storereopen_grade_price']); ?> ( <?php echo htmlentities($val['storereopen_grade_name']); ?> )</td>
          <td><?php echo htmlentities($val['storereopen_year']); ?></td>
          <td><?php if($val['storereopen_pay_amount'] == 0): ?><?php echo htmlentities(lang('storereopen_pay_free')); else: ?><?php echo htmlentities($val['storereopen_pay_amount']); ?><?php endif; ?></td>
          <td><?php echo str_replace(array('0','1','2'),array(lang('storereopen_state_0'),lang('storereopen_state_1'),lang('storereopen_state_2')),$val['storereopen_state']);?></td>
          <td>
          <?php if(!(empty($val['storereopen_pay_cert']) || (($val['storereopen_pay_cert'] instanceof \think\Collection || $val['storereopen_pay_cert'] instanceof \think\Paginator ) && $val['storereopen_pay_cert']->isEmpty()))): ?>
          <a data-lightbox="lightbox-image" href="<?php echo get_store_joinin_imageurl($val['storereopen_pay_cert']); ?>"><?php echo htmlentities(lang('ds_view')); ?></a>
          <?php endif; ?>
          </td>
          <td><?php echo htmlentities($val['storereopen_pay_cert_explain']); ?></td>
          <td>
              <?php if($val['storereopen_state'] == '1'): ?>
              <a href="javascript:dsLayerConfirm('<?php echo url('Store/reopen_check',['storereopen_id'=>$val['storereopen_id']]); ?>','<?php echo htmlentities(lang('storereopen_check_confirm')); ?>')" class="dsui-btn-edit"><i class="iconfont"></i><?php echo htmlentities(lang('ds_verify')); ?></a>
              <?php endif; if($val['storereopen_state'] != '2'): ?>
              <a href="javascript:dsLayerConfirm('<?php echo url('Store/reopen_del',['storereopen_id'=>$val['storereopen_id'],'storereopen_store_id'=>$val['storereopen_store_id']]); ?>','<?php echo htmlentities(lang('ds_ensure_del')); ?>')" class="dsui-btn-del"><i class="iconfont"></i><?php echo htmlentities(lang('ds_del')); ?></a>
              <?php endif; ?>
          </td>
        </tr>
       <?php endforeach; endif; else: echo "" ;endif; else: ?>
        <tr class="no_data">
          <td colspan="10"><?php echo htmlentities(lang('ds_no_record')); ?></td>
        </tr>
        <?php endif; ?>
      </tbody>
    </table>
      <?php echo $show_page; ?>
  </form>
</div>

<link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.lightbox/css/lightbox.min.css">
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.lightbox/js/lightbox.min.js"></script>