<?php
use yii\helpers\Url;
use dvizh\shop\models\Category;
use dvizh\shop\widgets\ShowPrice;
use dvizh\filter\widgets\FilterPanel;
use dvizh\field\widgets\Show;
use dvizh\cart\widgets\ElementsList;
use dvizh\cart\widgets\CartInformer;
use dvizh\cart\widgets\ChangeOptions;
use dvizh\cart\widgets\ChangeCount;
use dvizh\cart\widgets\TruncateButton;
use dvizh\cart\widgets\BuyButton;
use dvizh\order\widgets\OrderForm;
use dvizh\promocode\widgets\Enter;
use dvizh\certificate\widgets\CertificateWidget;

/* @var $this yii\web\View */

$this->title = Yii::$app->settings->get('sitename');

?>
<div class="page-container container">

    <div class="owl-carousel-slider hidden-xs">
        <?php foreach($slides as $slide) { ?>
            <div class="item">
                <div class="slider-img">
                    <img src="<?=$slide->getImage()->getUrl();?>" alt="<?=$slide->name;?>">
                </div>
                <div class="slider-info">
                    <?php if($link = $slide->url) { ?>
                        <a href="<?=$link;?>" class="slider-title"><?=$slide->name;?></a>
                    <?php } ?>
                    <div class="slider-intro">
                        <p><?=$slide->short_text;?></p>
                    </div>
                    <?php if($link = $slide->url) { ?>
                        <a href="<?=$link;?>" class="bttn">Подробнее</a>
                    <?php } ?>
                </div>
            </div>
        <?php } ?>
    </div>

    <?php if(!empty($brands)) { ?>
        <div class="brands">
            <div class="block-title">Бренды</div>
            <!--div class="block-descript">Доступно большое количество брендов</div-->
            <div class="row">
                <div class="owl-carousel-brands col-sm-10 col-sm-oddset-1">
                    <?php foreach($brands as $brand) { ?>
                        <a href="<?=Url::toRoute(['/brand/view', 'slug' => $brand->slug]);?>" class="item">
                            <span class="img-inner" style="background-image: url(<?=$brand->getImage()->getUrl();?>);">
                            </span>
                            <p><?=$brand->name;?></p>
                        </a>
                    <?php } ?>
                </div>
            </div>
        </div>
    <?php } ?>

    <?=\common\widgets\discount_timer\DiscountTimer::widget()?>

    <div class="product-tab-block">
        <?php if(!empty($popularProducts) || !empty($newProducts) || !empty($promoProducts)) { ?>
            <div class="block-title">Продукция</div>
            <div class="block-descript">Доступно большое количество продукции</div>
            <ul class="nav nav-tabs">
                <?php if(!empty($popularProducts)) { ?>
                    <li class="active"><a href="#popular" data-toggle="tab"><span>Популярное</span></a></li>
                <?php } ?>
                <?php if(!empty($newProducts)) { ?>
                    <li><a href="#new" data-toggle="tab"><span>Новинки</span></a></li>
                <?php } ?>
                <?php if(!empty($promoProducts)) { ?>
                    <li><a href="#discount" data-toggle="tab"><span>Акции</span></a></li>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="popular">
                    <div class="row">
                        <?php $i = 1; foreach($popularProducts as $product) { ?>
                        <div class="col-md-3 col-sm-4 col-xs-12">
                            <?=$this->render('../product/mini', ['model' => $product]);?>
                        </div>
                        <?php if($i == 4) { $i = 0; ?>
                    </div><div class="row">
                        <?php } ?>
                        <?php $i++; } ?>
                    </div>
                </div>
                <div class="tab-pane fade" id="new">
                    <div class="row">
                        <?php $i = 1; foreach($newProducts as $product) { ?>
                        <div class="col-md-3 col-sm-4 col-xs-12">
                            <?=$this->render('../product/mini', ['model' => $product]);?>
                        </div>
                        <?php if($i == 4) { $i = 0; ?>
                    </div><div class="row">
                        <?php } ?>
                        <?php $i++; } ?>
                    </div>
                </div>
                <div class="tab-pane fade" id="discount">
                    <div class="row">
                        <?php $i = 1; foreach($promoProducts as $product) { ?>
                        <div class="col-md-3 col-sm-4 col-xs-12">
                            <?=$this->render('../product/mini', ['model' => $product]);?>
                        </div>
                        <?php if($i == 4) { $i = 0; ?>
                    </div><div class="row">
                        <?php } ?>
                        <?php $i++; } ?>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</div>

<div class="container">
    <div class="news-block">
        <div class="block-title">Последние материалы</div>
        <div class="row">
            <?php foreach($news as $newsOne) { ?>
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6">
                            <a class="img-wrapper" href="<?=Url::toRoute(['/news/view', 'slug' => $newsOne->slug]);?>">
                                <img src="<?=$newsOne->getImage()->getUrl();?>" alt="">
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <a href="<?=Url::toRoute(['/news/view', 'slug' => $newsOne->slug]);?>" class="h5"><?=$newsOne->name;?></a>
                            <div class="desc">
                                <?=$newsOne->anons;?>
                            </div>
                            <a href="<?=Url::toRoute(['/news/view', 'slug' => $newsOne->slug]);?>">Читать полностью</a>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

<?php
$script = <<< JS
$('.owl-carousel-slider').owlCarousel({
    navSpeed:2000,
    dragEndSpeed:2000,
    autoplaySpeed: 2000,
    nav:true,
    dots: true,
    center:true,
    margin: 30,
    autoplay: true,
    loop: true,
    items: 1
});

$('.owl-carousel-brands').owlCarousel({
    navSpeed:2000,
    dragEndSpeed:2000,
    nav:true,
    dots: false,
    margin: 30,
    loop: true,
    responsive:{
        0:{
            items:2
        },
        769:{
            items:6
        }
    }
});

$('.owl-carousel-productgal').owlCarousel({
    navSpeed:2000,
    dragEndSpeed:2000,
    nav:true,
    dots: false,
    margin: 10,
    responsive:{
        0:{
            items:2
        },
        769:{
            items:4
        }
    }
});

$("#main-img").elevateZoom({
    gallery:'product-gallery',
    galleryActiveClass: 'active',
    zoomType: 'lens',
    lensSize: 150
});

$("#main-img").bind("click", function(e) {  
  var ez =   $('#main-img').data('elevateZoom');	
    $.fancybox(ez.getGalleryList());
  return false;
});  

$("#main-modal-img").elevateZoom({
    gallery:'product-modal-gallery',
    galleryActiveClass: 'active',
    easing: false
});

$("#main-modal-img").bind("click", function(e) {  
  var ez =   $('#main-img').data('elevateZoom');	
    $.fancybox(ez.getGalleryList());
  return false;
});
JS;
$this->registerJs($script);
?>