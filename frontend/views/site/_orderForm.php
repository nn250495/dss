<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
?>
<?php if(Yii::$app->session->hasFlash('orderError')) { ?>
    <?php
    $errors = Yii::$app->session->getFlash('orderError');
    $orderModel->addErrors(unserialize($errors));
    ?>
<?php } ?>
<div class="dvizh_order_form">
    <?php $form = ActiveForm::begin(['action' => Url::toRoute(['/order/order/create'])]); ?>
    <input type="hidden" name="<?= Yii::$app->request->csrfParam; ?>" value="<?= Yii::$app->request->csrfToken; ?>" />

    <div class="row">
        <div class="col-lg-12"><?= $form->field($orderModel, 'client_name')->textInput(['placeholder' => 'ФИО', 'class' => ''])->label(false) ?></div>
        <div class="col-lg-12"><?= $form->field($orderModel, 'address')->textInput(['placeholder' => 'Адрес', 'class' => ''])->label(false) ?></div>
        <div class="col-lg-12"><?= $form->field($orderModel, 'phone')->textInput(['placeholder' => 'Телефон', 'class' => ''])->label(false) ?></div>
        <div class="col-lg-12"><?= $form->field($orderModel, 'email')->textInput(['placeholder' => 'Email', 'class' => ''])->label(false) ?></div>
        <div class="col-lg-12"><?= $form->field($orderModel, 'comment')->textArea(['class' => '', 'placeholder' => 'Комментарий'])->label(false) ?></div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <?= Html::submitButton(Yii::t('order', 'Create order'), ['class' => 'bttn']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</div>