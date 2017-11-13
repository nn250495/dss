<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\helpers\Url;
use frontend\assets\AppAsset;
use common\widgets\Alert;
use dvizh\cart\widgets\CartInformer;
use dvizh\cart\widgets\ElementsList;
use dvizh\shop\models\Category;

$categories = Category::buildTree();

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
</head>
<body>
<?php $this->beginBody() ?>

<header>
    <div class="container-fluid black">
        <div class="container">
            <div class="row">
                <ul class="col-sm-4 top-menu">
                    <li><a href="<?=Url::to(['/page/view', 'slug' => 'o-kompanii']);?>">О компании</a></li>
                    <li><a href="<?=Url::to(['/news']);?>">Новости</a></li>
                    <li><a href="<?=Url::to(['/site/contact']);?>">Контакты</a></li>
                </ul>
                <ul class="col-sm-5 text-center">
                    <li><a href="tel:<?=yii::$app->settings->get('phone');?>" data-toggle="modal" data-target="#callback"><i class="fa fa-phone"></i> <span class="dashed"><?=yii::$app->settings->get('phone');?></span></a></li>
                    <li><a class="smooth" href="#contactForm"><i class="fa fa-envelope-o"></i> <?=yii::$app->settings->get('email');?></a></li>
                </ul>
                <ul class="col-sm-3 text-right">
                    <?php if(yii::$app->user->isguest) { ?>
                        <li><a href="<?=Url::toRoute(['/user/security/login']);?>"><i class="fa fa-lock"></i> Войти</a></li>
                        <li><a href="<?=Url::toRoute(['/user/registration/register']);?>">Регистрация</a></li>
                    <?php } else { ?>
                        <li><a href="<?=Url::to(['/user/settings/profile']);?>"><i class="fa fa-user" aria-hidden="true"></i> Профиль</a></li>
                        <li><a href="<?=Url::to(['/user/security/logout']);?>" data-method="post"><i class="glyphicon glyphicon-log-out" aria-hidden="true"></i> Выход</a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid sticky">
        <div class="container">
            <div class="row">
                <div class="hidden-xs col-sm-3">
                    <a class="logo" href="<?=Url::toRoute('/');?>">
                        <img src="<?=yii::$app->request->baseUrl;?>/image/logo.png">
                    </a>
                </div>
                <div class="visible-xs col-xs-2">
                    <button class="navbar-toggle" data-toggle="collapse" data-target="#mainMenu">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="visible-xs col-xs-6 col-sm-3">
                    <a class="logo" href="<?=Url::toRoute('/');?>">
                        <img src="<?=yii::$app->request->baseUrl;?>/image/logo.png">
                    </a>
                </div>
                <div class="col-xs-4 col-sm-2 text-right pull-right">
                    <?=$this->context->renderPartial('//search/index');?>
                    <div class="top-cart">
                        <a href="<?=Url::toRoute(['/site/cart']);?>">
                            <i class="fa fa-shopping-cart"></i>
                            <?=CartInformer::widget(['text' => '{c}']);?>
                        </a>
                    </div>
                </div>
                <ul class="col-xs-12 col-sm-7 collapse navbar-collapse main-menu" id="mainMenu">

                    <li class="parent">
                        <i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i>
                        <a href="#">Каталог товаров</a>
                        <ul class="submenu">
                            <?php foreach($categories as $category) { ?>
                                <li class="noactive parent">
                                    <?php if($category['childs']) { ?>
                                        <i class="fa fa-angle-right"></i><i class="fa fa-angle-down" style="display:none;"></i>
                                    <?php } ?>
                                    <a href="<?=Url::toRoute(['/category/view', 'slug' => $category['slug']]);?>"><?=$category['name'];?></a>
                                    <?php if($category['childs']) { ?>
                                        <ul class="submenu">
                                            <?php foreach($category['childs'] as $child) { ?>
                                                <li><a href="<?=Url::toRoute(['/category/view', 'slug' => $child['slug']]);?>"><?=$child['name'];?></a></li>
                                            <?php } ?>
                                        </ul>
                                    <?php } ?>
                                </li>
                            <?php } ?>
                        </ul>
                    </li>
                    <li><a href="<?=Url::to(['/page/view', 'slug' => 'dostavka-i-oplata']);?>">Доставка и оплата</a></li>
                    <li><a href="<?=Url::to(['/site/contact']);?>">Контакты</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<?= Alert::widget() ?>
<?= $content ?>

<footer>
    <div class="container-fluid gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <a href="<?=Url::to(['/'])?>">
                        <img src="/frontend/web/image/logo.png">
                    </a>
                    <div class="seo-text">
                        <?=Yii::$app->settings->get('SEO-text-footer')?>
                    </div>
                    <ul class="social">
                        <?php if(Yii::$app->settings->get('facebook-link') != '') { ?>
                            <li><a href="<?=Yii::$app->settings->get('facebook-link')?>"><i class="fa fa-facebook"></i></a></li>
                        <?php } ?>
                        <?php if(Yii::$app->settings->get('vk-link') != '') { ?>
                            <li><a href="<?=Yii::$app->settings->get('vk-link')?>"><i class="fa fa-vk"></i></a></li>
                        <?php } ?>
                        <?php if(Yii::$app->settings->get('odnoklassniki-link') != '') { ?>
                            <li><a href="<?=Yii::$app->settings->get('odnoklassniki-link')?>"><i class="fa fa-odnoklassniki"></i></a></li>
                        <?php } ?>
                        <?php if(Yii::$app->settings->get('twitter-link') != '') { ?>
                            <li><a href="<?=Yii::$app->settings->get('twitter-link')?>"><i class="fa fa-twitter"></i></a></li>
                        <?php } ?>
                        <?php if(Yii::$app->settings->get('youtube-link') != '') { ?>
                            <li><a href="<?=Yii::$app->settings->get('youtube-link')?>"><i class="fa fa-youtube"></i></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <div class="col-sm-5">
                    <div class="row">
                        <div class="hidden-xs col-sm-6">
                            <p class="footer-title">Продукция</p>
                            <ul class="footer-menu">
                                <?php foreach($categories as $category) { ?>
                                    <li>
                                        <a href="<?=Url::toRoute(['/category/view', 'slug' => $category['slug']]);?>"><?=$category['name'];?></a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <p class="footer-title">Информация</p>
                            <ul class="footer-menu">
<!--                                <li><a href="profile.php">Профиль</a></li>-->
                                <li><a href="<?=Url::to(['/page/view', 'slug' => 'dostavka-i-oplata'])?>">Доставка и оплата</a></li>
<!--                                <li><a href="checkout.php">Моя корзина</a></li>-->
<!--                                <li><a href="profile.php">История заказов</a></li>-->
                                <li><a href="<?=Url::to(['/site/contact'])?>">Контакты</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4" id="contactForm">
                    <p class="footer-title">Напишите нам</p>
                    <?=$this->context->renderPartial('//mail/footer', [
                        'model' => new \common\models\Mail(),
                    ]);?>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <p>© <?=Yii::$app->settings->get('sitename')?> <?=date('Y')?>. Все права защищены.</p>
                </div>
                <ul class="col-sm-4 bank-list">
                    <li><img src="/frontend/web/image/visa.png" alt=""></li>
                    <li><img src="/frontend/web/image/sberbank.png" alt=""></li>
                    <li><img src="/frontend/web/image/master.png" alt=""></li>
                </ul>
                <div class="col-sm-4 text-right">
                    <p>Платформа разработана компанией <a href="http://nethammer.ru" target="_blank">Nethammer lab.</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>

<?php
yii\bootstrap\Modal::begin([
    'headerOptions' => ['class' => 'text-center'],
    'header' => 'Заказать обратный звонок',
    'id' => 'callback',
    'size' => 'modal-md',
    'options' => [
        'data-role' => 'modal-window',
    ],
    'clientOptions' => [
        'backdrop' => 'static',
        'keyboard' => FALSE
    ],
]);
?>

<?=$this->context->renderPartial('//mail/form', [
    'model' => new \common\models\Mail(),
]);?>

<?php yii\bootstrap\Modal::end();?>

<?php
yii\bootstrap\Modal::begin([
    'id' => 'fastView',
    'size' => 'modal-lg',
    'options' => [
        'data-role' => 'modal-window',
    ],
    'clientOptions' => [
        'backdrop' => 'static',
        'keyboard' => FALSE
    ],
]);
?>
<div data-role="fast-view-body-modal"></div>
<?php yii\bootstrap\Modal::end();?>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
