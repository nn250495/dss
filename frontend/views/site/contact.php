<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Контакты';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="page-container container">
           
    <div class="category-image" style="background: url(<?=yii::$app->request->baseUrl;?>/image/category-img.png)">
         <h1>Контакты</h1>
         <ul class="breadcrumb">
             <li><a href="<?=yii::$app->request->baseUrl;?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
             <li class="active">Контакты</li>
         </ul>
     </div>

    <div class="box contact-us">
        <div class="row">

            <div class="col-sm-10">
                <p class="h4"><?=yii::$app->name;?></p>
                <p><b>Адрес:</b> <?=yii::$app->settings->get('address');?></p>
                <p><i class="fa fa-phone"></i> <?=yii::$app->settings->get('phone');?></p>
                <p><i class="fa fa-envelope-o"></i><a href="mailto:<?=yii::$app->settings->get('email');?>"><?=yii::$app->settings->get('email');?></a></p>
                <p><i class="fa fa-clock-o"></i><?=yii::$app->settings->get('schedule');?></p>
            </div>
            
            <div class="col-sm-2">
                <img src="<?=yii::$app->request->baseUrl;?>/image/logo.png" alt="<?=yii::$app->name;?>">
            </div>
        </div>
        <div class="map">
            <?=yii::$app->settings->get('map');?>
        </div>
     </div>

 </div>
