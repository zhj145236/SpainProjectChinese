<?php /*a:1:{s:89:"D:\wwwroot\shops.domibuy.com\app\home\view\default\seller\selleralbum\pic_list_goods.html";i:1612516962;}*/ ?>
<div class="goods-gallery add-step2">
    <a class='sample_demo' id="select_submit" href="<?php echo url('Selleralbum/pic_list',['item'=>'goods']); ?>" style="display:none;"><?php echo htmlentities(lang('ds_submit')); ?></a>
    <div class="nav"><span class="l"><?php echo htmlentities(lang('store_goods_album_users')); ?> >
            <?php if(!(empty($class_name) || (($class_name instanceof \think\Collection || $class_name instanceof \think\Paginator ) && $class_name->isEmpty()))): ?>
            <?php echo htmlentities($class_name); else: ?>
            <?php echo htmlentities(lang('store_goods_album_all_photo')); ?>
            <?php endif; ?>
        </span>
        <span class="r">
            <select name="jumpMenu" id="jumpMenu" style="width:100px;">
                <option value="0" style="width:80px;"><?php echo htmlentities(lang('ds_please_choose')); ?></option>
                <?php if(is_array($class_list) || $class_list instanceof \think\Collection || $class_list instanceof \think\Paginator): if( count($class_list)==0 ) : echo "" ;else: foreach($class_list as $key=>$val): ?>
                <option style="width:80px;" value="<?php echo htmlentities($val['aclass_id']); ?>" <?php if($val['aclass_id'] == app('request')->param('id')): ?>selected<?php endif; ?>><?php echo htmlentities($val['aclass_name']); ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
        </span>
    </div>
    <?php if(!(empty($pic_list) || (($pic_list instanceof \think\Collection || $pic_list instanceof \think\Paginator ) && $pic_list->isEmpty()))): ?>
    <ul class="list">
        <?php if(is_array($pic_list) || $pic_list instanceof \think\Collection || $pic_list instanceof \think\Paginator): if( count($pic_list)==0 ) : echo "" ;else: foreach($pic_list as $key=>$v): ?>
        <li onclick="insert_img('<?php echo htmlentities($v['apic_cover']); ?>', '<?php echo goods_thumb($v, 240); ?>');">
            <a href="JavaScript:void(0);"><img src="<?php echo goods_thumb($v, 240); ?>" /></a>
        </li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <?php else: ?>
    <div class="warning-option"><i class="iconfont">&#xe64c;</i><span><?php echo htmlentities(lang('store_picture_no_album')); ?></span></div>
    <?php endif; ?>
    <div class="pagination"><?php echo $show_page; ?></div>
</div>
<script>
$(document).ready(function(){
	$('ul.pagination li a').ajaxContent({
		event:'click', //mouseover
		loaderType:'img',
		loadingMsg:'<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/loading.gif',
		target:'#demo'
	});
	$('#jumpMenu').change(function(){
		$('#select_submit').attr('href',$('#select_submit').attr('href')+"&id="+$('#jumpMenu').val());
		$('.sample_demo').ajaxContent({
			event:'click', //mouseover
			loaderType:'img',
			loadingMsg:'<?php echo htmlentities(HOME_SITE_ROOT); ?>/images/loading.gif',
			target:'#demo'
		});
		$('#select_submit').click();
	});
});
</script>