<?php
use yii\helpers\Html;
use dvizh\cart\widgets\ChangeCount;
use dvizh\cart\widgets\DeleteButton;
use yii\helpers\Url;

?>
<tr>
    <td class="product-table">
        <div class="pull-left">
            <img src="<?=$model->getModel()->getImage()->getUrl()?>" alt="<?=$model->getModel()->getImage()->alt?>">
        </div>
        <a href="<?=Url::to(['/product/view', 'slug' => $model->getModel()->slug])?>"><?=$model->getModel()->name?></a>
        <?=$model->getModel()->short_text?>
    </td>
    <td>
        <span class="price"><?=$model->price?></span> руб.
    </td>
    <td data-role="cart-change-count">
        <?=ChangeCount::widget(['model' => $model])?>
    </td>
    <td>
        <span class="sum"><?=(float)$model->price * (int)$model->count?></span> руб.
    </td>
    <td data-role="cart-remove-product">
        <?=DeleteButton::widget(['model' => $model, 'cssClass' => 'remove'])?>
    </td>
</tr>