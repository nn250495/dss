<?php

namespace common\models;

use dvizh\shop\models\Product;
use Yii;

/**
 * This is the model class for table "short_discount".
 *
 * @property int $id
 * @property string $title
 * @property string $description
 * @property string $date_end
 * @property int $product_id
 * @property string $price
 * @property string $feature
 */
class ShortDiscount extends \yii\db\ActiveRecord
{
    function behaviors()
    {
        return [
            'images' => [
                'class' => 'dvizh\gallery\behaviors\AttachImages',
                'mode' => 'gallery',
                'quality' => 60,
                'galleryId' => 'discount'
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'short_discount';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'product_id', 'price'], 'required'],
            [['description', 'feature'], 'string'],
            [['date_end'], 'safe'],
            [['product_id'], 'integer'],
            [['price'], 'number'],
            [['title'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Название акции',
            'description' => 'Описание акции',
            'date_end' => 'Дата окончания',
            'product_id' => 'Товар',
            'price' => 'Новая цена',
            'feature' => 'Описание плюсов акции',
        ];
    }

    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }
}
