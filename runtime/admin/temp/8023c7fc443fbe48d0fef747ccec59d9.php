<?php /*a:2:{s:74:"D:\wwwroot\shops.domibuy.com\app\admin\view\store\store_joinin_detail.html";i:1612516958;s:62:"D:\wwwroot\shops.domibuy.com\app\admin\view\public\header.html";i:1612516958;}*/ ?>
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
    <?php if($joinin_detail['store_type'] != 1): ?>
    <table border="0" cellpadding="0" cellspacing="0" class="ds-default-table">
       <thead>
           <tr>
               <th colspan="20"><?php echo htmlentities(lang('company_contact_information')); ?></th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th class="w150"><?php echo htmlentities(lang('company_name')); ?>：</th>
               <td colspan="20"><?php echo htmlentities($joinin_detail['company_name']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('company_location')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['company_address']); ?></td>
               <th><?php echo htmlentities(lang('company_address')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['company_address_detail']); ?></td>
               <th><?php echo htmlentities(lang('registered_capital')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['company_registered_capital']); ?>&nbsp;<?php echo htmlentities(lang('ten_thousand')); ?><?php echo htmlentities(lang('ds_yuan')); ?> </td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('contact_name')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['contacts_name']); ?></td>
               <th><?php echo htmlentities(lang('contact_number')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['contacts_phone']); ?></td>
               <th><?php echo htmlentities(lang('e_mail')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['contacts_email']); ?></td>
           </tr>
       </tbody>
   </table>
   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
       <thead>
           <tr>
               <th colspan="20"><?php echo htmlentities(lang('business_license_information')); ?></th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th class="w150"><?php echo htmlentities(lang('business_license_number')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['business_licence_number']); ?></td></tr><tr>

               <th><?php echo htmlentities(lang('place_business_license')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['business_licence_address']); ?></td></tr><tr>

               <th><?php echo htmlentities(lang('validity_business_license')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['business_licence_start']); ?> - <?php echo htmlentities($joinin_detail['business_licence_end']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('legal_scope_business')); ?>：</th>
               <td colspan="20"><?php echo htmlentities($joinin_detail['business_sphere']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('business_license')); ?><br /><?php echo htmlentities(lang('electronic_version')); ?>：</th>
               <td colspan="20">
                   <?php if(!(empty($joinin_detail['business_licence_number_electronic']) || (($joinin_detail['business_licence_number_electronic'] instanceof \think\Collection || $joinin_detail['business_licence_number_electronic'] instanceof \think\Paginator ) && $joinin_detail['business_licence_number_electronic']->isEmpty()))): ?>
                   <a data-lightbox="lightbox-image"  href="<?php echo get_store_joinin_imageurl($joinin_detail['business_licence_number_electronic']); ?>">
                       <img src="<?php echo get_store_joinin_imageurl($joinin_detail['business_licence_number_electronic']); ?>" alt="" height="200"/>
                   </a>
                   <?php endif; ?>
               </td>
           </tr>
       </tbody>
   </table>
  

   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
       <thead>
           <tr>
               <th colspan="20"><?php echo htmlentities(lang('bank_information')); ?>：</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th class="w150"><?php echo htmlentities(lang('bank_name')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['bank_account_name']); ?></td>
           </tr><tr>
               <th><?php echo htmlentities(lang('company_bank_account')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['bank_account_number']); ?></td></tr>
           <tr>
               <th><?php echo htmlentities(lang('name_branch_bank')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['bank_name']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('location_bank_account')); ?>：</th>
               <td colspan="20"><?php echo htmlentities($joinin_detail['bank_address']); ?></td>
           </tr>
       </tbody>
   </table>
   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
       <thead>
           <tr>
               <th colspan="20"><?php echo htmlentities(lang('settlement_account_information')); ?>：</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th class="w150"><?php echo htmlentities(lang('name_branch_bank')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['settlement_bank_account_name']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('company_bank_account')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['settlement_bank_account_number']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('name_branch_bank')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['settlement_bank_name']); ?></td>
           </tr>

           <tr>
               <th><?php echo htmlentities(lang('location_bank_account')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['settlement_bank_address']); ?></td>
           </tr>
       </tbody>
   </table>

   <?php else: ?>
   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
       <thead>
           <tr>
               <th colspan="6"><?php echo htmlentities(lang('store_and_contact_info')); ?></th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th><?php echo htmlentities(lang('company_name')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['company_name']); ?></td>
               <th><?php echo htmlentities(lang('company_location')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['company_address']); ?></td>
               <th><?php echo htmlentities(lang('company_address')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['company_address_detail']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('contact_name')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['contacts_name']); ?></td>
               <th><?php echo htmlentities(lang('contact_number')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['contacts_phone']); ?></td>
               <th><?php echo htmlentities(lang('e_mail')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['contacts_email']); ?></td>
           </tr>
       </tbody>
   </table>
   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
       <thead>
           <tr>
               <th colspan="20"><?php echo htmlentities(lang('identification_information')); ?></th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th class="w150"><?php echo htmlentities(lang('identification_number')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['business_licence_number']); ?></td></tr><tr>

           </tr>

           <tr>
               <th><?php echo htmlentities(lang('identification_photo')); ?>：</th>
               <td colspan="20">
                   <?php if(!(empty($joinin_detail['business_licence_number_electronic']) || (($joinin_detail['business_licence_number_electronic'] instanceof \think\Collection || $joinin_detail['business_licence_number_electronic'] instanceof \think\Paginator ) && $joinin_detail['business_licence_number_electronic']->isEmpty()))): ?>
                   <a data-lightbox="lightbox-image"  href="<?php echo get_store_joinin_imageurl($joinin_detail['business_licence_number_electronic']); ?>">
                       <img src="<?php echo get_store_joinin_imageurl($joinin_detail['business_licence_number_electronic']); ?>" alt="" height="200"/>
                   </a>
                   <?php endif; ?>
               </td>
           </tr>
       </tbody>
   </table>


   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
       <thead>
           <tr>
               <th colspan="2"><?php echo htmlentities(lang('store_alipay_info')); ?>：</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th><?php echo htmlentities(lang('store_alipay_account_name')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['settlement_bank_account_name']); ?></td>
           </tr>
           <tr>
               <th><?php echo htmlentities(lang('store_alipay_account_number')); ?>：</th>
               <td><?php echo htmlentities($joinin_detail['settlement_bank_account_number']); ?></td>
           </tr>
       </tbody>
   </table>
   <?php endif; ?>
  <form id="form_store_verify" action="<?php echo url('Store/store_joinin_verify'); ?>" method="post">
    <input id="verify_type" name="verify_type" type="hidden" />
    <input name="member_id" type="hidden" value="<?php echo htmlentities($joinin_detail['member_id']); ?>" />
    <table border="0" cellpadding="0" cellspacing="0" class="store-joinin ds-default-table">
      <thead>
        <tr>
          <th colspan="20"><?php echo htmlentities(lang('store_operation_info')); ?></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th class="w150"><?php echo htmlentities(lang('ds_seller_name')); ?>：</th>
          <td><?php echo htmlentities($joinin_detail['seller_name']); ?></td>
        </tr>
        <tr>
          <th class="w150"><?php echo htmlentities(lang('ds_store_name')); ?>：</th>
          <td><?php echo htmlentities($joinin_detail['store_name']); ?></td>
        </tr>
        <tr>
          <th><?php echo htmlentities(lang('ds_storegrade')); ?>：</th>
          <td><?php echo htmlentities($joinin_detail['storegrade_name']); ?>（<?php echo htmlentities(lang('storegrade_price')); ?>：<?php echo htmlentities((isset($joinin_detail['storegrade_price']) && ($joinin_detail['storegrade_price'] !== '')?$joinin_detail['storegrade_price']:"0")); ?><?php echo htmlentities(lang('ds_yuan')); ?>/<?php echo htmlentities(lang('ds_year')); ?>）</td>
        </tr>
        <tr>
          <th class="w150"><?php echo htmlentities(lang('joinin_year')); ?>：</th>
          <td><?php echo htmlentities($joinin_detail['joinin_year']); ?> <?php echo htmlentities(lang('ds_year')); ?></td>
        </tr>
        <tr>
          <th><?php echo htmlentities(lang('ds_storeclass')); ?>：</th>
          <td><?php echo htmlentities($joinin_detail['storeclass_name']); ?>（<?php echo htmlentities(lang('storeclass_bail')); ?>：<?php echo htmlentities($joinin_detail['storeclass_bail']); ?> <?php echo htmlentities(lang('ds_yuan')); ?>）</td>
        </tr>
        <tr>
          <th><?php echo htmlentities(lang('paying_amount')); ?>：</th>
          <td>
          <?php if(intval($joinin_detail['joinin_state']) === 10): ?>
          <input type="text" value="<?php echo htmlentities($joinin_detail['paying_amount']); ?>" name="paying_amount" /> <?php echo htmlentities(lang('ds_yuan')); else: ?>
          <?php echo htmlentities($joinin_detail['paying_amount']); ?> <?php echo htmlentities(lang('ds_yuan')); ?>
          <?php endif; ?>
          </td>
        </tr>
        <tr>
          <th><?php echo htmlentities(lang('store_bind_class')); ?>：</th>
          <td colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="table_category" class="type">
              <thead>
                <tr>
                  <th><?php echo htmlentities(lang('ds_class')); ?>1</th>
                  <th><?php echo htmlentities(lang('ds_class')); ?>2</th>
                  <th><?php echo htmlentities(lang('ds_class')); ?>3</th>
                  <th><?php echo htmlentities(lang('store_class_commis_rates')); ?></th>
                </tr>
              </thead>
              <tbody>
                <?php if(!(empty($joinin_detail['store_class_names']) || (($joinin_detail['store_class_names'] instanceof \think\Collection || $joinin_detail['store_class_names'] instanceof \think\Paginator ) && $joinin_detail['store_class_names']->isEmpty()))): $store_class_names = unserialize($joinin_detail['store_class_names']);if(!empty($store_class_names) && is_array($store_class_names)) {$store_class_commis_rates = explode(',', $joinin_detail['store_class_commis_rates']);for($i=0, $length = count($store_class_names); $i < $length; $i++) {$s_c_n = explode(',', $store_class_names[$i]);$class1=isset($s_c_n[0])?$s_c_n[0]:'';$class2=isset($s_c_n[1])?$s_c_n[1]:'';$class3=isset($s_c_n[2])?$s_c_n[2]:'';?>
                <tr>
                  <td><?php echo htmlentities($class1); ?></td>
                  <td><?php echo htmlentities($class2); ?></td>
                  <td><?php echo htmlentities($class3); ?></td>
                  <td>
                <?php if(intval($joinin_detail['joinin_state']) === 10): ?>
                  <input type="text" dstype="commis_rate" value="<?php echo $store_class_commis_rates[$i];?>" name="commis_rate[]" class="w100" /> %
                <?php else: ?>
                <?php echo $store_class_commis_rates[$i];?> %
                <?php endif; ?>
                </td>
                </tr>
                <?php } } ?>
                <?php endif; ?>
                </tbody>
        </table></td>
    </tr>
    <?php if(in_array(intval($joinin_detail['joinin_state']), array(STORE_JOIN_STATE_PAY, STORE_JOIN_STATE_FINAL))) {?>
    <tr>
        <th><?php echo htmlentities(lang('storereopen_pay_cert')); ?>：</th>
        <td>
            <?php if(!(empty($joinin_detail['paying_money_certificate']) || (($joinin_detail['paying_money_certificate'] instanceof \think\Collection || $joinin_detail['paying_money_certificate'] instanceof \think\Paginator ) && $joinin_detail['paying_money_certificate']->isEmpty()))): ?>
            <a data-lightbox="lightbox-image"  href="<?php echo get_store_joinin_imageurl($joinin_detail['paying_money_certificate']); ?>"> <img src="<?php echo get_store_joinin_imageurl($joinin_detail['paying_money_certificate']); ?>"  height="100"/> </a>
            <?php endif; ?>
        </td>
    </tr>
    <tr>
        <th><?php echo htmlentities(lang('storereopen_pay_cert_explain')); ?>：</th>
        <td><?php echo htmlentities($joinin_detail['paying_money_certificate_explain']); ?></td>
    </tr>
    <?php } if(in_array(intval($joinin_detail['joinin_state']), array(STORE_JOIN_STATE_NEW, STORE_JOIN_STATE_PAY))) { ?>
    <tr>
        <th><?php echo htmlentities(lang('joinin_message')); ?>：</th>
        <td colspan="2"><textarea id="joinin_message" name="joinin_message"></textarea></td>
    </tr>
    <?php } ?>
    </tbody>
    </table>
   <?php if(in_array(intval($joinin_detail['joinin_state']), array(STORE_JOIN_STATE_NEW, STORE_JOIN_STATE_PAY))) { ?>
    <div id="validation_message" style="color:red;display:none;"></div>
    <div><a id="btn_fail" class="btn" href="JavaScript:void(0);"><span><?php echo htmlentities(lang('ds_refuse')); ?></span></a> <a id="btn_pass" class="btn" href="JavaScript:void(0);"><span><?php echo htmlentities(lang('ds_pass')); ?></span></a></div>
    <?php } ?>
  </form>
