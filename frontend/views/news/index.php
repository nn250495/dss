<?php 
use yii\helpers\Url;
use yii\widgets\LinkPager;
?>
<div class="page-container container">
           
    <div class="category-image" style="background: url()">
         <h1>Новости</h1>
         <ul class="breadcrumb">
             <li><a href="<?=Url::toRoute(['/']);?>"><i class="fa fa-home" aria-hidden="true"></i></a></li>
             <li class="active">Новости компании</li>
         </ul>
     </div>

    <div class="news-block">
         <div class="row">
             <?php foreach($news as $newsOne) { ?>
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6">
                            <a class="img-wrapper" href="<?=Url::toRoute(['/news/view', 'slug' => $newsOne->slug]);?>">
                                <img src="<?=$newsOne->getImage()->getUrl('370x300');?>" alt="">
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <a href="<?=Url::toRoute(['/news/view', 'slug' => $newsOne->slug]);?>" class="h5"><?=$newsOne->name;?></a>
                            <div class="desc">
                                <?=$newsOne->anons;?>
                            </div>
                            <a href="<?=Url::toRoute(['/news/view', 'slug' => $newsOne->slug]);?>">Читать полностью</a>
                        </div>
                    </div>
                </div>
             <?php } ?>

         </div>

        <?= LinkPager::widget(['pagination' => $pagination, 'options' => ['class' => 'pagination']]) ?>
     </div>

 </div>