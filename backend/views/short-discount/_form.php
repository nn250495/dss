<?php

use kartik\date\DatePicker;
use kartik\select2\Select2;
use vova07\imperavi\Widget;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ShortDiscount */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="short-discount-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->widget(Widget::className(), [
        'settings' => [
            'lang' => 'ru',
            'minHeight' => 200,
            'plugins' => [
                'fullscreen',
            ]
        ]
    ]);?>

    <?= $form->field($model, 'date_end')->textInput()->widget(DatePicker::classname(), [
        'options' => ['placeholder' => 'Выберите дату и время'],
        'pluginOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-mm-dd 00:00:00',
        ]
    ]) ?>

    <?= $form->field($model, 'product_id')->widget(Select2::classname(), [
        'data' => \yii\helpers\ArrayHelper::map(\dvizh\shop\models\Product::find()->all(), 'id', 'name'),
        'language' => 'ru',
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]); ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'feature')->widget(Widget::className(), [
        'settings' => [
            'lang' => 'ru',
            'minHeight' => 200,
            'plugins' => [
                'fullscreen',
            ]
        ]
    ]);?>

    <div class="form-group">
        <?=\dvizh\gallery\widgets\Gallery::widget(
            [
                'label' => 'Изображение',
                'model' => $model,
                'previewSize' => '50x50',
                'fileInputPluginLoading' => true,
                'fileInputPluginOptions' => []
            ]
        ); ?>
    </div>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
