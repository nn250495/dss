<?php

namespace common\models;

use dvizh\shop\models\Product;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "shop_review".
 *
 * @property int $id
 * @property int $product_id
 * @property string $name
 * @property string $comment
 * @property int $rate
 * @property string $created_at
 */
class Review extends \yii\db\ActiveRecord
{
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => 'created_at',
                ],
                'value' => function() {
                    return date('Y-m-d H:i:s');
                },
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'shop_review';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['product_id', 'name', 'rate'], 'required'],
            [['product_id', 'rate'], 'integer'],
            [['comment'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['created_at'], 'safe'],
            [[], \himiklab\yii2\recaptcha\ReCaptchaValidator::className(), 'secret' => '6LcMPTgUAAAAAAsu_j_3bNya1edaHWkpAMXP_U2g'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'product_id' => 'Товар',
            'name' => 'Имя',
            'comment' => 'Комментарий',
            'rate' => 'Оценка',
            'created_at' => 'Дата создания',
        ];
    }

    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }

    public static function getReviews($productId)
    {
        return self::find()->where(['product_id' => $productId])->orderBy('created_at DESC')->all();
    }

    public static function getCountReviews($productId)
    {
        return self::find()->where(['product_id' => $productId])->count();
    }

    public static function getRating($productId)
    {
        $reviews = self::getReviews($productId);
        if(empty($reviews)) {
            return 0;
        }
        $rating = 0;
        foreach($reviews as $review) {
            $rating += (int)$review->rate;
        }

        return $rating / count($reviews);
    }

    public static function getRatingAsStars($productId, $rating = null)
    {
        if($rating == null) {
            $rating = self::getRating($productId);
        }

        $return = '';
        for($i = 1; $i <= 5; $i++) {
            if($rating >= $i) {
                $return .= '<span class="star-rating"><i class="fa fa-star"></i></span>';
            } elseif($rating > ($i - 1) && $rating < $i) {
                $return .= '<span class="star-rating"><i class="fa fa-star-half-o"></i></span>';
            } else {
                $return .= '<span class="star-rating"><i class="fa fa-star-o"></i></span>';
            }
        }

        return $return;
    }
}
