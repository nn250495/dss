<?php
use yii\helpers\Url;
use dvizh\cart\widgets\BuyButton;

?>
<div class="product-item">
    <div class="product-img">
        <a href="<?=Url::toRoute(['/product/view', 'slug' => $model->slug]);?>">
            <img src="<?=$model->getImage()->getUrl('270x300');?>" alt="<?=$model->name;?>">
        </a>
    </div>
    <div class="product-info">
        <a href="<?=Url::toRoute(['/product/view', 'slug' => $model->slug]);?>" class="h5">
            <?=$model->name;?>
        </a>
        <div class="pro-rating">
            <?=\common\models\Review::getRatingAsStars($model->id)?>
        </div>
        <div class="desc">
            <?=$model->short_text;?>
        </div>
        <div class="row">
            <div class="pro-price col-xs-6"><?=round($model->price, 0);?> <?=yii::$app->params['currency'];?></div>
            <ul class="action-button col-xs-6">
                <li>
                    <a href="#" data-role="fast-view-init" data-toggle="modal" data-target="#fastView" data-url-ajax="<?=Url::to(['/product/fast-view', 'id' => $model->id])?>">
                        <i class="fa fa-search-plus"></i>
                    </a>
                </li>
                <li>
                    <?=BuyButton::widget(['model' => $model, 'cssClass' => 'buy-mini-button', 'htmlTag' => 'a', 'text' => '<i class="fa fa-cart-plus"></i>']);?>
                </li>
            </ul>
        </div>
    </div>
</div>