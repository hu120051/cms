<?php


namespace app\index\controller;


use app\admin\BaseController;
use think\facade\View;

class Index extends BaseController
{
    public function index()
    {
        return View::fetch('index');
    }
}