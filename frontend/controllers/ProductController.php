<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use dvizh\shop\models\Product;

/**
 * ProductController controller
 */
class ProductController extends Controller
{
    public function actionView($slug)
    {
        $model = Product::findOne(['slug' => $slug]);
        
        if(yii::$app->request->post('type') == 'fast-view') {
            $json = [];
            
            return json_encode(['html' => $this->renderAjax('fast-view', ['model' => $model])]);
        }
        
        return $this->render('view', [
            'model' => $model,
        ]);
    }

    public function actionFastView()
    {
        $model = Product::findOne(Yii::$app->request->get('id'));

        return $this->renderAjax('fast-view', ['model' => $model]);
    }
}
