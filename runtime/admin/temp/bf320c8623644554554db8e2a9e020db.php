<?php /*a:3:{s:77:"D:\wwwroot\shops.domibuy.com\app\admin\view\store\bind_class_applay_list.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <dt><?php echo htmlentities(lang('ds_store_name')); ?>ID</dt>
                <dd><input type="text" value="" name="store_id" id="store_id" class="txt"></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('storereopen_state')); ?></dt>
                <dd>
                    <select name="state">
                        <option value=""><?php echo htmlentities(lang('ds_please_choose')); ?>...</option>
                        <option <?php if(app('request')->param('state') == '0'): ?>selected <?php endif; ?> value="0"><?php echo htmlentities(lang('storereopen_state_1')); ?></option>
                        <option <?php if(app('request')->param('state') == '1'): ?>selected <?php endif; ?> value="1"><?php echo htmlentities(lang('storereopen_state_2')); ?></option>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd></dd>
            </dl>
            <div class="btn_group">
                <a href="javascript:document.formSearch.submit();" class="btn " title="<?php echo htmlentities(lang('ds_query')); ?>"><?php echo htmlentities(lang('ds_query')); ?></a>
                <?php if($filtered): ?>
                <a href="<?php echo url('Store/store_bind_class_applay_list'); ?>" class="btn btn-default" title="<?php echo htmlentities(lang('ds_cancel')); ?>"><?php echo htmlentities(lang('ds_cancel')); ?></a>
                <?php endif; ?>
            </div>
        </div>
      
        
    </form>
    
    <div class="explanation" id="explanation">
        <div class="title" id="checkZoom">
            <h4 title="<?php echo htmlentities(lang('ds_explanation_tip')); ?>"><?php echo htmlentities(lang('ds_explanation')); ?></h4>
            <span id="explanationZoom" title="<?php echo htmlentities(lang('ds_explanation_close')); ?>" class="arrow"></span>
        </div>
        <ul>
            <li><?php echo htmlentities(lang('store_bind_class_apply_list_help1')); ?></li>
        </ul>
    </div>
    
    <form method="post" id="store_form" name="store_form">
        <table class="ds-default-table">
            <thead>
            <tr class="thead">
                <th class="align-center" colspan="3"><?php echo htmlentities(lang('store_bind_class')); ?></th>
                <th class="w150"><?php echo htmlentities(lang('ds_store_name')); ?></th>
                <th class="w150"><?php echo htmlentities(lang('store_user_name')); ?></th>
                <th class="w150"><?php echo htmlentities(lang('store_class_commis_rates')); ?></th>
                <th class="align-center w150"><?php echo htmlentities(lang('ds_handle')); ?></th>
            </tr>
            </thead>
            <tbody>
            <?php if(!(empty($bind_list) || (($bind_list instanceof \think\Collection || $bind_list instanceof \think\Paginator ) && $bind_list->isEmpty()))): if(is_array($bind_list) || $bind_list instanceof \think\Collection || $bind_list instanceof \think\Paginator): if( count($bind_list)==0 ) : echo "" ;else: foreach($bind_list as $key=>$v): ?>
            <tr class="hover edit">
                <td><?php echo htmlentities($v['class_1_name']); ?></td>
                <td><?php echo !empty($v['class_2_name']) ? '>'  :  null; ?> <?php echo htmlentities($v['class_2_name']); ?></td>
                <td><?php echo !empty($v['class_3_name']) ? '>'  :  null; ?> <?php echo htmlentities($v['class_3_name']); ?></td>
                <td><?php if(!(empty($bind_store_list[$v['store_id']]) || (($bind_store_list[$v['store_id']] instanceof \think\Collection || $bind_store_list[$v['store_id']] instanceof \think\Paginator ) && $bind_store_list[$v['store_id']]->isEmpty()))): ?><?php echo htmlentities($bind_store_list[$v['store_id']]['store_name']); ?><?php endif; ?>[ID:<?php echo htmlentities($v['store_id']); ?>]</td>
                <td><?php if(!(empty($bind_store_list[$v['store_id']]) || (($bind_store_list[$v['store_id']] instanceof \think\Collection || $bind_store_list[$v['store_id']] instanceof \think\Paginator ) && $bind_store_list[$v['store_id']]->isEmpty()))): ?><?php echo htmlentities($bind_store_list[$v['store_id']]['seller_name']); ?><?php endif; ?></td>
                <td class="w150"><?php echo htmlentities($v['commis_rate']); ?> %</td>
                <td class="w72 align-center">
                    <?php if($v['storebindclass_state'] == '0'): ?>
                    <a href="javascript:dsLayerConfirm('<?php echo url('Store/store_bind_class_applay_check',['bid'=>$v['storebindclass_id'],'store_id'=>$v['store_id']]); ?>','<?php echo htmlentities(lang('store_bind_class_applay_check_confirm')); ?>')"  class="dsui-btn-edit"><i class="iconfont"></i><?php echo htmlentities(lang('ds_verify')); ?></a>
                    <?php endif; ?>
                    <a href="javascript:dsLayerConfirm('<?php echo url('Store/store_bind_class_applay_del',['bid'=>$v['storebindclass_id'],'store_id'=>$v['store_id']]); ?>','<?php echo $v['storebindclass_state']=='1' ? lang('store_bind_class_applay_del_confirm')  :  null; ?><?php echo htmlentities(lang('ds_ensure_del')); ?>')"  class="dsui-btn-del"><i class="iconfont"></i><?php echo htmlentities(lang('ds_del')); ?></a>
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