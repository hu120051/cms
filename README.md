# <p align="center">库存管理系统</p>

<p align="center">
    <img src="https://svg.hamm.cn/badge.svg?key=Base&value=ThinkPHP6"/>
    <img src="https://svg.hamm.cn/badge.svg?key=Data&value=MySQL5.7"/>
    <img src="https://svg.hamm.cn/badge.svg?key=Runtime&value=PHP7.1"/>
    <img src="https://svg.hamm.cn/badge.svg?key=License&value=Apache-2.0"/>
</p>

## 相关介绍

- 部署时请向数据库配置文件my.ini中[mysqld]中添加  sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES  配置，否则可能出现错误
- 安装依赖库：composer install

## 其他说明

~~~
创建数据库cms(utf8)，导入数据库cms.sql
Clone或下载本仓库zip包，配置站点和ThinkPHP伪静态
复制.example.env到.env 修改自己的数据库配置
~~~

## 基于thinkphp6.0

请保证php版本7.1+<br>
[tp6完全开发手册](https://www.kancloud.cn/manual/thinkphp6_0/content)