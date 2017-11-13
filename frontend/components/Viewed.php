<?php
namespace frontend\components;

use yii\base\Component;
use dvizh\shop\models\Product;

class Viewed extends Component
{
    public function getList()
    {
        return [];
    }
    
    public function view(Product $product)
    {
        //
    }
}