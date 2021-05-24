<?php /*a:1:{s:90:"D:\wwwroot\shops.domibuy.com\app\home\view\default\store\default\goods\goods_comments.html";i:1612516963;}*/ ?>
<?php if(!(empty($goodsevallist) || (($goodsevallist instanceof \think\Collection || $goodsevallist instanceof \think\Paginator ) && $goodsevallist->isEmpty()))): if(is_array($goodsevallist) || $goodsevallist instanceof \think\Collection || $goodsevallist instanceof \think\Paginator): if( count($goodsevallist)==0 ) : echo "" ;else: foreach($goodsevallist as $k=>$v): ?>
<div id="t" class="dss-commend-floor">
    <div class="user-avatar">
        <a href="javascript:void(0)"  data-param="{'id':<?php echo htmlentities($v['geval_frommemberid']); ?>}" dstype="mcard"{/if}> 
            <img src="<?php echo get_member_avatar_for_id($v['geval_frommemberid']); ?>">
        </a>
    </div>
  <dl class="detail">
      <dt>
      <span class="user-name">
      <?php if($v['geval_isanonymous'] == 1): ?>
      <?php echo str_cut($v['geval_frommembername'],2); ?>***
      <?php else: ?>
      <a href="javascript:void(0)"  data-param="{'id':<?php echo htmlentities($v['geval_frommemberid']); ?>}" dstype="mcard"><?php echo htmlentities($v['geval_frommembername']); ?></a>
      <?php endif; ?>
      </span>
      <time pubdate="pubdate">[<?php echo @date('Y-m-d',$v['geval_addtime']);?>]</time>
    </dt>
    <dd><?php echo htmlentities(lang('user_rating')); ?>：<span class="raty" data-score="<?php echo htmlentities($v['geval_scores']); ?>"></span></dd>
    <dd class="content"><?php echo htmlentities(lang('evaluation_details')); ?>：<span><?php echo htmlentities($v['geval_content']); ?></span></dd>
    <?php if(!(empty($v['geval_explain']) || (($v['geval_explain'] instanceof \think\Collection || $v['geval_explain'] instanceof \think\Paginator ) && $v['geval_explain']->isEmpty()))): ?>
    <dd class="explain"><?php echo htmlentities(lang('ds_credit_explain')); ?>：<span><?php echo htmlentities($v['geval_explain']); ?></span></dd>
    <?php endif; if(!(empty($v['geval_image']) || (($v['geval_image'] instanceof \think\Collection || $v['geval_image'] instanceof \think\Paginator ) && $v['geval_image']->isEmpty()))): ?>
    <dd>
    <?php echo htmlentities(lang('print_pictures')); ?>：
    <ul class="photos-thumb"><?php $image_array = explode(',', $v['geval_image']);if(is_array($image_array) || $image_array instanceof \think\Collection || $image_array instanceof \think\Paginator): if( count($image_array)==0 ) : echo "" ;else: foreach($image_array as $key=>$value): ?>
        <li>
            <a data-lightbox="lightbox-image"  href="<?php echo sns_thumb($value, 1024); ?>"><img src="<?php echo sns_thumb($value); ?>"></a>
        </li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    </dd>
    <?php endif; ?>
  </dl>
</div>
<?php endforeach; endif; else: echo "" ;endif; ?>
<div class="tr pr5 pb5 pr">
  <a href="<?php echo url('Goods/comments_list',['goods_id'=>app('request')->param('goods_id')]); ?>"  class="more-commend"><?php echo htmlentities(lang('see_all_reviews')); ?>>></a><div class="pagination"></div>
</div>
<?php else: ?>
<div class="dss-norecord"><?php echo htmlentities(lang('no_record')); ?></div>
<?php endif; ?>
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.raty/jquery.raty.min.js"></script>
<link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.lightbox/css/lightbox.min.css">
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.lightbox/js/lightbox.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $('.raty').raty({
        path: "<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.raty/img",
        readOnly: true,
        score: function() {
          return $(this).attr('data-score');
        }
    });

    $('#goodseval').find('.demo').ajaxContent({
        event:'click', //mouseover
        loaderType:"img",
        loadingMsg:"/images/transparent.gif",
        target:'#goodseval'
    });
});
</script> 
