//
//  VisitorPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/5.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 访问者模式
 
 Visitor Pattern
 
 Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation withoout changing the classes of the elements on which it operates.
 
 封装一些作用于某种数据结构中的歌元素的操作，他可以在不改变数据结构的前提下定义作用于这些元素的新的操作。
 
 */

/*
 模拟场景
 
 Visitor 抽象访问者
 ConcreteVisitor 具体访问者
 Element 抽象元素
 ConcreteElement 具体元素
 ObjectStruture 结构体对象
 

 */


fileprivate protocol Elemment {
    func dosomething()
    func accept(visitor:IVisitor)
}

fileprivate class ConcreteElement1: Elemment{
    func dosomething() {
        print("ConcreteElement 1")
    }
    func accept(visitor:IVisitor) {
        visitor.visit(element: self)
    }
}

fileprivate class ConcreteElement2: Elemment{
    func dosomething() {
        print("ConcreteElement 2")
    }
    func accept(visitor:IVisitor) {
          visitor.visit(element: self)
    }
}

fileprivate protocol IVisitor {
    func visit(element:ConcreteElement1) //这里是背离了依赖倒置原则，都应该依赖抽象
    func visit(element:ConcreteElement2)
    
    func visitorOperation()
}


fileprivate class Vistor1:IVisitor{
    private var logString = ""
    
    func visitorOperation() {
        print("print visit log:\(logString)")
    }
    
    func visit(element: ConcreteElement2) {
        element.dosomething()
        logString += "ConcreteElement2 log/\n"
    }
    
    func visit(element: ConcreteElement1) {
        element.dosomething()
        logString += "ConcreteElement1 log/\n"
    }
    
}



fileprivate class ObjectStructure{//相当于一个容器 存放着各种element
    
    func createObject()->Elemment
    {
        if arc4random()%100 > 50 {
            return ConcreteElement1()
        }else{
            return ConcreteElement2()
        }
    }
}


class VisitorPatternClient{
    func mainRun(){
        let objects = ObjectStructure()
        let visitor = Vistor1()
        for _ in 1...10 {
            let element = objects.createObject()
            element.accept(visitor: visitor)
        }
        
        visitor.visitorOperation()
    }
}



/*
 优缺点
 
 优点：
 1 符合职责单一原则，
 2 优秀的扩展性
 3 灵活性非常高
 
 缺点
 
 1 具体元素对访问者公布细节，不符合迪米特法则
 2 具体元素变更比较困难
 3 背离了依赖倒置原则
 
 使用场景：
 1 对象结构包含很多不同的类对象，他们有不同的接口，而你想对这些对象实施一些依赖于具体类的操作，也就是说 迭代器模式不能胜任的场景
 2 需要对对象结构中的对象进行很多不同且不相干的操作，而你想避免让这些操作 “污染”这些对象类

 
 
 .... 访问者模式 是双分派，
还有但分派 了解下。。。
 
 */




