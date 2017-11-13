<?php
namespace common\widgets\review;

use common\models\Review as ReviewModel;

class Review extends \yii\base\Widget
{
    public $productId;

    public function init()
    {
        \common\widgets\review\assets\ReviewAsset::register($this->getView());

        return parent::init();
    }

    public function run()
    {
        $model = new ReviewModel();
        $model->product_id = $this->productId;

        return $this->render('view', ['model' => $model]);
    }
}