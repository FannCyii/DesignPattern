//
//  VisitorPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/5.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

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




