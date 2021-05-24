<?php

return array(
    'payment_code' => 'bankpay',
    'payment_name' => '银行汇款/转账',
    'payment_desc' => '银行汇款/转账',
    'payment_is_online' => '1',
    'payment_platform' => 'pc', #支付平台 pc h5 app
    'payment_author' => '爱购商城',
    'payment_website' => 'http://www.bankpay.com',
    'payment_version' => '1.0',
    'payment_config' => array(
        array('name' => 'bankname', 'type' => 'text', 'value' => '', 'placeholder' => '', 'desc' => '描述'),
        array('name' => 'banksn', 'type' => 'text', 'value' => '', 'placeholder' => '', 'desc' => '描述'),
    ),
);
?>
