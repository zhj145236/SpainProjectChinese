<?php /*a:3:{s:68:"D:\wwwroot\shops.domibuy.com\app\admin\view\storesnstrace\index.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <h3><?php echo htmlentities(lang('ds_storesnstrace')); ?></h3>
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
                <dd><input type="text" value="<?php echo htmlentities(app('request')->get('search_sname')); ?>" name="search_sname" id="search_sname" class="txt"></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('admin_snstrace_title')); ?></dt>
                <dd><input type="text" value="<?php echo htmlentities(app('request')->get('search_stitle')); ?>" name="search_stitle" id="search_stitle" class="txt"></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('admin_snstrace_content')); ?></dt>
                <dd><input type="text" value="<?php echo htmlentities(app('request')->get('search_scontent')); ?>" name="search_scontent" id="search_scontent" class="txt"></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('store_sns_trace_type')); ?></dt>
                <dd>
                    <select name="search_type">
                        <option value=''><?php echo htmlentities(lang('ds_please_choose')); ?>...</option>
                        <option value="2" <?php echo app('request')->get('search_type')=='2'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_normal')); ?></option>
                        <option value="3" <?php echo app('request')->get('search_type')=='3'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_new_selease')); ?></option>
                        <option value="4" <?php echo app('request')->get('search_type')=='4'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_coupon')); ?></option>
                        <option value="5" <?php echo app('request')->get('search_type')=='5'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_xianshi')); ?></option>
                        <option value="6" <?php echo app('request')->get('search_type')=='6'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_mansong')); ?></option>
                        <option value="7" <?php echo app('request')->get('search_type')=='7'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_bundling')); ?></option>
                        <option value="8" <?php echo app('request')->get('search_type')=='8'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_groupbuy')); ?></option>
                        <option value="9" <?php echo app('request')->get('search_type')=='9'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_recommend')); ?></option>
                        <option value="10" <?php echo app('request')->get('search_type')=='10'?'selected="selected"':''; ?>><?php echo htmlentities(lang('store_sns_hotsell')); ?></option>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('admin_snstrace_addtime')); ?></dt>
                <dd>
                    <input type="text" class="txt date" value="<?php echo htmlentities(app('request')->get('search_stime')); ?>" name="search_stime" id="search_stime" class="txt">
                    ~
                    <input type="text" class="txt date" value="<?php echo htmlentities(app('request')->get('search_etime')); ?>" name="search_etime" id="search_etime" class="txt">
                </dd>
            </dl>
            <div class="btn_group">
                <a href="javascript:document.formSearch.submit();" class="btn" title="<?php echo htmlentities(lang('ds_query')); ?>"><?php echo htmlentities(lang('ds_query')); ?></a>
                <a href="<?php echo url('Storesnstrace/index'); ?>" class="btn btn-default" title="<?php echo htmlentities(lang('ds_cancel')); ?>"><?php echo htmlentities(lang('ds_cancel')); ?></a>
            </div>
        </div>
    </form>
    <div class="explanation" id="explanation">
        <div class="title" id="checkZoom">
            <h4 title="<?php echo htmlentities(lang('ds_explanation_tip')); ?>"><?php echo htmlentities(lang('ds_explanation')); ?></h4>
            <span id="explanationZoom" title="<?php echo htmlentities(lang('ds_explanation_close')); ?>" class="arrow"></span>
        </div>
        <ul>
            <li><?php echo htmlentities(lang('admin_snstrace_tracelisttip1')); ?></li>
            <li><?php echo htmlentities(lang('admin_snstrace_tracelisttip2')); ?></li>
        </ul>
    </div>

    
        <table class="ds-default-table">
            <tbody>
                <?php if(!(empty($storetrace_list) || (($storetrace_list instanceof \think\Collection || $storetrace_list instanceof \think\Paginator ) && $storetrace_list->isEmpty()))): if(is_array($storetrace_list) || $storetrace_list instanceof \think\Collection || $storetrace_list instanceof \think\Paginator): if( count($storetrace_list)==0 ) : echo "" ;else: foreach($storetrace_list as $key=>$v): ?>
                <tr class="hover edit">
                    <td style="vertical-align:top;"><input type="checkbox" name="st_id[]" value="<?php echo htmlentities($v['stracelog_id']); ?>" class="checkitem"></td>
                    <td class="fd-list">
                        <!-- 动态列表start -->
                    <li>
                        <div class="fd-aside">
                            <span class="thumb size60">
                                <a href="<?php echo url('home/Storesnshome/index',['sid'=>$v['stracelog_storeid']]); ?>" >
                                    <img onload="javascript:ResizeImage(this,60,60);" src="<?php echo get_store_logo($v['stracelog_storelogo']); ?>">
                                </a>
                            </span>
                        </div>
                        <dl class="fd-wrap">
                            <dt>
                                <h3><a href="<?php echo url('home/Storesnshome/index',['sid'=>$v['stracelog_storeid']]); ?>" ><?php echo htmlentities($v['stracelog_storename']); ?></a><?php echo htmlentities(lang('ds_colon')); ?></h3>
                                <h5><?php echo parsesmiles($v['stracelog_title']); ?></h5>
                            </dt>
                            <dd>
                                <?php echo parsesmiles($v['stracelog_content']); ?>
                            </dd>
                            <dd>
                                <span class="fc-time fl"><?php echo date('Y-m-d H:i',$v['stracelog_time']); ?></span>
                                <span class="fr"><?php echo htmlentities(lang('admin_snstrace_forward')); ?>&nbsp;|&nbsp;
                                    <a href="<?php echo url('Storesnstrace/storecomment_list',['st_id'=>$v['stracelog_id']]); ?>"><?php echo htmlentities(lang('admin_snstrace_comment')); ?><?php echo $v['stracelog_comment']>0 ? ($v['stracelog_comment']) : ''; ?></a>
                                </span>&nbsp;&nbsp;
                                <?php echo htmlentities(lang('admin_snstrace_state')); ?><?php echo htmlentities(lang('ds_colon')); if($v['stracelog_state'] ==0): ?><font style='color:red;'><?php echo htmlentities(lang('admin_snstrace_statehide')); ?></font><?php else: ?><?php echo htmlentities(lang('admin_snstrace_stateshow')); ?><?php endif; ?></span>
                            </dd>
                            <div class="clear"></div>
                        </dl>
                    </li>
                    <!-- 动态列表end -->
                    </td>
                </tr>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            <tfoot>
                <tr class="tfoot">
                    <td class="w24"><input type="checkbox" class="checkall" id="checkallBottom"></td>
                    <td colspan="16"><label for="checkallBottom"><?php echo htmlentities(lang('ds_select_all')); ?></label>
                        &nbsp;&nbsp; <a href="JavaScript:void(0);" class="btn btn-small" onclick="submit_delete_batch();"><span><?php echo htmlentities(lang('ds_del')); ?></span></a>
                        <a href="JavaScript:void(0);" class="btn btn-small" onclick="submit_edit_batch('hide');"><span><?php echo htmlentities(lang('admin_snstrace_statehide')); ?></span></a>
                        <a href="JavaScript:void(0);" class="btn btn-small" onclick="submit_edit_batch('show');"><span><?php echo htmlentities(lang('admin_snstrace_stateshow')); ?></span></a>
                    </td>
                </tr>
            </tfoot>
            <?php else: ?>
            <tr class="no_data">
                <td colspan="15"><?php echo htmlentities(lang('ds_no_record')); ?></td>
            </tr>
            <?php endif; ?>
            </tbody>
        </table>
        <?php echo $show_page; ?>

</div>

<script type="text/javascript">
    $(function(){
        $('#search_stime').datepicker({dateFormat: 'yy-mm-dd'});
        $('#search_etime').datepicker({dateFormat: 'yy-mm-dd'});
    });
    //批量修改
    function submit_edit_batch(type) {
        /* 获取选中的项 */
        var items = '';
        $('.checkitem:checked').each(function () {
            items += this.value + ',';
        });
        if (items != '') {
            items = items.substr(0, (items.length - 1));
            submit_edit(items,type);
        }else{
            layer.alert('<?php echo htmlentities(lang('admin_snstrace_pleasechoose_del')); ?>', {icon: 2})  
        }
    }
    function submit_edit(ids_str,type){
        _uri = ADMINSITEURL+"/Storesnstrace/strace_edit.html?st_id=" + ids_str+"&type="+type;
        dsLayerConfirm(_uri,'<?php echo htmlentities(lang('ds_ensure_operation')); ?>');
    }
    function submit_delete(ids_str){
        _uri = ADMINSITEURL+"/Storesnstrace/strace_del.html?st_id=" + ids_str;
        dsLayerConfirm(_uri,'<?php echo htmlentities(lang('ds_ensure_del')); ?>');
    }
</script>