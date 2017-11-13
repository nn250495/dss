<?php
namespace frontend\controllers;

use dvizh\shop\models\Product;
use Yii;
use yii\data\Pagination;
use yii\helpers\Html;
use yii\web\Controller;

/**
 * Search controller
 */
class SearchController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionResult()
    {
        if(Yii::$app->request->get()) {
            $get = Yii::$app->request->get();
            $perpage = !empty($get['perpage']) ? $get['perpage'] : 50;
            $search = $get['search'];

            $baseProductsFind = Product::find()->where("`shop_product`.`name` LIKE '%".$search."%' OR `shop_product`.`short_text` LIKE '%".$search."%'");

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

            return $this->render('result', [
                'perpage' => (int) $perpage,
                'sort' => Html::encode($sort),
                'productsFind' => $productsFind,
                'filterProductsFind' => $productsFindForFilter,
                'pagination' => $pagination,
            ]);
        } else {
            return $this->redirect(['/site/index']);
        }
    }

}
