<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
?>

<?php $form = ActiveForm::begin([
    'action' => Url::toRoute(['/mail/send']),
    'validationUrl' => Url::toRoute(['/mail/validation']),
    'enableAjaxValidation' => true,
    'options'=>[
        'id' => 'contactFormModal',
    ],
]); ?>

<?= $form->field($model, 'name')->label(false)->textInput([
    'required' => true,
    'placeholder' => 'Ваше Имя',
    'class' => ''
])?>
<?= $form->field($model, 'email')->label(false)->textInput([
    'required' => true,
    'placeholder' => 'E-mail или телефон',
    'class' => ''
])?>
<?= $form->field($model, 'body')->label(false)->textarea([
    'required' => true,
    'placeholder' => 'Сообщение',
    'rows' => 4,
    'class' => ''
])?>

<?php echo Html::submitButton('Отправить', ['name' => 'contact-button', 'class' => 'bttn']) ?>

<?php ActiveForm::end(); ?>