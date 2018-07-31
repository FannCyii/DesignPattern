//
//  ChainOfResponsibilityPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/19.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


/**
 责任链模式：
 
 Avoid coupling the sender of a request to its receiver by giving more than on object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.
 
 使用多个对象都有机会处理请求，从而避免了请求的发送者和接收者之间的耦合关系。将这些对象连成一条链，并沿着这条链传递该请求，直到有对象处理它为止。
 **/

/*
 结构定义：
 client 场景
 Handler 接收者
 Request 请求者

 */

//条件封装类， 表示责任内容
class HandleCondition{
    var level:Int
    init(level:Int) {
        self.level = level
    }
}

//接收者，处理请求的基类，这里使用模板方法模式
class Handler{
    var nextHanler:Handler?
    //是否是我的责任类的请求
    func canHandle(level:HandleCondition)->Bool{
        return false
    }
    //handling....
    func doSomething(request:Request){
        
    }
    
    func handleMessage(req:Request){
        if !canHandle(level: req.level){
            nextHanler?.handleMessage(req: req)
        }else{
            doSomething(request: req)
        }
    }
}

//请求
class Request{
    let message:String
    let level:HandleCondition
    init(mes:String,lev:HandleCondition) {
        message = mes
        level = lev
    }
}

class concreteHandler1:Handler{
    override func canHandle(level: HandleCondition) -> Bool {
        if level.level == 0 {
            return true
        }
        print("handler1:can not handle level\(level.level)")
        return false
    }
    override func doSomething(request:Request){
        print("handler1-done:\(request.message)")
    }
}

class concreteHandler2:Handler{
    override func canHandle(level: HandleCondition) -> Bool {
        if level.level == 1 {
            return true
        }
        print("handler2:can not handle level\(level.level)")
        return false
    }

    override func doSomething(request:Request){
        print("handler2-done:\(request.message)")
    }
}

class concreteHandler3:Handler{
    override func canHandle(level: HandleCondition) -> Bool {
        if level.level == 2 {
            return true
        }
        print("handler3:can not handle level\(level.level)")
        return false
    }

    override func doSomething(request:Request){
        print("handler3-done:\(request.message)")
    }
}

//组成响应者链，如果不要此类 这创建链放在场景类中
class ResponChain{
    let handler1 = concreteHandler1()
    let handler2 = concreteHandler2()
    let handler3 = concreteHandler3()
    init() {
        handler1.nextHanler = handler2
        handler2.nextHanler = handler3
    }
    
    func respons(req:Request){
        handler1.handleMessage(req: req)
    }
}

class ChainResponsibilityClient{
    func mainRun(){
        
        let request1 = Request.init(mes: "Amazing 1", lev: HandleCondition(level: 1))
        let request2 = Request.init(mes: "wonderful 2", lev: HandleCondition(level: 2))
        let request3 = Request.init(mes: "wonderful 3", lev: HandleCondition(level: 3))
        
        let chain = ResponChain()
        //响应第一个请求
        chain.respons(req: request1)
        //响应第二个请求
        chain.respons(req: request2)
        //响应第三个请求
        chain.respons(req: request3)
    }
}


/**
 责任链的优点：
 请求和处理完全分开
 缺点：
 当链比较长的时候可能会出现性能问题，同时调试其他可能比较困难
 
 **/








