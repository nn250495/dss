<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ShortDiscount */

$this->title = 'Редактировать акцию: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Акции', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="short-discount-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
