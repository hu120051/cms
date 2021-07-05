<?php


namespace app\test\controller;


use app\model\Material;

use think\facade\Db;


class DataModel
{
    public function index()
    {
//        $user = User::select();
//        dump($user);
//        return json($user);
        $material = new Material();
        ;
        dump($material->addmaterialstock('200002', '20'));

    }

}