<?php /*a:3:{s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\article\index.html";i:1612516957;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;s:67:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\admin_items.html";i:1612516958;}*/ ?>
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
                <h3><?php echo htmlentities(lang('ds_article')); ?></h3>
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
    
    <form method="get" name="formSearch" id="formSearch">
        <div class="ds-search-form">
            <dl>
                <dt><?php echo htmlentities(lang('article_title')); ?></dt>
                <dd><input type="text" value="<?php echo htmlentities(app('request')->param('search_title')); ?>" name="search_title" class="txt"></dd>
            </dl>
            <dl>
                <dt><?php echo htmlentities(lang('ds_articleclass')); ?></dt>
                <dd>
                    <select name="search_ac_id">
                        <option value=""><?php echo htmlentities(lang('ds_please_choose')); ?>...</option>
                        <?php if(is_array($parent_list) || $parent_list instanceof \think\Collection || $parent_list instanceof \think\Paginator): if( count($parent_list)==0 ) : echo "" ;else: foreach($parent_list as $k=>$v): ?>
                        <option value="<?php echo htmlentities($v['ac_id']); ?>" <?php if(app('request')->param('search_ac_id') == $v['ac_id']): ?>selected<?php endif; ?>><?php echo $v['ac_name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </dd>
            </dl>
            <div class="btn_group">
                <input type="submit" class="btn" value="<?php echo htmlentities(lang('ds_search')); ?>">
                <?php if($filtered): ?>
                <a href="<?php echo url('Article/index'); ?>" class="btn btn-default" title="<?php echo htmlentities(lang('ds_cancel')); ?>"><?php echo htmlentities(lang('ds_cancel')); ?></a>
                <?php endif; ?>
            </div>
        </div>
    </form>
    
    <table class="ds-default-table">
        <thead>
            <tr>
                <th><?php echo htmlentities(lang('article_sort')); ?></th>
                <th><?php echo htmlentities(lang('article_id')); ?></th>
                <th><?php echo htmlentities(lang('article_title')); ?></th>
                <th><?php echo htmlentities(lang('article_cate')); ?></th>
                <th><?php echo htmlentities(lang('article_show')); ?></th>
                <th><?php echo htmlentities(lang('article_time')); ?></th>
                <th><?php echo htmlentities(lang('ds_handle')); ?></th>
            </tr>
        </thead>
        <tbody>
            <?php if(!(empty($article_list) || (($article_list instanceof \think\Collection || $article_list instanceof \think\Paginator ) && $article_list->isEmpty()))): if(is_array($article_list) || $article_list instanceof \think\Collection || $article_list instanceof \think\Paginator): if( count($article_list)==0 ) : echo "" ;else: foreach($article_list as $key=>$article): ?>
            <tr id="ds_row_<?php echo htmlentities($article['article_id']); ?>">
                <td><?php echo htmlentities($article['article_sort']); ?></td>
                <td><?php echo htmlentities($article['article_id']); ?></td>
                <td><?php echo htmlentities($article['article_title']); ?></td>
                <td><?php echo htmlentities((isset($article['ac_name']) && ($article['ac_name'] !== '')?$article['ac_name']:'')); ?></td>
                <td><?php if($article['article_show'] == '1'): ?><?php echo htmlentities(lang('ds_yes')); else: ?><?php echo htmlentities(lang('ds_no')); ?><?php endif; ?></td>
                <td><?php echo htmlentities($article['article_time']); ?></td>
                <td>
                    <a href="<?php echo url('Article/edit',['article_id'=>$article['article_id']]); ?>" class="dsui-btn-edit"><i class="iconfont"></i><?php echo htmlentities(lang('ds_edit')); ?></a>
                    <a href="javascript:dsLayerConfirm('<?php echo url('Article/drop',['article_id'=>$article['article_id']]); ?>','<?php echo htmlentities(lang('ds_ensure_del')); ?>',<?php echo htmlentities($article['article_id']); ?>)"  class="dsui-btn-del"><i class="iconfont"></i><?php echo htmlentities(lang('ds_del')); ?></a>
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