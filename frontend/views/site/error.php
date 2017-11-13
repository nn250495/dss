<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>
<div class="page-container container">

    <div class="category-image" style="background: url(<?=Yii::$app->request->baseUrl?>/image/category-img.png)">
        <h1>Страница не найдена</h1>
        <ul class="breadcrumb">
            <li><a href="<?=Yii::$app->request->baseUrl?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
            <li class="active">Ошибка 404</li>
        </ul>
    </div>

    <div class="text">
        <div class="block-title">Страница не найдена</div>
        <div class="block-descript">В следующий раз мы обязательно поищем получше. А сейчас предлагаем вернуться Вам на <a href="<?=Yii::$app->request->baseUrl?>">Главную страницу</a>. Дабы загладить свою вину за данное недоразумение мы дарим Вам скидку 5% на Ваш заказ. Для ее использования укажите при оформлении заказа промокод <b>404error</b>. Хорошего дня и отличных покупок! ;)</div>
    </div>

</div>