</div>
<link rel="stylesheet" href="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.lightbox/css/lightbox.min.css">
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/js/jquery.lightbox/js/lightbox.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#btn_fail').on('click', function() {
            if($('#joinin_message').val() == '') {
                $('#validation_message').text('<?php echo htmlentities(lang('joinin_message_required')); ?>');
                $('#validation_message').show();
                return false;
            } else {
                $('#validation_message').hide();
            }
            layer.confirm("<?php echo htmlentities(lang('refuse_confirm')); ?>", {
                btn: ['<?php echo htmlentities(lang('ds_ok')); ?>', '<?php echo htmlentities(lang('ds_cancel')); ?>'],
                title: false,
            }, function () {
                $('#verify_type').val('fail');
                $('#form_store_verify').submit();
            });
        });
        $('#btn_pass').on('click', function() {
            var valid = true;
            $('[dstype="commis_rate"]').each(function(commis_rate) {
                rate = $(this).val();
                if(rate == '') {
                    valid = false;
                    return false;
                }

                var rate = Number($(this).val());
                if(isNaN(rate) || rate < 0 || rate >= 100) {
                    valid = false;
                    return false;
                }
            });
            if(valid) {
                $('#validation_message').hide();
                layer.confirm("<?php echo htmlentities(lang('store_join_view_confrim')); ?>", {
                    btn: ['<?php echo htmlentities(lang('ds_ok')); ?>', '<?php echo htmlentities(lang('ds_cancel')); ?>'],
                    title: false,
                }, function () {
                    $('#verify_type').val('pass');
                    $('#form_store_verify').submit();
                });
            } else {
                $('#validation_message').text('<?php echo htmlentities(lang('store_class_commis_rates_error')); ?>');
                $('#validation_message').show();
            }
        });
    });
</script>