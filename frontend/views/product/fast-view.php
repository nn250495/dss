<?php
use dvizh\field\widgets\Show;
use dvizh\cart\widgets\BuyButton;
use dvizh\cart\widgets\ChangeCount;
use yii\helpers\Url;
?>

<div class="row">
    <div class="col-sm-5">
        <div class="item-image">
            <div class="main-image-box">
                <a href="<?=$model->getImage()->getUrl()?>" data-fancybox="group" data-caption="<?=$model->getImage()->description?>">
                    <img id="main-modal-img" alt="<?=$model->getImage()->alt?>" src="<?=$model->getImage()->getUrl('360x360');?>">
                </a>
            </div>
            <div class="clearfix"></div>
            <div id="product-modal-gallery" class="product-modal-gallery-<?=$model->id;?>">
                <?php if(count($model->getImages()) > 1) { ?>
                    <div class="owl-carousel-productgal">
                        <?php foreach($model->getImages() as $i => $image) { ?>
                            <?php if($i > 0) { ?>
                                <a href="<?=$image->getUrl()?>" data-fancybox="group" data-caption="<?=$image->description?>">
                                    <img src="<?=$image->getUrl('50x50');?>" alt="<?=$image->alt;?>">
                                </a>
                            <?php } ?>
                        <?php } ?>
                    </div>
                <?php } ?>
            </div>
       </div>
    </div>
    <div class="col-sm-7">
        <p class="h2"><?=$model->name;?></p>
        <div class="pro-rating">
            <?=\common\models\Review::getRatingAsStars($model->id)?>
            <span>(Отзывов: <?=\common\models\Review::getCountReviews($model->id)?>)</span>
        </div>

        <?=Show::widget(['model' => $model]);?>

        <div class="price-box">
            <?=$model->price;?> руб.
        </div>
        <a class="readmore" href="<?=Url::toRoute(['/product/view', 'slug' => $model->slug]);?>">Смотреть полное описание</a>
        <form class="clearfix">
            <div class="count">
                <?=ChangeCount::widget(['model' => $model]);?>
            </div>

            <?=BuyButton::widget(['model' => $model, 'htmlTag' => 'button', 'text' => '<i class="fa fa-cart-plus"></i> В корзину']);?>
        </form>
        <div class="desc">
            <?=$model->short_text;?>
        </div>
    </div>
</div>


<script>
$("#main-modal-img").elevateZoom({
    gallery:'product-modal-gallery',
    galleryActiveClass: 'active',
    easing: false
});
</script>