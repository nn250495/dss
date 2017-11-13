<?php
namespace frontend\controllers;

use Yii;
use common\models\News;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\data\Pagination;

/**
 * NewsController implements the CRUD actions for News model.
 */
class NewsController extends Controller
{
    public function actionIndex()
    {
        $perpage = 9;
        
        $newsFind = News::find()->orderBy('id DESC');
        
        $pagination = new Pagination([
            'defaultPageSize' => $perpage,
            'totalCount' => $newsFind->count(),
        ]);

        $newsFind->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();
        
        return $this->render('index', [
            'news' => $newsFind->all(),
            'pagination' => $pagination,
        ]);
    }

    public function actionView($slug)
    {
        if(!$model = News::findOne(['slug' => $slug])) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
        
        return $this->render('view', [
            'model' => $model,
        ]);
    }
}
