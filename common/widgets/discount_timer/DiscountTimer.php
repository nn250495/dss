<?php
namespace common\widgets\discount_timer;

use common\models\ShortDiscount;
use dvizh\shop\models\Product;

class DiscountTimer extends \yii\base\Widget
{
    public function init()
    {
        \common\widgets\discount_timer\assets\DiscountTimerAsset::register($this->getView());

        return parent::init();
    }

    public function run()
    {
        $model = ShortDiscount::find()->orderBy('rand()')->one();

        return !empty($model->product) ? $this->render('view', ['model' => $model]) : false;
    }
}