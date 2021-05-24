<?php

$lang['admin_predeposit_parameter_error'] = '参数错误';
$lang['admin_predeposit_record_error'] = '记录信息错误';
$lang['admin_predeposit_userrecord_error'] = '会员信息错误';
$lang['admin_predeposit_membername'] = '会员名称';
$lang['admin_predeposit_addtime'] = '创建时间';
$lang['admin_predeposit_maketime'] = '发生时间';
$lang['admin_predeposit_changetime'] = '变更时间';
$lang['admin_predeposit_apptime'] = '申请时间';
$lang['admin_predeposit_paytime'] = '付款时间';
$lang['admin_predeposit_payment'] = '付款方式';
$lang['admin_predeposit_payed'] = '更改支付状态';
$lang['admin_predeposit_paystate'] = '支付状态';
$lang['admin_predeposit_confirmstate'] = '处理状态';
$lang['admin_predeposit_adminname'] = '操作管理员';
$lang['admin_predeposit_pricetype'] = '预存款类型';
$lang['admin_predeposit_pricetype_available'] = '可用金额';
$lang['admin_predeposit_pricetype_freeze'] = '冻结金额';
$lang['admin_predeposit_price'] = '金额';
$lang['admin_predeposit_sn'] = '充值单号';
$lang['admin_predeposit_cs_sn'] = '提现单号';
$lang['admin_predeposit_zhuanzhangbank'] = '收款银行';
$lang['admin_predeposit_zhuanzhangimgs'] = '转账截图';
$lang['admin_predeposit_banksn'] = '银行流水号';
$lang['admin_predeposit_daozhangimgs'] = '到账截图';
$lang['admin_predeposit_confirmtime'] = '确认时间';
$lang['admin_predeposit_adminremark'] = '备注';
/**
 * 充值功能公用
 */
$lang['admin_predeposit_rechargelist'] = '充值管理';
$lang['admin_predeposit_rechargewaitpaying'] = '未支付';
$lang['admin_predeposit_rechargepaysuccess'] = '已支付';
$lang['admin_predeposit_recharge_price'] = '充值金额';
$lang['admin_predeposit_rechargewaitconfirm'] = '待受理';
$lang['admin_predeposit_rechargeconfirmsuccess'] = '已充值';
$lang['admin_predeposit_rechargeconfirmfail'] = '已拒绝';
$lang['admin_predeposit_confirmfail'] = '拒绝';
/**
 * 充值信息编辑
 */
$lang['admin_predeposit_recharge_edit_success'] = '充值信息修改成功';
$lang['admin_predeposit_recharge_edit_fail'] = '修改充值单状态失败';
$lang['admin_predeposit_recharge_edit_state'] = '修改充值单状态';
$lang['admin_predeposit_recharge_banksn_tips'] = '银行流水号，会员充值到账后在银行产生的流水号。';
$lang['admin_predeposit_recharge_dzimgs_tips'] = '到账截图上传，请保证截图清晰且包含银行流水号、收款银行、收款金额、收款时间等重要信息。';
$lang['admin_predeposit_adminremark_tips'] = '选择“拒绝”处理时，请在备注中填写原因';
$lang['admin_predeposit_recharge_banksn_null'] = '银行流水号不能为空';
$lang['admin_predeposit_recharge_add_pricenull_error']			= '请填写充值金额';
$lang['admin_predeposit_recharge_add_pricemin_error']				= '充值金额为大于或者等于0.01的数字';
$lang['admin_predeposit_recharge_dzimgs_null'] = '请上传到账截图';
$lang['admin_predeposit_adminremark_null'] = '请填写拒绝处理原因';
/**
 * 提现功能公用
 */
$lang['admin_predeposit_cashset'] = '提现设置';
$lang['admin_predeposit_cashmanage'] = '提现管理';
$lang['admin_predeposit_cash_price'] = '提现金额';
$lang['admin_predeposit_cash_shoukuantype'] = '收款类型';
$lang['admin_predeposit_cash_shoukuanname'] = '收款人姓名';
$lang['admin_predeposit_cash_shoukuanbank'] = '收款银行';
$lang['admin_predeposit_cash_shoukuanaccount'] = '收款账号';
$lang['admin_predeposit_cash_help1'] = '未支付的提现单可以更改提现单的支付状态';
$lang['admin_predeposit_cash_help2'] = '删除按钮可以删除未支付的提现单';
$lang['admin_predeposit_cash_confirm'] = '您确认已将提现金额支付到买家提现账户吗？';
$lang['member_withdraw_cycle'] = '提现间隔周期';
$lang['member_withdraw_cycle_tips'] = '天。提现成功后，下次申请提现的间隔周期';
$lang['member_withdraw_min'] = '最低提现金额';
$lang['member_withdraw_max'] = '最大提现金额';
/**
 * 提现信息删除
 */
$lang['admin_predeposit_cash_del_success'] = '提现信息删除成功';
$lang['admin_predeposit_cash_del_fail'] = '提现信息删除失败';
/**
 * 提现信息编辑
 */
$lang['admin_predeposit_cash_edit_success'] = '提现信息修改成功';
$lang['admin_predeposit_cash_edit_fail'] = '提现信息修改失败';
$lang['admin_predeposit_cash_edit_state'] = '修改提现单状态';
/**
 * 手动修改
 */
$lang['admin_predeposit_artificial'] = '手动修改';
$lang['admin_predeposit_artificial_membernamenull_error'] = '请输入会员名称';
$lang['admin_predeposit_artificial_operatetype'] = '增减类型';
$lang['admin_predeposit_log_desc'] = '描述';

$lang['payment_time_required'] = '请填写付款时间';
$lang['payment_code_required'] = '请选择付款方式';
$lang['trade_no_required'] = '请填写第三方支付平台交易号';

$lang['now_available_predeposit'] = '当前预存款数为';
$lang['now_freeze_predeposit'] = '当前预存款冻结金额数为';
$lang['operatetype_1'] = '增加';
$lang['operatetype_2'] = '减少';
$lang['operatetype_3'] = '冻结';
$lang['operatetype_4'] = '解冻';

$lang['lg_desc'] = '描述信息';
$lang['amount_required'] = '金额不能为空';
$lang['amount_number'] = '请输入数字';
$lang['amount_min'] = '请输入大于0的数';

$lang['user_not_exist'] = '用户不存在';
$lang['avaliable_predeposit_not_enough'] = '预存款不足，会员当前预存款';
$lang['freezen_predeposit_not_enough'] = '可冻结预存款不足，会员当前预存款';
$lang['recover_freezen_predeposit_not_enough'] = '可恢复冻结预存款不足，会员当前冻结预存款';
$lang['pdrecharge_list'] = '充值明细';
$lang['pdlog_list'] = '预存款明细';
$lang['pd_add'] = '预存款调节';


$lang['pay_method_text']['bank']		= '银行';
$lang['pay_method_text']['alipay']		= '支付宝';
$lang['pay_method_text']['weixin']		= '微信';

return $lang;