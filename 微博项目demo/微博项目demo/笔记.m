//
//  笔记.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/26.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  一、为什么要自定义UITabBarController
 1.想罢UITabBarController内部的子控制器屏蔽起来，不让外界了解
 2.另外一个目的：每一段代码都应该放在最合适的地方
 
 二、重复代码的抽取
 1.相同的代码放到一个方法中
 2.不同的东西变成参数
 3.在需要用到这段代码的时地方传递参数、调用方法
 
 三、统一所有控制器导航栏左上角和右上角的内容
 1.让所有push进来的控制器，它导航栏左上角和右上角的内容都一样
 2.“拦截”所有push进来的控制器
 3.方案：自定义导航控制器，重写push方法，就可以得到传进来的控制器参数
 
 // 90%的“拦截”都是通过自定义类，重写自带的方法实现的
 
 四、代码应该放在哪个文件夹
 1.项目中有多处地方用到这段代码
 2.每一段代码都应该放在最合适的地方：这段你代码明显在创建一个UIBarButtonItem，所以跟UIBarButtonItem相关
 3.从命名习惯和规范的角度看：[UIBarButtonItem itemwith....]这种形式创建item比较规范
 */
