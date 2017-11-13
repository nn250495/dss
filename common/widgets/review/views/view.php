<?php
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
?>

<?php $form = ActiveForm::begin([
    'action' => Url::to(['/review/create']),
    'validationUrl' => Url::toRoute(['/review/validate']),
    'enableAjaxValidation' => true,
    'options' => [
        'class' => 'add-comment'
    ]
]); ?>
<div class="h4">Добавить комментарий</div>
<div class="row">
    <?=$form->field($model, 'product_id')->label(false)->hiddenInput()?>
    <div class="col-sm-6">
        <?=$form->field($model, 'name', [
            'template' => '{input}{error}',
            'inputOptions' => [
                'class' => '',
            ],
            'options' => [
                'class' => ''
            ]
        ])->textInput(['placeholder' => 'Ваше имя'])->label(false);?>
    </div>
    <div class="col-sm-6">
        <div class="pro-rating" data-role="review-form-stars-container">
            <a href="#" data-value="1" data-role="review-form-star"><i class="fa fa-star-o"></i></a>
            <a href="#" data-value="2" data-role="review-form-star"><i class="fa fa-star-o"></i></a>
            <a href="#" data-value="3" data-role="review-form-star"><i class="fa fa-star-o"></i></a>
            <a href="#" data-value="4" data-role="review-form-star"><i class="fa fa-star-o"></i></a>
            <a href="#" data-value="5" data-role="review-form-star"><i class="fa fa-star-o"></i></a>
        </div>
        <?=$form->field($model, 'rate')->label(false)->hiddenInput(['template' => '{input}{error}', 'data-role' => 'rating-form-rateinput'])?>
    </div>
</div>
<?=$form->field($model, 'comment', [
    'template' => '{input}{error}',
    'inputOptions' => [
        'class' => '',
    ],
    'options' => [
        'class' => ''
    ]
])->textarea(['placeholder' => 'Ваш комментарий'])->label(false);?>
<?= \himiklab\yii2\recaptcha\ReCaptcha::widget([
    'name' => 'reCaptcha',
    'siteKey' => '6LcMPTgUAAAAAMfg_rx00gENXhjt0X4rNGPDGqjN',
]) ?>
<button class="bttn" type="submit">Отправить</button>
<?php $form::end(); ?>
