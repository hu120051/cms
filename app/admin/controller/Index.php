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
     * 物料
     *
     * @return string
     */
    public function material()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('material');
    }

    /**
     * 物料出库
     *
     * @return string
     */
    public function bring()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('bring');
    }

    /**
     * 物料入库
     *
     * @return string
     */
    public function purchase()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('purchase');
    }

    /**
     * 评审表记录
     *
     * @return string
     */
    public function appraisal()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('appraisal');
    }

    /**
     * 产品管理
     *
     * @return string
     */
    public function product()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('product');
    }

    /**
     * 产品入库
     *
     * @return string
     */
    public function productin()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('productin');
    }

    /**
     * 产品配料表
     *
     * @return string
     */
    public function ingredient()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('ingredient');
    }

    /**
     * 添加出库单
     *
     * @return string
     */
    public function add()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('add');
    }

    /**
     * 售出产品
     *
     * @return string
     */
    public function sale()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('sale');
    }

    /**
     * 供应商管理
     *
     * @return string
     */
    public function supplier()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('supplier');
    }

    /**
     * 客户管理
     *
     * @return string
     */
    public function client()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('client');
    }

    /**
     * 物料出入库查询
     *
     * @return string
     */
    public function check()
    {
        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('check');
    }
}
