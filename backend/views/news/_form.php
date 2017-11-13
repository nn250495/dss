<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\News */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="news-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <div class="col-md-6">
        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-6">
        <?= $form->field($model, 'status')->dropDownList([ 'draft' => 'Черновик', 'published' => 'Опуликовано', 'deleted' => 'Удалено', ]) ?>
    </div>

    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <?php echo $form->field($model, 'anons')->widget(
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

        <?= $form->field($model, 'slug')->textInput(['maxlength' => true])->label("")->hiddenInput() ?>

        <?= $form->field($model, 'date')->textInput()->label("")->hiddenInput() ?>

        <?=\dvizh\gallery\widgets\Gallery::widget(
            [
                'model' => $model,
                'previewSize' => '50x50',
                'fileInputPluginLoading' => true,
                'fileInputPluginOptions' => []
            ]
        ); ?>
        
        <div class="form-group">
            <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
