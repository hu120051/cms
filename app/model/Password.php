<?php
namespace app\model;

use think\Model;

class Password extends Model
{
    protected $pk = 'ID';

    public function login($password)
    {
        $user = $this->where([
            "ID" => "1",
        ])->find();
            //判断密码是否正确
            $password = MD5($password);
            if ($password != $user['password']) {
                return false;
            }

            return true;
    }
}