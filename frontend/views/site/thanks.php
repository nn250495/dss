<?php

use dvizh\cart\widgets\TruncateButton;
use dvizh\cart\widgets\CartInformer;
use dvizh\cart\widgets\ElementsList;
use dvizh\order\widgets\OrderForm;

$this->title = "Корзина";
?>

<div class="page-container container">

    <div class="category-image" style="background: url(<?=Yii::$app->request->baseUrl?>/image/category-img.png)">
        <h1>Оформление заказа</h1>
        <ul class="breadcrumb">
            <li><a href="<?=Yii::$app->request->baseUrl;?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
            <li class="active">Оформление заказа</li>
        </ul>
    </div>

    <div class="row checkout">
        <div class="col-sm-2">
            <ul class="cart-tab nav nav-tabs">
                <li class="active">
                    <a href="#" data-toggle="tab">
                        <span>01</span> Корзина
                    </a>
                </li>
                <li class="active">
                    <a href="#" data-toggle="tab">
                        <span>02</span> Оформление заказа
                    </a>
                </li>
                <li class="active">
                    <a href="#checkoutFinish" data-toggle="tab">
                        <span>03</span> Заказ оформлен
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-sm-10 tab-content">
            <div class="tab-content">
                <div class="tab-pane active fade in" id="checkoutFinish">
                    <div class="box">
                        <p class="text-center">Ваш заказ оформлен. Спасибо за доверие!</p>
                        <div class="order-number">
                            <span class="upper">Номер заказа</span>
                            <p># <?=$order->id?></p>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="box-title">Ваш заказ</div>
                                <div class="payment-details">
                                    <table>
                                        <?php foreach($order->elements as $element) { ?>
                                            <tr>
                                                <td><?=$element->getModel()->name?></td>
                                                <td><span><?=(float)$element->price * (int)$element->count?></span> руб.</td>
                                            </tr>
                                        <?php } ?>
                                        <tr>
                                            <td>Итого товаров на сумму</td>
                                            <td>
                                                <span class="dvizh-cart-informer " href="/cart/default/index">
                                                    <span class="dvizh-cart-count"><?=$order->getCount()?></span> на <strong class="dvizh-cart-price"><span><?=$order->getTotal()?></span>р.</strong>
                                                </span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="box-title">Детали заказа</div>
                                <table>
                                    <?php if(isset($order->client_name)) { ?>
                                        <tr>
                                            <td>ФИО</td>
                                            <td><?=$order->client_name?></td>
                                        </tr>
                                    <?php } ?>
                                    <?php if(isset($order->address)) { ?>
                                        <tr>
                                            <td>Адрес</td>
                                            <td><?=$order->address?></td>
                                        </tr>
                                    <?php } ?>
                                    <?php if(isset($order->email)) { ?>
                                        <tr>
                                            <td>E-mail</td>
                                            <td><?=$order->email?></td>
                                        </tr>
                                    <?php } ?>
                                    <?php if(isset($order->phone)) { ?>
                                        <tr>
                                            <td>Телефон</td>
                                            <td><?=$order->phone?></td>
                                        </tr>
                                    <?php } ?>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>