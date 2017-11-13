<?php
use yii\helpers\Url;
use dvizh\shop\models\Category;
use yii\widgets\LinkPager;
use dvizh\field\widgets\Show;
use dvizh\cart\widgets\ChangeOptions;
use dvizh\cart\widgets\ChangeCount;
use dvizh\cart\widgets\BuyButton;

if(!$title = $model->seo->title) {
    $title = $model->name;
}

if(!$description = $model->seo->description) {
    $description = 'Товар ' . $model->name . ' по цене ' . $model->price . ' рублей в магазине ' . yii::$app->name;
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

    <div class="row">
        <div class="col-sm-3 sidebar">
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

        <div class="col-sm-9 product-view">
            <ul class="breadcrumb">
                <li><a href="<?=Url::toRoute(['/']);?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
                <?php if($category = $model->category && $parent = $model->category->parent) { ?>
                    <li><a href="<?=Url::toRoute(['/category/view', 'slug' => $parent->slug]);?>"><?=$parent->name;?></a></li>
                <?php } ?>
                <?php if($category = $model->category) { ?>
                    <li><a href="<?=Url::toRoute(['/category/view', 'slug' => $category->slug]);?>"><?=$category->name;?></a></li>
                <?php } ?>
                <!--li class="active"><?=$model->name;?></li-->
            </ul>
            
            <h1><?=$model->name;?></h1>
            
            <div class="row">
                <div class="col-sm-5">
                    <div class="item-image">
                        <div class="main-image-box">
                            <a href="<?=$model->getImage()->getUrl()?>" data-fancybox="group" data-caption="<?=$model->getImage()->description?>">
                                <img id="main-modal-img" alt="<?=$model->getImage()->alt?>" src="<?=$model->getImage()->getUrl('360x360');?>">
                            </a>
                        </div>
                        <div class="clearfix"></div>
                        <div id="product-gallery">
                            <?php if(count($model->getImages()) > 1) { ?>
                                <div class="owl-carousel-productgal">
                                    <?php foreach($model->getImages() as $i => $image) { ?>
                                        <?php if($i > 0) { ?>
                                            <a href="<?=$image->getUrl()?>" data-fancybox="group" data-caption="<?=$image->description?>">
                                                <img src="<?=$image->getUrl('100x100');?>" alt="<?=$image->alt;?>">
                                            </a>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        </div>
                   </div>
                </div>
                <div class="col-sm-7">
                    
                    <div class="pro-rating">
                        <?=\common\models\Review::getRatingAsStars($model->id)?>
                        <span>(Отзывов: <?=\common\models\Review::getCountReviews($model->id)?>)</span>
                    </div>
                    
                    <?=Show::widget(['model' => $model, 'cssClass' => 'product-filter']);?>
                    
                    <div class="short-text"><?=$model->short_text;?></div>

                    <div class="price-box">
                        <?=$model->price;?> <?=yii::$app->params['currency'];?>
                    </div>
                    
                    <div>
                        <?=ChangeOptions::widget(['model' => $model, 'type' => ChangeOptions::TYPE_SELECT]);?>
                        <div class="clearfix">
                            <div class="count">
                                <?=ChangeCount::widget(['model' => $model]);?>
                            </div>
                            <?=BuyButton::widget(['model' => $model, 'htmlTag' => 'button', 'text' => '<i class="fa fa-cart-plus"></i>']);?>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="desc">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#desc" data-toggle="tab"><span>Описание</span></a></li>
                            <li><a href="#comments" data-toggle="tab"><span>Комментарии</span></a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="desc">
                                <?=$model->text;?>
                            </div>
                            <div class="tab-pane fade" id="comments">
                                <?=\common\widgets\review\Review::widget(['productId' => $model->id])?>
                                <?php foreach(\common\models\Review::getReviews($model->id) as $review) { ?>
                                    <div class="comment-item">
                                        <div class="pro-rating pull-right">
                                            <?=\common\models\Review::getRatingAsStars($model->id, $review->rate)?>
                                        </div>
                                        <p class="name"><?=$review->name?></p>
                                        <p class="small"><i class="fa fa-clock-o" aria-hidden="true"></i> <?=date('d.m.Y H:i', strtotime($review->created_at))?></p>
                                        <div class="comment-text"><?=$review->comment?></div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?php if($related = $model->relations) { ?>
                <div class="related">
                    <div class="block-title">Похожие товары</div>
                    <div class="block-descript">Вас также может заинтересовать</div>
                    <div class="row">
                        <?php foreach($related as $relatedProduct) { ?>
                            <div class="col-sm-4 col-xs-12">
                                <?=$this->render('mini', ['model' => $product]);?>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php } elseif($related = $model::find()->category($model->category_id)->andWhere(['!=', 'id', $model->id])->orderBy('RAND()')->limit(3)->all()) { ?>
                <div class="related">
                    <div class="block-title">Соседние товары</div>
                    <div class="block-descript">Вас также может заинтересовать</div>
                    <div class="row">
                        <?php foreach($related as $relatedProduct) { ?>
                            <div class="col-sm-4 col-xs-12">
                                <?=$this->render('mini', ['model' => $relatedProduct]);?>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php }  ?>
        </div>
    </div>

</div>