<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use dvizh\shop\models\Category;
use yii\web\NotFoundHttpException;
use yii\data\Pagination;
use yii\helpers\Html;

/**
 * CategoryController controller
 */
class CategoryController extends Controller
{
    public function actionView($slug, $sort = null, $perpage = 21)
    {
        $model = Category::findOne(['slug' => $slug]);
        
        if(!$model) {
            throw new NotFoundHttpException('Плохие новости. Страница не найдена.');
        }
        
        $baseProductsFind = $model->getProducts()->available();
        
        if(Yii::$app->request->get('producer')) {
            $productsFind = $baseProductsFind->where(['producer_id' => Yii::$app->request->get('producer')]);
        } else {
            $productsFind = $baseProductsFind;
        }
        
        if(Yii::$app->request->get('filter')) {
            $filters = Yii::$app->request->get('filter');
            
            $filterParams = $productsFind->convertFilterUrl($filters);
            
            $productsFind = $productsFind->filtered($filterParams);
        }
        
        if($sort = Yii::$app->request->get('sort')) {
            $productsFind = $productsFind->joinWith(['prices']);

            if($sort == 'expensive') {
                $productsFind = $productsFind->orderBy('{{%shop_price%}}.price DESC');
            } else {
                $productsFind = $productsFind->orderBy('{{%shop_price%}}.price ASC');
            }
        }

        $pagination = new Pagination([
            'defaultPageSize' => $perpage,
            'totalCount' => $productsFind->count(),
        ]);
        
        $productsFindForFilter = clone $productsFind;
        
        $productsFind->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();
        
        return $this->render('view', [
            'model' => $model,
            'perpage' => (int) $perpage,
            'sort' => Html::encode($sort),
            'productsFind' => $productsFind,
            'filterProductsFind' => $productsFindForFilter,
            'pagination' => $pagination,
        ]);
    }
}
