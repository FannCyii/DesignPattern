//
//  FacadePattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/2.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


/*
 门面模式（外观模式）
 
 Facade Pattern
 
 Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.
 要求一个子系统的外部与其内部的通行必须通过一个统一的对象进行，门面模式提供一个高层次的接口，使得子系统更易于使用。
 
 */

/**
 有点像 包装模式
 
 场景：
 
 Facade 门面角色,自己并不实现业务逻辑，只是一个委托类
 SubSystem  子系统，可能有n个各部相关的子系统
 
 */


fileprivate class SubSystem1{
    func subsystem1Dosomething(){
        print("do something1")
    }
}

fileprivate class SubSystem2{
    func subsystem2Dosomething(){
        print("do something2")
    }
    func subSystemWith(sys:SubSystem1){
        print("system2 and system1 do something")
        sys.subsystem1Dosomething()
    }
}

fileprivate class SubSystem3{
    func subsystem3Dosomething(){
        print("do something3")
    }
}

fileprivate class ContextClass{
    let subsys1 = SubSystem1()
    let subsys2 = SubSystem2()
    func sys1and2Dosomething(){
        subsys1.subsystem1Dosomething();
        subsys2.subSystemWith(sys: subsys1);
    }
}

fileprivate class Facade {
    
    let subsys1 = SubSystem1()
    let subsys2 = SubSystem2()
    let subsys3 = SubSystem3()
    let context = ContextClass()
    
    func methodA(){
        subsys1.subsystem1Dosomething();
    }
    func methodB() { //这种方式是错误的，不符合门面模式，在门面模式中是不能写入业务逻辑的。应该使用methodD
        subsys1.subsystem1Dosomething();
        subsys2.subSystemWith(sys: subsys1);
    }
    func methodC(){
        subsys3.subsystem3Dosomething();
    }
    
    func methodD(){
        context.sys1and2Dosomething();
    }
}

class FacadePAtternClient{
    func mainRun(){
        //客户只需要知道门面即可，后台是怎么执行的，谁执行的都无需关心
        let facade = Facade()
        facade.methodA()
//        facade.methodB() //错误方法
        facade.methodC()
        facade.methodD();
    }
}


/*
 优缺点
 
优点：
 1 减少系统间的相互依赖，内部系统和外部系统相互不依赖
 2 提高了灵活性，内部随便变化，只要不影响门面
 3 提高安全性
 
 缺点：
 完全抛弃了开闭原则
 
 使用场景
 1 为一个复杂的系统提供一个外部访问的接口
 2 子系统相对独立，对其他系统只提供黑箱操作
 3 接口隔离，如让低水平开发人员限定在一个子系统中开发，只提供一个门面给外部使用，降低其对整体项目的影响风险

 
 注意事项：
 
 1 一个子系统可以有多个门面
 2 门面模式不参与子系统的业务逻辑，只是对子系统的封装接口转发。如上述methodB，那如何解决呢，可以增加一个封装类，在封装类中完成所需要的逻辑，再由门面来委托。
 
 
 */

















