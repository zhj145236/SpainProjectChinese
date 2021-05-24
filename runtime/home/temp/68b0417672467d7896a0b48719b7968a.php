<?php /*a:1:{s:79:"D:\wwwroot\shops.domibuy.com\app\home\view\default\mall\login\login_inajax.html";i:1617674970;}*/ ?>
<div class="quick-login">
    <div class="mt">
        <ul>
            <li class="on"><?php echo htmlentities(lang('normal_login')); ?></li>
            <?php if(config('ds_config.sms_login') == 1): ?>
            <li><?php echo htmlentities(lang('dynamic_verification_code')); ?></li>
            <?php endif; ?>
        </ul>
    </div>
    <div class="mc">
        <form id="login_normal_inajax" action="<?php echo url('Login/login'); ?>" method="post" class="bg" >
            <dl>
                <dt></dt>
                <dd>
                    <i class="iconfont icon">&#xe702;</i>
                    <input type="text" class="text"  name="member_name" id="member_name" value="" placeholder=<?php echo htmlentities(lang('login_way')); ?> >
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd>
                    <i class="iconfont icon">&#xe67b;</i>
                    <input type="password" class="text" name="member_password" id="member_password" value="" placeholder=<?php echo htmlentities(lang('login_password')); ?>>
                </dd>
            </dl>
            <?php if(config('ds_config.captcha_status_login') == '1'): ?>
            <dl>
                <dt></dt>
                <dd class="clearfix">
                    <i class="iconfont icon">&#xe67b;</i>
                    <input type="text" name="captcha_normal" class="text fl" style="width:96px;" id="captcha_normal_inajax" maxlength="4" size="10" />
                    <img class="fl ml10" height="38" src="<?php echo url('Seccode/makecode'); ?>" title="<?php echo htmlentities(lang('login_index_change_checkcode')); ?>" border="0" id="codeimage_inajax" onclick="this.src = '<?php echo url('Seccode/makecode'); ?>'+'?'+(new Date().getTime());">
                </dd>
            </dl>
            <?php endif; ?>
            <ul>
                <li><a href="<?php echo url('Login/register'); ?>" class="register"><?php echo htmlentities(lang('quick_login_register')); ?></a><a href="<?php echo url('Login/forget_password'); ?>" class="forget"><?php echo htmlentities(lang('quick_login_forget')); ?></a></li>
            </ul>
            <div class="enter">
                <input type="submit" class="submit" value=<?php echo htmlentities(lang('login_immediately')); ?> name="Submit">
            </div>
            <input type="hidden" value="<?php echo htmlentities(app('request')->param('ref_url')); ?>" name="ref_url">
        </form>
        <form id="login_mobile_inajax" style="display:none" action="<?php echo url('Connectsms/login'); ?>" method="post" class="bg" >
            <dl>
                <dt></dt>
                <dd>
                    <i class="iconfont icon">&#xe702;</i>
                    <input type="text" class="text"  name="sms_mobile" id="sms_mobile" value="" placeholder=<?php echo htmlentities(lang('registered_mobile_number')); ?> >
                </dd>
            </dl>
            <dl>
                <dt></dt>
                <dd class="mobile">
                    <i class="iconfont icon">&#xe67b;</i>
                    <input type="password" class="text sms_captcha" name="sms_captcha" id="sms_captcha" value="" placeholder=<?php echo htmlentities(lang('login_mobile_verification_code')); ?>>
                    <a href="javascript:void(0)" class="send_code" id="btn_sms_captcha" ds_type="2"><?php echo htmlentities(lang('login_get_verification_code')); ?></a>
                </dd>
            </dl>
            <?php if(config('ds_config.captcha_status_login') == '1'): ?>
            <dl>
                <dt></dt>
                <dd class="clearfix">
                    <i class="iconfont icon">&#xe67b;</i>
                    <input type="text" name="captcha_mobile" class="text fl" style="width:96px;" id="captcha_mobile_inajax" maxlength="4" size="10" />
                    <img class="fl ml10" height="38" src="<?php echo url('Seccode/makecode'); ?>" title="<?php echo htmlentities(lang('login_index_change_checkcode')); ?>" border="0" id="sms_codeimage_inajax" onclick="this.src = '<?php echo url('Seccode/makecode'); ?>'+'?'+(new Date().getTime());">
                </dd>
            </dl>
            <?php endif; ?>
            <ul>
                <li><a href="<?php echo url('Login/register'); ?>" class="register"><?php echo htmlentities(lang('quick_login_register')); ?></a><a href="<?php echo url('Login/forget_password'); ?>" class="forget"><?php echo htmlentities(lang('quick_login_forget')); ?></a></li>
            </ul>
            <div class="enter">
                <input type="submit" class="submit" value=<?php echo htmlentities(lang('login_immediately')); ?> name="Submit">
            </div>
            <input type="hidden" value="<?php echo htmlentities(app('request')->param('ref_url')); ?>" name="ref_url">
        </form>
        <!--<?php if(config('ds_config.qq_isuse') =='1' || config('ds_config.sina_isuse') =='1' || config('ds_config.weixin_isuse') =='1'): ?>-->
        <!--<div class="partner-login clearfix">-->
        <!--    <h3><?php echo htmlentities(lang('partner_account_login')); ?></h3>-->
        <!--    <p>-->
        <!--        <?php if(config('ds_config.qq_isuse') == '1'): ?>-->
        <!--        <a class="login_ico ico_qq" href="<?php echo url('Api/oa_qq'); ?>"></a>-->
        <!--        <?php endif; ?>-->
        <!--        <?php if(config('ds_config.sina_isuse') == '1'): ?>-->
        <!--        <a class="login_ico ico_weibo" href="<?php echo url('Api/oa_sina'); ?>"></a>-->
        <!--        <?php endif; ?>-->
        <!--        <?php if(config('ds_config.weixin_isuse') == '1'): ?>-->
        <!--        <a class="login_ico ico_weixin" onclick="ajax_form('weixin_form', '<?php echo htmlentities(lang('wechat_account_login')); ?>', '<?php echo url('Connectwx/index'); ?>', 360);" title=<?php echo htmlentities(lang('wechat_account_login')); ?>></a>-->
        <!--        <?php endif; ?>-->
        <!--    </p>-->
        <!--</div>-->
        <!--<?php endif; ?>-->
    </div>
