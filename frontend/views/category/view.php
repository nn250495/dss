<?php
use yii\helpers\Url;
use dvizh\shop\models\Category;
use yii\widgets\LinkPager;
use dvizh\filter\widgets\FilterPanel;

if(!$title = $model->seo->title) {
    $title = $model->name;
}

if(!$description = $model->seo->description) {
    $description = 'Страница '.$model->name;
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

$categories = Category::buildTree();
?>
<div class="page-container container">
    <div class="category-image" style="background: url(<?=$model->hasImage() ? $model->getImage()->getUrl() : Yii::$app->request->baseUrl.'/image/category-img.png';?>)">
        <h1><?=$model->name;?></h1>
        <ul class="breadcrumb">
            <li><a href="<?=Url::toRoute(['/']);?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
            <?php if($parent = $model->parent) { ?>
                <li><a href="<?=Url::toRoute(['/category/view', 'slug' => $parent->slug]);?>"><?=$parent->name;?></a></li>
            <?php } ?>
            <li class="active"><?=$model->name;?></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-sm-3 sidebar">
            <div class="box">
                <div class="box-title">Фильтр</div>
                <div class="filter">
                    <?=FilterPanel::widget(['itemId' => $model->id, 'findModel' => $filterProductsFind, 'ajaxLoad' => true, 'resultHtmlSelector' => '#productsList', 'actionRoute' => ['/category/view', 'slug' => $model->slug, 'sort' => $sort]]); ?>
                </div>
            </div>
            
            <div class="box">
                <div class="box-title">Категории</div>
                <ul id="categoryTree">
                    <?php foreach($categories as $category) { ?>
                        <li class="noactive panel">
                            <?php if($category['childs']) { ?>
                                <a data-toggle="collapse" data-parent="#categoryTree" href="#subcat<?=$category['id'];?>" aria-expanded="true">
                                    <?=$category['name'];?>
                                    <i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-angle-right"></i>
                                </a>
                            <?php } else {  ?>
                                <a href="<?=Url::toRoute(['/category/view', 'slug' => $category['slug']]);?>"><?=$category['name'];?></a>
                            <?php } ?>

                            <?php if($category['childs']) { ?>
                                <ul id="subcat<?=$category['id'];?>" class="collapse in">
                                    <?php foreach($category['childs'] as $child) { ?>
                                        <li><a href="<?=Url::toRoute(['/category/view', 'slug' => $child['slug']]);?>"><?=$child['name'];?></a></li>
                                    <?php } ?>
                                </ul>
                            <?php } ?>
                        </li>
                    <?php } ?>
                </ul>
            </div>

            <?php if($viewed = yii::$app->viewed->getList()) { ?>
                <div class="box favorites hidden-xs">
                    <div class="box-title">Просмотренные</div>
                    <?php foreach($viewed as $product) { ?>
                        <div class="row">
                            <div class="col-sm-5">
                                <a href="<?=Url::toRoute(['/product/view', 'slug' => $product->slug]);?>">
                                    <img src="<?=$product->getImage('60x60');?>" alt="<?=$product->name;?>">
                                </a>
                            </div>
                            <div class="col-sm-7">
                                <a href="<?=Url::toRoute(['/product/view', 'slug' => $product->slug]);?>"><?=$product->name;?></a>
                                <p><?=$product->price;?> <?=yii::$app->params['currency'];?></p>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>

        <div class="col-sm-9">
            <div class="sort-by">
                <div class="row">
                    <div class="col-xs-6 col-sm-4 sort-group">
                        <label>
                            <i class="fa fa-sort-amount-asc"></i>
                            <a href="<?=Url::toRoute(['/category/view', 'slug' => $model->slug, 'sort' => 'cheap', 'perpage' => $perpage]);?>" <?php if($sort == 'cheap') echo ' style="font-weight: bold;"'; ?>>дешевые</a> или
                            <a href="<?=Url::toRoute(['/category/view', 'slug' => $model->slug, 'sort' => 'expensive', 'perpage' => $perpage]);?>" <?php if($sort == 'expensive') echo ' style="font-weight: bold;"'; ?>>дорогие</a>
                        </label>
                    </div>
                    <div class="hidden-xs col-sm-4 sort-group text-center">
                        
                    </div>
                    <div class="col-xs-6 col-sm-4 sort-group">
                        <label>
                            <i class="fa fa-eye" aria-hidden="true"></i> <span class="hidden-xs hidden-sm">Показать:</span> 
                        
                            <a href="<?=Url::toRoute(['/category/view', 'slug' => $model->slug, 'sort' => $sort, 'perpage' => 50]);?>" <?php if($perpage == 50) echo ' style="font-weight: bold;"'; ?>>50</a> или
                            <a href="<?=Url::toRoute(['/category/view', 'slug' => $model->slug, 'sort' => $sort, 'perpage' => 100]);?>" <?php if($perpage == 100) echo ' style="font-weight: bold;"'; ?>>100</a>
                        </label>
                    </div>
                </div>
            </div>
            <div  id="productsList">
                <div class="row">
                    <?php $i = 1; foreach($productsFind->all() as $product) { ?>
                        <div class="col-sm-4 col-xs-12">
                            <?=$this->render('../product/mini', ['model' => $product]);?>
                        </div>
                        <?php if($i == 3) { $i = 0; ?>
                            </div><div class="row">
                        <?php } ?>
                    <?php $i++; } ?>
                </div>

                <?= LinkPager::widget(['pagination' => $pagination, 'options' => ['class' => 'pagination']]) ?>
            </div>
        </div>
    </div>

</div>