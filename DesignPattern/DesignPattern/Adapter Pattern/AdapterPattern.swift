//
//  AdapterPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/26.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


/*
 *适配器模式、变压器模式 （是包装模式的一种，包装模式还有 装饰模式）
 *
 *Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn't otherwise because of incompatible interfaces
 *将一个类的接口变换成客户端所期待的另一种接口，从而是本接口不匹配而无法在一起工作的两个类能够在一起工作
 ****/


/*
 适配器模式
 
 Target 需要适配的目标
 Adaptee 被适配的目标
 
 ConcreteTarget 当前正在运行的对象
 ConcreteAdaptee 当前正在运行的另一个对象
 
 Adapter 适配器对象
 
 
 现在就需要将 ConcreteTarget 和 ConcreteAdaptee进行适配
 */

protocol Target {
    func request();
}

protocol Adaptee {
    func anotherRequest();
}

class ConcreteTarget:Target{
    func request() {
        print("原有逻辑正在运行")
    }
}

class ConcreteAdaptee:Adaptee{
    func anotherRequest() {
        print("原有另一条逻辑正在运行")
    }
}

//确实装饰模式有点像，将Target 和Adaptee进行适配
class Adapter: Target, Adaptee{
    func request() {
        print("进行了适配")
        anotherRequest()
    }
    func anotherRequest() {
        print("原有另一条逻辑正在运行")
    }
}

class AdapterClient{
    func mainRun(){
        
        var target:Target
        //原有逻辑
        target = ConcreteTarget()
        target.request()
        
        //适配后的逻辑
        target = Adapter()
        target.request()
        
    }
}


/*
 适配器模式的优缺点：
 
 优点：
 1 适配器模式可以让两个没有任何关系的类在一起运行，只要适配器这个角色能够搞定他们
 2 增加了类的透明性
 3 提高了类的复用度，当前角色在自己的业务中k运行的很好，也可以在其他业务中充当其他角色
 4 灵活性非常好，如b某天不想要这个适配器了，删掉即可，其他代码不用修改
 
 适配器模式适用于解决当前系统的问题的，是一种补偿模式，而不是在需求设计阶段使用的。s项目一定要准守依赖导致原则和历史替换原则，否则即使合适的使用了适配器模式，也会带来很大的改动
 
 
 使用继承的方式来实现适配器模式 属于 “类适配器模式”
 还有使用组合的方式来实现 “对象适配器模式”
 
 */
