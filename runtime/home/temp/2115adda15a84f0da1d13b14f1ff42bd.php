<?php /*a:1:{s:92:"D:\wwwroot\shops.domibuy.com\app\home\view\default\store\default\goods\goods_consulting.html";i:1612516963;}*/ ?>
<script type="text/javascript">
$(function(){
    $('#consulting_demo').find('.demo').ajaxContent({
        event:'click', //mouseover
        loaderType:"img",
        loadingMsg:"images/transparent.gif",
        target:'#consulting_demo'
    });

    $('#consulting_tab').find('a').ajaxContent({
        event:'click',
        loaderType:'img',
        loadingMsg:'images/transparent.gif',
        target:'#consulting_demo'
    });
});
</script>

<div class="top" style="overflow: hidden;">

  <div class="dss-cosult-askbtn"><a href="<?php echo url('Goods/consulting_list',['goods_id'=>app('request')->param('goods_id')]); ?>"  class="dss-btn dss-btn-red"><?php echo htmlentities(lang('want_questions')); ?></a></div>
</div>
<div class="dss-goods-title-nav">
  <ul id="consulting_tab">
    <li class="<?php if(app('request')->param('ctid') == 0): ?>current<?php endif; ?>"><a href="<?php echo url('Goods/consulting',['goods_id'=>app('request')->param('goods_id'),'store_id'=>app('request')->param('store_id')]); ?>"><?php echo htmlentities(lang('ds_all')); ?></a></li>
    <?php if(!(empty($consult_type) || (($consult_type instanceof \think\Collection || $consult_type instanceof \think\Paginator ) && $consult_type->isEmpty()))): if(is_array($consult_type) || $consult_type instanceof \think\Collection || $consult_type instanceof \think\Paginator): if( count($consult_type)==0 ) : echo "" ;else: foreach($consult_type as $key=>$val): ?>
    <li class="<?php if(app('request')->param('ctid') == $val['consulttype_id']): ?>current<?php endif; ?>"><a href="<?php echo url('Goods/consulting',['goods_id'=>app('request')->param('goods_id'),'ctid'=>$val['consulttype_id'],'store_id'=>app('request')->param('store_id')]); ?>"><?php echo htmlentities($val['consulttype_name']); ?></a></li>
    <?php endforeach; endif; else: echo "" ;endif; ?>
    <?php endif; ?>
  </ul>
</div>
<div class="dss-cosult-main">
  <?php if(!(empty($consult_list) || (($consult_list instanceof \think\Collection || $consult_list instanceof \think\Paginator ) && $consult_list->isEmpty()))): if(is_array($consult_list) || $consult_list instanceof \think\Collection || $consult_list instanceof \think\Paginator): if( count($consult_list)==0 ) : echo "" ;else: foreach($consult_list as $k=>$v): ?>
  <div class="dss-cosult-list">
    <dl class="asker">
      <dt><?php echo htmlentities(lang('consulting_net_friend')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
      <dd>
        <?php if($v['member_id'] == '0'): ?>
        <?php echo htmlentities(lang('ds_guest')); elseif($v['consult_isanonymous'] == '1'): ?>
        <?php echo str_cut($v['member_name'],2); ?>***
        <?php else: ?>
        <a href="javascript:void(0)"  data-param="{'id':<?php echo htmlentities($v['member_id']); ?>}" dstype="mcard"><?php echo str_cut($v['member_name'],8); ?></a>
        <?php endif; ?>
        <time datetime="<?php echo htmlentities(date("Y-m-d H:i:s",!is_numeric($v['consult_addtime'])? strtotime($v['consult_addtime']) : $v['consult_addtime'])); ?>" pubdate="pubdate" class="ml20"><?php echo htmlentities(date("Y-m-d H:i:s",!is_numeric($v['consult_addtime'])? strtotime($v['consult_addtime']) : $v['consult_addtime'])); ?></time>
      </dd>
    </dl>
    <dl class="ask-con">
      <dt><?php echo htmlentities(lang('goods_index_consult_content')); ?><?php echo htmlentities(lang('ds_colon')); ?></dt>
      <dd>
        <p><?php echo nl2br($v['consult_content']); ?></p>
      </dd>
    </dl>
    <?php if(!(empty($v['consult_reply']) || (($v['consult_reply'] instanceof \think\Collection || $v['consult_reply'] instanceof \think\Paginator ) && $v['consult_reply']->isEmpty()))): ?>
    <dl class="reply">
      <dt><?php echo htmlentities(lang('goods_index_seller_reply')); ?></dt>
      <dd>
        <p><?php echo nl2br($v['consult_reply']); ?></p>
        <time datetime="<?php echo htmlentities(date('Y-m-d H:i:s',!is_numeric($v['consult_replytime'])? strtotime($v['consult_replytime']) : $v['consult_replytime'])); ?>" pubdate="pubdate">[<?php echo htmlentities(date("Y-m-d H:i:s",!is_numeric($v['consult_replytime'])? strtotime($v['consult_replytime']) : $v['consult_replytime'])); ?>]</time>
      </dd>
    </dl>
    <?php endif; ?>
  </div>
  
  <?php endforeach; endif; else: echo "" ;endif; ?>
  <div class="more"><a href="<?php echo url('Goods/consulting_list',['goods_id'=>app('request')->param('goods_id')]); ?>"  ><?php echo htmlentities(lang('view_all_inquiries')); ?>>></a></div>
 <?php else: ?>
  <div class="dss-norecord"><?php echo htmlentities(lang('goods_index_no_reply')); ?></div>
 <?php endif; ?>
  
</div>
