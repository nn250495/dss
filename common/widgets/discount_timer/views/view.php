<?php
use yii\helpers\Url;
?>
<div class="row short-discount">
    <div class="col-sm-8">
        <div class="clearfix gray-bg">
            <div class="col-sm-6">
                <img src="<?=$model->getImage()->getUrl()?>" alt="">
            </div>
            <div class="col-sm-6">
                <a href="<?=Url::to(['/product/view', 'slug' => $model->product->slug])?>" class="h3"><?=$model->title?></a>
                <div class="desc"><?=$model->description?></div>
                <?php if(!empty($model->date_end)) { ?>
                    <div class="text-center widget-timer">
                        <div data-role="discount-widget-timer" data-endtime="<?=$model->date_end?>">
                            <p class="header">До окончания акции:</p>
                            <div>
                                <p class="counter" data-role="discount-widget-days"></p>
                                <p class="podpis">дней</p>
                            </div>
                            <div>
                                <p class="counter" data-role="discount-widget-hours"></p>
                                <p class="podpis">часов</p>
                            </div>
                            <div>
                                <p class="counter" data-role="discount-widget-minutes"></p>
                                <p class="podpis">минут</p>
                            </div>
                            <div>
                                <p class="counter" data-role="discount-widget-seconds"></p>
                                <p class="podpis">секунд</p>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="banner-item">
            <div class="ribbon-price">
                <span><?=$model->price?> руб.</span>
            </div>
            <div class="banner-img">
                <p>
                    <a href="<?=Url::to(['/product/view', 'slug' => $model->product->slug])?>">
                        <img src="<?=$model->product->getImage()->getUrl('200x200')?>" alt="">
                    </a>
                </p>
            </div>
            <div class="banner-info">
                <a class="h3" href="<?=Url::to(['/product/view', 'slug' => $model->product->slug])?>"><?=$model->product->name?></a>
                <?=$model->feature?>
            </div>
        </div>
    </div>
</div>