<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/font-awesome.css',
        'js/assets/owl.carousel.css',
        'js/assets/owl.theme.default.css',
        'js/fancybox/jquery.fancybox.css',
        'css/style.css',
        'css/media.css',
        'css/site.css',
    ];
    public $js = [
        'js/owl.carousel.js',
        'js/fancybox/jquery.fancybox.js',
        'js/myjs.js',
        'js/scripts.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
