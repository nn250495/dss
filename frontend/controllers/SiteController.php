<?php
namespace frontend\controllers;

use common\models\News;
use common\models\Slider;
use dvizh\order\models\Order;
use dvizh\shop\models\Producer;
use Yii;
use yii\web\Controller;
use dvizh\shop\models\Category;
use dvizh\shop\models\Product;
use frontend\models\ContactForm;

/**
 * Site controller
 */
class SiteController extends Controller
{

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $slides = Slider::find()->all();
        $brands = Producer::find()->orderBy('id DESC')->all();
        $news = News::find()->orderBy('id')->limit(2)->all();
        $popularProducts = Product::find()->where(['is_popular' => 'yes'])->all();
        $newProducts = Product::find()->where(['is_new' => 'yes'])->all();
        $promoProducts = Product::find()->where(['is_promo' => 'yes'])->all();

        return $this->render('index', [
            'slides' => $slides,
            'brands' => $brands,
            'news' => $news,
            'popularProducts' => $popularProducts,
            'newProducts' => $newProducts,
            'promoProducts' => $promoProducts,
        ]);
    }

    public function actionThanks()
    {
        $order = Order::find()->where(['id' => Yii::$app->request->get('id')])->one();

        return $this->render('thanks', ['order' => $order]);
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending email.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }
    
    public function actionCart()
    {
        return $this->render('cart');
    }
}
