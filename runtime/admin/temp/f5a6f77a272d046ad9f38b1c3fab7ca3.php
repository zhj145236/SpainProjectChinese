<?php /*a:3:{s:65:"D:\wwwroot\shops.domibuy.com\app\admin\view\storeclass\index.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <h3><?php echo htmlentities(lang('store_class')); ?></h3>
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
  <div class="fixed-empty"></div>
  
  <div class="explanation" id="explanation">
      <div class="title" id="checkZoom">
          <h4 title="<?php echo htmlentities(lang('ds_explanation_tip')); ?>"><?php echo htmlentities(lang('ds_explanation')); ?></h4>
          <span id="explanationZoom" title="<?php echo htmlentities(lang('ds_explanation_close')); ?>" class="arrow"></span>
      </div>
      <ul>
          <li><?php echo htmlentities(lang('store_class_help1')); ?></li>
          <li><?php echo lang('store_class_help2'); ?></li>
      </ul>
  </div>
  
    <table class="ds-default-table">
        <colgroup>
            <col class="w48">
            <col class="w120">
            <col>
            <col class="w200">
            <col class="w200">
        </colgroup>
      <thead>
        <tr class="thead">
          <th><input type="checkbox" class="checkall" id="checkall_1"></th>
          <th><?php echo htmlentities(lang('ds_sort')); ?></th>
          <th><?php echo htmlentities(lang('store_class_name')); ?></th>
          <th class="align-center"><?php echo htmlentities(lang('store_class_bail')); ?>(<?php echo htmlentities(lang('ds_yuan')); ?>)</th>
          <th><?php echo htmlentities(lang('ds_handle')); ?></th>
        </tr>
      </thead>
      <tbody>
        <?php if(!(empty($class_list) || (($class_list instanceof \think\Collection || $class_list instanceof \think\Paginator ) && $class_list->isEmpty()))): if(is_array($class_list) || $class_list instanceof \think\Collection || $class_list instanceof \think\Paginator): if( count($class_list)==0 ) : echo "" ;else: foreach($class_list as $k=>$v): ?>
        <tr class="hover edit" id="ds_row_<?php echo htmlentities($v['storeclass_id']); ?>">
          <td><input type="checkbox" name='check_sc_id[]' value="<?php echo htmlentities($v['storeclass_id']); ?>" class="checkitem"></td>
          <td class="sort"><span title="<?php echo htmlentities(lang('can_edit')); ?>" ajax_branch='store_class_sort' datatype="number" fieldid="<?php echo htmlentities($v['storeclass_id']); ?>" fieldname="storeclass_sort" ds_type="inline_edit" class="editable"><?php echo htmlentities($v['storeclass_sort']); ?></span></td>
          <td class="name">
          	<span title="<?php echo htmlentities(lang('store_class_name')); ?>" required="1" fieldid="<?php echo htmlentities($v['storeclass_id']); ?>" ajax_branch='store_class_name' fieldname="storeclass_name" ds_type="inline_edit" class="node_name editable"><?php echo htmlentities($v['storeclass_name']); ?></span>
          </td>
          <td class="align-center"><?php echo htmlentities($v['storeclass_bail']); ?></td>
          <td>
              <a href="javascript:dsLayerOpen('<?php echo url('Storeclass/store_class_edit',['storeclass_id'=>$v['storeclass_id']]); ?>','<?php echo htmlentities(lang('ds_edit')); ?>-<?php echo htmlentities($v['storeclass_name']); ?>')" class="dsui-btn-edit"><i class="iconfont"></i><?php echo htmlentities(lang('ds_edit')); ?></a>
              <a href="javascript:dsLayerConfirm('<?php echo url('Storeclass/store_class_del',['storeclass_id'=>$v['storeclass_id']]); ?>','<?php echo htmlentities(lang('del_store_class')); ?>',<?php echo htmlentities($v['storeclass_id']); ?>)" class="dsui-btn-del"><i class="iconfont"></i><?php echo htmlentities(lang('ds_del')); ?></a>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; else: ?>
        <tr class="no_data">
          <td colspan="10"><?php echo htmlentities(lang('ds_no_record')); ?></td>
        </tr>
        <?php endif; ?>
      </tbody>
      <tfoot>
        <?php if(!(empty($class_list) || (($class_list instanceof \think\Collection || $class_list instanceof \think\Paginator ) && $class_list->isEmpty()))): ?>
        <tr id="batchAction" >
          <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
          <td colspan="16" id="dataFuncs"><label for="checkallBottom"><?php echo htmlentities(lang('ds_select_all')); ?></label>
            &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn btn-small" onclick="submit_delete_batch()"><span><?php echo htmlentities(lang('ds_del')); ?></span></a>
           </td>
        </tr>
       <?php endif; ?>
      </tfoot>
    </table>
    <?php echo $show_page; ?>
</div>
<script type="text/javascript" src="<?php echo htmlentities(ADMIN_SITE_ROOT); ?>/js/jquery.edit.js" charset="utf-8"></script>
<script type="text/javascript">
    function submit_delete(ids_str){
        _uri = ADMINSITEURL+"/Storeclass/store_class_del.html?storeclass_id=" + ids_str;
        dsLayerConfirm(_uri,'<?php echo htmlentities(lang('ds_ensure_del')); ?>');
    }
</script>