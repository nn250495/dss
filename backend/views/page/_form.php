<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use dvizh\gallery\widgets\Gallery;

/* @var $this yii\web\View */
/* @var $model common\models\Page */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <div class="row">
        <div class="col-xs-12 col-md-8">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-xs-12 col-md-4">
            <?= $form->field($model, 'slug')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?php echo $form->field($model, 'text')->widget(
                \yii\imperavi\Widget::className(),
                [
                    'plugins' => ['fullscreen', 'fontcolor', 'video'],
                    'options'=>[
                        'minHeight' => 400,
                        'maxHeight' => 400,
                        'buttonSource' => true,
                        'imageUpload' => Url::toRoute(['/tools/upload-imperavi'])
                    ]
                ]
            ) ?>
        </div>
    </div>

    <?=Gallery::widget([
        'model' => $model,
        'label' => 'Изображение'
    ]);?>

    <?=\dvizh\seo\widgets\SeoForm::widget([
        'model' => $model, 
        'form' => $form, 
    ]); ?>
    
    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
