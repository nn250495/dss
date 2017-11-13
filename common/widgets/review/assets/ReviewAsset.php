<?php
namespace common\widgets\review\assets;

use yii\web\AssetBundle;

class ReviewAsset extends AssetBundle
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