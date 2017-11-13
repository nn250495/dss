<?php
use yii\helpers\Url;
?>

<div class="header-search-inner">
    <button class="search-toggle">
        <i class="fa fa-search"></i>
    </button>
    <form class="top-search-box" action="<?=Url::toRoute(['/search/result']);?>">
        <input type="text" name="search" placeholder="Поиск по сайту..">
        <button>
            <i class="fa fa-search"></i>
        </button>
    </form>
</div>