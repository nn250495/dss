<?php
namespace common\widgets\discount_timer\assets;

use yii\web\AssetBundle;

class DiscountTimerAsset extends AssetBundle
{
    public $depends = [
        'yii\web\JqueryAsset',
    ];

    public $js = [
        'js/scripts.js'
    ];

    public $css = [
        'css/style.css'
    ];

    public function init()
    {
        $this->sourcePath = dirname(__FILE__) . '/../web';

        parent::init();
    }
}