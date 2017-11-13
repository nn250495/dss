<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use common\models\Mail;
use yii\web\Response;
use yii\bootstrap\ActiveForm;

class MailController extends Controller
{
    public function actionSend()
    {
        $pismo = new Mail();
        if($pismo->load(Yii::$app->request->post())) {
            $pismo->sendEmail();
            Yii::$app->session->setFlash('info', 'Ваше сообщение отправлено администратору сайта "'.Yii::$app->settings->get('sitename').'"');
            return $this->redirect(Yii::$app->request->referrer);
        }
        return false;
    }

    public function actionValidation()
    {
        $model = new Mail();
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;

            return ActiveForm::validate($model);
        }

        return [];
    }
}