</div>
<script type="text/javascript" src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/js/connect_sms.js"></script> 
<script src="<?php echo htmlentities(PLUGINS_SITE_ROOT); ?>/jquery.validate.min.js"></script>
<script>
            $(document).ready(function() {
                $(".quick-login .mt li").click(function(){
                    var index = $(this).index();
                    $(this).parent().parent().next().find("form").hide().eq(index).show();
                    $(this).addClass("on").siblings().removeClass("on");
                });
                $("#login_normal_inajax").validate({
                    errorPlacement: function(error, element) {
                        var error_dd = element.parent('dd'), error_dt = element.parent().parent().find('dt');
                        error_dt.append(error);
                        error_dd.addClass('error');
                    },
                    onkeyup: false,
                    submitHandler: function(form) {
                        ds_ajaxpost('login_normal_inajax');
                    },
                    rules: {
                        member_name: "required",
                        member_password: "required",
                        <?php if(config('ds_config.captcha_status_login') == '1'): ?>
                        captcha_normal: {
                            required: true,
                            remote: {
                                url: "<?php echo url('Seccode/check',['reset'=>'false']); ?>",
                                type: 'get',
                                data: {
                                    captcha: function() {
                                        return $('#captcha_normal_inajax').val();
                                    }
                                },
                                complete: function(data) {
                                    if (data.responseText == 'false') {
                                        document.getElementById('codeimage_inajax').src = "<?php echo url('Seccode/makecode'); ?>"+"?" + new Date().getTime();
                                    }
                                }
                            }
                        }
                        <?php endif; ?>
                    },
                    messages: {
                        member_name: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('user_name_required')); ?>',
                        member_password: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('password_required')); ?>',
                        <?php if(config('ds_config.captcha_status_login') == '1'): ?>
                        captcha_normal: {
                            required: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('verification_code_required')); ?>',
                            remote: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_usersave_wrong_code')); ?>'
                        }
                        <?php endif; ?>
                    }
                });
            });
</script>

<?php if(config('ds_config.sms_login') == 1): ?>
<script type="text/javascript" src="<?php echo htmlentities(HOME_SITE_ROOT); ?>/js/connect_sms.js"></script>
<script>
            $(function () {
                $("#login_mobile_inajax").validate({
                    errorPlacement: function (error, element) {
                        var error_dd = element.parent('dd'), error_dt = element.parent().parent().find('dt');
                        error_dt.append(error);
                        error_dd.addClass('error');
                    },
                    success: function (label) {
                        label.parents('.text-area:first').removeClass('error').find('label').remove();
                    },
                    submitHandler:function(form){
                        ds_ajaxpost('login_mobile_inajax');
                    },
                    onkeyup: false,
                    rules: {
                        sms_mobile: {
                            required: true,
                            number:true,
                            rangelength:[11,11]
                        },
                        sms_captcha: {
                            required: true,
                            rangelength:[6,6]
                        }
                        <?php if(config('ds_config.captcha_status_login') == '1'): ?>,
                        captcha_mobile: {
                            required: true,
                            remote: {
                                url: "<?php echo url('Seccode/check',['reset'=>'false']); ?>",
                                type: 'get',
                                data: {
                                    captcha: function () {
                                        return $('#captcha_mobile_inajax').val();
                                    }
                                },
                                complete: function (data) {
                                    if (data.responseText == 'false') {
                                        document.getElementById('sms_codeimage_inajax').src = "<?php echo url('Seccode/makecode'); ?>" +"?" + new Date().getTime();
                                    }
                                }
                            }
                        }
                        <?php endif; ?>
                    },
                    messages: {
                        sms_mobile: {
                            required: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_correct_phone')); ?>',
                            number: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_correct_phone')); ?>',
                            rangelength:'<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_correct_phone')); ?>'
                        },
                        sms_captcha: {
                            required: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_sms_dynamic_code')); ?>',
                            rangelength: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_sms_dynamic_code')); ?>'
                        }
                        <?php if(config('ds_config.captcha_status_login') == '1'): ?>,
                        captcha_mobile: {
                            required: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('verification_code_required')); ?>',
                            remote: '<i class="iconfont">&#xe73b;</i><?php echo htmlentities(lang('login_usersave_wrong_code')); ?>'
                        }
                        <?php endif; ?>
                    }
                });
            });
</script>
<?php endif; ?>


