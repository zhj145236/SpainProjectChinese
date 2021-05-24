<?php /*a:3:{s:65:"D:\wwwroot\shops.domibuy.com\app\admin\view\storemoney\index.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <h3><?php echo htmlentities(lang('ds_store_money')); ?></h3>
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
                <dt><?php echo htmlentities(lang('admin_storemoney_membername')); ?></dt>
                <dd><input type="text" name="mname" class="txt" value='<?php echo htmlentities(app('request')->param('mname')); ?>'></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('admin_storemoney_changetime')); ?></dt>
                <dd><input type="text" id="stime" name="stime" class="txt date" value="<?php echo htmlentities(app('request')->param('stime')); ?>" >
                    ~
                    <input type="text" id="etime" name="etime" class="txt date" value="<?php echo htmlentities(app('request')->param('etime')); ?>" >
                </dd>
            </dl>
            
            <div class="btn_group">
                <a href="javascript:document.formSearch.submit();" class="btn " title="<?php echo htmlentities(lang('ds_query')); ?>"><?php echo htmlentities(lang('ds_query')); ?></a>
                <?php if($filtered): ?>
                <a href="<?php echo url('storemoney/index'); ?>" class="btn btn-default" title="<?php echo htmlentities(lang('ds_cancel')); ?>"><?php echo htmlentities(lang('ds_cancel')); ?></a>
                <?php endif; ?>
            </div>
            
        </div>

    </form>

    <table class="ds-default-table">
        <thead>
            <tr class="thead">
                <th><?php echo htmlentities(lang('admin_storemoney_membername')); ?></th>
                <th class="align-center"><?php echo htmlentities(lang('admin_storemoney_changetime')); ?></th>
                <th><?php echo htmlentities(lang('admin_storemoney_pricetype_available')); ?>(<?php echo htmlentities(lang('ds_yuan')); ?>)</th>
                <th><?php echo htmlentities(lang('admin_storemoney_pricetype_freeze')); ?>(<?php echo htmlentities(lang('ds_yuan')); ?>)</th>
                <th><?php echo htmlentities(lang('admin_storemoney_log_desc')); ?></th>
            </tr>
        </thead>
        <tbody>
            <?php if(!(empty($list_log) || (($list_log instanceof \think\Collection || $list_log instanceof \think\Paginator ) && $list_log->isEmpty()))): if(is_array($list_log) || $list_log instanceof \think\Collection || $list_log instanceof \think\Paginator): if( count($list_log)==0 ) : echo "" ;else: foreach($list_log as $k=>$v): ?>
            <tr class="hover">
                <td><?php echo htmlentities($v['store_name']); ?></td>
                <td class="nowarp align-center"><?php if(!(empty($v['storemoneylog_add_time']) || (($v['storemoneylog_add_time'] instanceof \think\Collection || $v['storemoneylog_add_time'] instanceof \think\Paginator ) && $v['storemoneylog_add_time']->isEmpty()))): ?><?php echo htmlentities(date('Y-m-d H:i:s',!is_numeric($v['storemoneylog_add_time'])? strtotime($v['storemoneylog_add_time']) : $v['storemoneylog_add_time'])); ?><?php endif; ?></td>
                <td><?php echo floatval($v['store_avaliable_money']) ? (floatval($v['store_avaliable_money']) > 0 ? '+' : null ).$v['store_avaliable_money'] : null;?></td>
                <td><?php echo floatval($v['store_freeze_money']) ? (floatval($v['store_freeze_money']) > 0 ? '+' : null ).$v['store_freeze_money'] : null;?></td>
                <td><?php echo htmlentities($v['storemoneylog_desc']); ?>
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

</div>

<script language="javascript">
    $(function() {
        $('#stime').datepicker({dateFormat: 'yy-mm-dd'});
        $('#etime').datepicker({dateFormat: 'yy-mm-dd'});
    });
</script>