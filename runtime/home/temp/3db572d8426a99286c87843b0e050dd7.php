<?php /*a:1:{s:89:"D:\wwwroot\shops.domibuy.com\app\home\view\default\store\default\goods\goods_salelog.html";i:1612516963;}*/ ?>
<script type="text/javascript">
    $(document).ready(function () {
        $('#salelog_demo').find('ul.pagination li a').ajaxContent({
            event: 'click', //mouseover
            loaderType: "img",
            loadingMsg: "images/transparent.gif",
            target: '#salelog_demo'
        });

    });
</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mt10">
    <thead>
        <tr>
            <th class="w200"><?php echo htmlentities(lang('goods_index_buyer')); ?></th>
            <th class="w100"><?php echo htmlentities(lang('goods_index_buy_price')); ?></th>
            <th class=""><?php echo htmlentities(lang('goods_index_buy_amount')); ?></th>
            <th class="w200"><?php echo htmlentities(lang('goods_index_buy_time')); ?></th>
        </tr>
    </thead>
    <?php if(!(empty($sales) || (($sales instanceof \think\Collection || $sales instanceof \think\Paginator ) && $sales->isEmpty()))): ?>
    <tbody>
        <?php if(is_array($sales) || $sales instanceof \think\Collection || $sales instanceof \think\Paginator): if( count($sales)==0 ) : echo "" ;else: foreach($sales as $key=>$sale): ?>
        <tr>
            <td><a href="javascript:void(0)"  data-param="{'id':<?php echo htmlentities($sale['buyer_id']); ?>}" dstype="mcard"><?php echo str_cut($sale['buyer_name'],2); ?>***</a></td>
            <td><em class="price"><?php echo htmlentities(lang('currency')); ?><?php echo htmlentities($sale['goods_price']); ?></em> <?php if(isset($order_type[$sale['goods_type']])): ?><i style="color:red;"><?php echo htmlentities($order_type[$sale['goods_type']]); ?></i><?php endif; ?></td>
            <td><?php echo htmlentities($sale['goods_num']); ?></td>
            <td><time><?php echo date('Y-m-d H:i:s',$sale['add_time']); ?></time></td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="10" class="tr" ><div class="pagination"> <?php echo $show_page; ?> </div></td>
        </tr>
    </tfoot>
    <?php else: ?>
    <tbody>
        <tr>
            <td colspan="10" class="dss-norecord"><?php echo htmlentities(lang('no_record')); ?></td>
        </tr>
    </tbody>
    <?php endif; ?>
</table>
