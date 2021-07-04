<?php
namespace app\admin\controller;

use app\admin\BaseController;
use think\facade\View;



class Index extends BaseController
{
    /**
     *
     * @return string
     */
    public function index()
    {
        $error = $this->access();

        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('admin');
    }

    /**
     * 修改密码
     *
     * @return string
     */
    public function changepswd()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('changepswd');
    }

    /**
     * 成员信息
     *
     * @return string
     */
    public function userinfo()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('userinfo');
    }

    /**
     * 车辆信息
     *
     * @return string
     */
    public function carinfo()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('carinfo');
    }

    /**
     * 用车记录
     *
     * @return string
     */
    public function carlog()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('carlog');
    }

    /**
     * 申请审批
     *
     * @return string
     */
    public function approval()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('approval');
    }

    /**
     * 车辆监控
     *
     * @return string
     */
    public function location()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('location');
    }

    /**
     * 事故处理
     *
     * @return string
     */
    public function emergency()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('emergency');
    }
}
