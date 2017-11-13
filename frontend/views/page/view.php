<?php
use yii\helpers\Url;

if(!$title = $model->seo->title) {
    $title = $model->name;
}

if(!$description = $model->seo->description) {
    $description = $model->name;
}

if(!$keywords = $model->seo->keywords) {
    $keywords = '';
}

$this->title = $title;

$this->registerMetaTag([
    'name' => 'description',
    'content' => $description,
]);

$this->registerMetaTag([
    'name' => 'keywords',
    'content' => $keywords,
]);

?>
<div class="page-container container">
           
    <div class="category-image" style="background: url(<?=yii::$app->request->baseUrl;?>/image/category-img.png)">
         <h1><?=$model->name;?></h1>
         <ul class="breadcrumb">
             <li><a href="<?=Url::toRoute(['/']);?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
             <li class="active"><?=$model->name;?></li>
         </ul>
     </div>

    <div class="text">
         <div class="block-title"><?=$model->name;?></div>
         <div class="row">
             <?php if($model->hasImage()) { ?>
                <div class="col-sm-3">
                    <img src="<?=$model->getImage()->getUrl('370x300');?>" alt="">
                </div>
                <div class="col-sm-9">
                    <?=$model->text;?>
                </div>
             <?php } else { ?>
                <div class="col-sm-12">
                    <?=$model->text;?>
                </div>
             <?php } ?>

         </div>
     </div>

 </div>