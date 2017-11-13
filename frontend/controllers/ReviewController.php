<?php
namespace frontend\controllers;

use common\models\Review;
use Yii;
use yii\web\Controller;
use yii\web\Response;
use yii\bootstrap\ActiveForm;

class ReviewController extends Controller
{
    public function actionCreate()
    {
        $model = new Review();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->getSession()->setFlash('success', 'Отзыв добавлен');

            return $this->redirect(Yii::$app->request->referrer);
        } else {
            Yii::$app->getSession()->setFlash('danger', 'Не удалось добавить отзыв');
        }

        return $this->redirect(Yii::$app->request->referrer);
    }

    public function actionValidate()
    {
        $model = new Review();
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;

            return ActiveForm::validate($model);
        }

        return [];
    }
}
