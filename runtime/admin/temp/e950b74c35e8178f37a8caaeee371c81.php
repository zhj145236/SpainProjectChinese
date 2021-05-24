<?php /*a:3:{s:65:"D:\wwwroot\shops.domibuy.com\app\admin\view\storegrade\index.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <h3><?php echo htmlentities(lang('ds_storegrade')); ?></h3>
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
    <form method="post" name="formSearch">
        <div class="ds-search-form">
            <dl>
                <dt><?php echo htmlentities(lang('store_grade_name')); ?></dt>
                <dd><input type="text" value="<?php echo htmlentities((isset($like_storegrade_name) && ($like_storegrade_name !== '')?$like_storegrade_name:'')); ?>" name="like_storegrade_name" id="like_storegrade_name" class="txt"></dd>
            </dl>
            <dl>
                <dt></dt>
                <dd></dd>
            </dl>
            <div class="btn_group">
                <a href="javascript:document.formSearch.submit();" class="btn " title="<?php echo htmlentities(lang('ds_query')); ?>"><?php echo htmlentities(lang('ds_query')); ?></a>
                <?php if(!(empty($like_storegrade_name) || (($like_storegrade_name instanceof \think\Collection || $like_storegrade_name instanceof \think\Paginator ) && $like_storegrade_name->isEmpty()))): ?>
                <a class="btn btn-small " href="<?php echo url('Storegrade/index'); ?>" title="<?php echo htmlentities(lang('cancel_search')); ?>"><span><?php echo htmlentities(lang('cancel_search')); ?></span></a>
                <?php endif; ?>
            </div>
        </div>
    </form>

    <table class="ds-default-table">
        <thead>
            <tr>
                <th><?php echo htmlentities(lang('storegrade_sort')); ?></th>
                <th><?php echo htmlentities(lang('storegrade_name')); ?></th>
                <th><?php echo htmlentities(lang('storegrade_goods_limit')); ?></th>
                <th><?php echo htmlentities(lang('storegrade_album_limit')); ?></th>
                <th><?php echo htmlentities(lang('storegrade_template_number')); ?></th>
                <th><?php echo htmlentities(lang('storegrade_price')); ?></th>
                <th><?php echo htmlentities(lang('ds_handle')); ?></th>
            </tr>
        </thead>
        <tbody>
            <?php if(!(empty($storegrade_list) || (($storegrade_list instanceof \think\Collection || $storegrade_list instanceof \think\Paginator ) && $storegrade_list->isEmpty()))): if(is_array($storegrade_list) || $storegrade_list instanceof \think\Collection || $storegrade_list instanceof \think\Paginator): if( count($storegrade_list)==0 ) : echo "" ;else: foreach($storegrade_list as $key=>$storegrade): ?>
            <tr id="ds_row_<?php echo htmlentities($storegrade['storegrade_id']); ?>">
                <td><?php echo htmlentities($storegrade['storegrade_sort']); ?></td>
                <td><?php echo htmlentities($storegrade['storegrade_name']); ?></td>
                <td><?php echo htmlentities($storegrade['storegrade_goods_limit']); ?></td>
                <td><?php echo htmlentities($storegrade['storegrade_album_limit']); ?></td>
                <td><?php echo htmlentities($storegrade['storegrade_template_number']); ?></td>
                <td><?php echo htmlentities($storegrade['storegrade_price']); ?><?php echo htmlentities(lang('ds_yuan')); ?>/<?php echo htmlentities(lang('ds_year')); ?></td>
                <td>
                    <a href="javascript:dsLayerOpen('<?php echo url('Storegrade/edit',['storegrade_id'=>$storegrade['storegrade_id']]); ?>','<?php echo htmlentities(lang('ds_edit')); ?>-<?php echo htmlentities($storegrade['storegrade_name']); ?>')" class="dsui-btn-edit"><i class="iconfont"></i><?php echo htmlentities(lang('ds_edit')); ?></a>
                    <a href="javascript:dsLayerConfirm('<?php echo url('Storegrade/drop',['storegrade_id'=>$storegrade['storegrade_id']]); ?>','<?php echo htmlentities(lang('storegrade_drop_confrim')); ?>',<?php echo htmlentities($storegrade['storegrade_id']); ?>)" class="dsui-btn-del"><i class="iconfont"></i><?php echo htmlentities(lang('ds_del')); ?></a>
                </td>
            </tr>
            <?php endforeach; endif; else: echo "" ;endif; else: ?>
            <tr class="no_data">
                <td colspan="20"><?php echo htmlentities(lang('no_record')); ?></td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>