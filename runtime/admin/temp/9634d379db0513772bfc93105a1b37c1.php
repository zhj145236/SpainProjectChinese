<?php /*a:3:{s:64:"D:\wwwroot\shops.domibuy.com\app\admin\view\storehelp\index.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <h3><?php echo htmlentities(lang('ds_storehelp')); ?></h3>
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

    <form method="get" action="" name="formSearch" id="formSearch">
        <div class="ds-search-form">
            <dl>
                <dt><?php echo htmlentities(lang('help_title')); ?></dt>
                <dd><input type="text" class="text" name="key" value="<?php echo htmlentities(app('request')->get('key')); ?>" /></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('helptype_id')); ?></dt>
                <dd>
                    <select name="helptype_id" id="helptype_id">
                        <option value=""><?php echo htmlentities(lang('ds_please_choose')); ?>...</option>
                        <?php if(!(empty($helptype_list) || (($helptype_list instanceof \think\Collection || $helptype_list instanceof \think\Paginator ) && $helptype_list->isEmpty()))): if(is_array($helptype_list) || $helptype_list instanceof \think\Collection || $helptype_list instanceof \think\Paginator): if( count($helptype_list)==0 ) : echo "" ;else: foreach($helptype_list as $key=>$val): ?>
                        <option <?php if($val['helptype_id']==app('request')->get('helptype_id')): ?>selected=selected<?php endif; ?> value="<?php echo htmlentities($val['helptype_id']); ?>"><?php echo htmlentities($val['helptype_name']); ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        <?php endif; ?>
                    </select>
                </dd>
            </dl>
            <div class="btn_group">
                <a href="javascript:document.formSearch.submit();" class="btn " title="<?php echo htmlentities(lang('ds_query')); ?>"><?php echo htmlentities(lang('ds_query')); ?></a>
                <a href="<?php echo url('Storehelp/index'); ?>" class="btn btn-default" title="<?php echo htmlentities(lang('ds_cancel')); ?>"><?php echo htmlentities(lang('ds_cancel')); ?></a>
            </div>
        </div>
        

    </form>
    
    <div class="explanation" id="explanation">
        <div class="title" id="checkZoom">
            <h4 title="<?php echo htmlentities(lang('ds_explanation_tip')); ?>"><?php echo htmlentities(lang('ds_explanation')); ?></h4>
            <span id="explanationZoom" title="<?php echo htmlentities(lang('ds_explanation_close')); ?>" class="arrow"></span>
        </div>
        <ul>
            <li><?php echo htmlentities(lang('storehelp_index_help1')); ?></li>
        </ul>
    </div>

    <table class="ds-default-table">
        <thead>
        <tr class="thead">
            <th><?php echo htmlentities(lang('ds_sort')); ?></th>
            <th><?php echo htmlentities(lang('help_title')); ?></th>
            <th><?php echo htmlentities(lang('helptype_id')); ?></th>
            <th class="align-center"><?php echo htmlentities(lang('help_updatetime')); ?></th>
            <th class="align-center"><?php echo htmlentities(lang('ds_handle')); ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if(!(empty($help_list) || (($help_list instanceof \think\Collection || $help_list instanceof \think\Paginator ) && $help_list->isEmpty()))): if(is_array($help_list) || $help_list instanceof \think\Collection || $help_list instanceof \think\Paginator): if( count($help_list)==0 ) : echo "" ;else: foreach($help_list as $key=>$val): ?>
        <tr class="hover" id="ds_row_<?php echo htmlentities($val['help_id']); ?>">
            <td class="w48 sort"><?php echo htmlentities($val['help_sort']); ?></td>
            <td><?php echo htmlentities($val['help_title']); ?></td>
            <td><?php echo htmlentities($val['helptype_name']); ?></td>
            <td class="w150 align-center"><?php echo htmlentities(date("Y-m-d H:i:s",!is_numeric($val['help_updatetime'])? strtotime($val['help_updatetime']) : $val['help_updatetime'])); ?></td>
            <td class="w150 align-center">
                <a href="<?php echo url('Storehelp/edit_help',['help_id'=>$val['help_id']]); ?>" class="dsui-btn-edit"><i class="iconfont"></i><?php echo htmlentities(lang('ds_edit')); ?></a>
                <a href="javascript:dsLayerConfirm('<?php echo url('Storehelp/del_help',['help_id'=>$val['help_id']]); ?>','<?php echo htmlentities(lang('ds_ensure_del')); ?>',<?php echo htmlentities($val['help_id']); ?>)" class="dsui-btn-del"><i class="iconfont"></i><?php echo htmlentities(lang('ds_del')); ?></a>
            </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; else: ?>
        <tr class="no_data">
            <td colspan="15"><?php echo htmlentities(lang('ds_no_record')); ?></td>
        </tr>
       <?php endif; ?>
        </tbody>
    </table>
    <?php if(!(empty($help_list) || (($help_list instanceof \think\Collection || $help_list instanceof \think\Paginator ) && $help_list->isEmpty()))): ?>
    <?php echo $show_page; ?>
    <?php endif; ?>
</div>

