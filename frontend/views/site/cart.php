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
                    <a href="#cart" data-toggle="tab">
                        <span>01</span> Корзина
                    </a>
                </li>
                <?php if(!empty(Yii::$app->cart->elements)) { ?>
                    <li>
                        <a href="#checkout" data-toggle="tab">
                            <span>02</span> Оформление заказа
                        </a>
                    </li>
                <?php } ?>
            </ul>
        </div>
        <div class="col-sm-10 tab-content">
            <div class="tab-content">
                <div class="tab-pane active fade in" id="cart">
                    <?php if(!empty(Yii::$app->cart->elements)) { ?>
                    <div class="table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th>Товар</th>
                                <th>Цена за ед.</th>
                                <th>Количество</th>
                                <th>Сумма</th>
                                <th>Удалить</th>
                            </tr>
                            </thead>
                            <tbody>
                                <?=ElementsList::widget([
                                    'type' => 'full',
                                    'showTotal' => false,
                                    'showCountArrows' => false,
                                    'elementView' => '/site/_cartElement',
                                ])?>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="box use-discount">
                                <div class="box-title">Промокод</div>
                                <p>Для получения скидки, введите промокод</p>
                                <?=\dvizh\promocode\widgets\Enter::widget()?>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="box payment-details">
                                <div class="box-title">Детали заказа</div>
                                <table>
                                    <tr>
                                        <td>Сумма корзины</td>
                                        <td><span id="cartTotal"><?=Yii::$app->cart->getCost()?></span> руб.</td>
                                    </tr>
                                    <tr>
                                        <td>Итого товаров на сумму</td>
                                        <td><?=CartInformer::widget();?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <?php } else { ?>
                        <p>Ваша корзина пуста</p>
                    <?php } ?>
                </div>
                <div class="tab-pane fade" id="checkout">
                    <div class="box row">
                        <div class="col-sm-6">
                            <div class="box-title">Платежная информация</div>
                            <?= OrderForm::widget(['view' => '@frontend/views/site/_orderForm']); ?>
                        </div>
                        <div class="col-sm-6">
                            <div class="box-title">Детали заказа</div>
                            <div class="payment-details">
                                <table>
                                    <?php foreach(Yii::$app->cart->elements as $element) { ?>
                                        <tr>
                                            <td><?=$element->getModel()->name?></td>
                                            <td><span><?=(float)$element->price * (int)$element->count?></span> руб.</td>
                                        </tr>
                                    <?php } ?>
                                    <tr>
                                        <td>Итого товаров на сумму</td>
                                        <td><?=CartInformer::widget();?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>