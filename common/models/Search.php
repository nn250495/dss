<?php

namespace common\models;

use Yii;

class Search extends \yii\db\ActiveRecord
{
    public $search;

    public function rules()
    {
        return [
            [['search'], 'string'],
        ];
    }
}
