<?php
namespace app\admin;


use think\App;

/**
 * 控制器基础类
 */
abstract class BaseController
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;
    protected $module;
    protected $controller;
    protected $action;


    //主键key
    protected $pk = '';
    //表名称
    protected $table = '';
    //主键value
    protected $pk_value = '';


    /**
     *后台简单的身份判断
     *
     * @return void
     */
    public function access()
    {
        if (cookie('access')!='pass') {
            return '123';
        }
    }
}
