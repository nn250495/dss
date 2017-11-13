<?php
namespace common\components;

use common\models\Settings as SettingsModel;

class Settings extends \Yii\Base\Component
{
    public function get($key)
    {
        $setting = SettingsModel::find()->where(['key' => $key])->one();

        return !empty($setting) ? $setting->value : '';
    }

    public function set($key, $value)
    {
        $setting = SettingsModel::find()->where(['key' => $key])->one();
        $setting->value = (string)$value;

        return $setting->save();
    }
}