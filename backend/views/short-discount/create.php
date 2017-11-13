<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ShortDiscount */

$this->title = 'Создать акцию';
$this->params['breadcrumbs'][] = ['label' => 'Акции', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="short-discount-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
