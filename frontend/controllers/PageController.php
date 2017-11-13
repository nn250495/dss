<?php
namespace frontend\controllers;

use Yii;
use common\models\Page;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class PageController extends Controller
{
    public function actionView($slug)
    {
        if(!$model = Page::findOne(['slug' => $slug])) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
        
        return $this->render('view', [
            'model' => $model,
        ]);
    }
}
