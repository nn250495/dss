<?php
namespace common\models;

use Yii;
use yii\base\Model;

class Mail extends Model
{
    public $name;
    public $email;
    public $body;

    public function rules()
    {
        return [
            [['name', 'email', 'body'], 'required'],
            [['name', 'email', 'body'], 'string'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'name' => 'Ваше Имя',
            'email' => 'E-mail или телефон',
            'body' => 'Сообщение',
        ];
    }
    public function sendEmail()
    {
        Yii::$app->mailer->compose()
            ->setTo(Yii::$app->settings->get('email'))
            ->setFrom(['send.nethammer@gmail.com' => Yii::$app->settings->get('sitename')])
            ->setSubject('Новое сообщение')
            ->setHtmlBody('На сайте "'.Yii::$app->settings->get('sitename').'" заполнена форма обратной связи. <br> Имя: '.$this->name.' <br> Email / телефон: '.$this->email.' <br> Сообщение: '.$this->body.'<br>')
            ->send();

        return true;
    }
}
