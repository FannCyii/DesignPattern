//
//  DelegatePattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/10/25.
//  Copyright © 2018 cheng. All rights reserved.
//

import Foundation


/*
 Proxy Pattern
 
 Provide a surrogate or placeholder for another object to control access to it
 为其他对象提供一种代理，以控制对这个对象的访问。
 
 */


/*
 代理模式主要是为了控制对象的功能。相比其他相似的模式只是对对象功能的操作不同，如装饰模式是对对象的功能进行增强或减弱。状态模式、策略模式、访问者模式、本质上是在更特殊的场合使用了代理模式。
 */


//通用代理模式
fileprivate protocol Subject{
    func doSomething();
}


fileprivate class RealSubject:Subject{
    private let name:String
    init(_ name:String) {
        self.name = name
    }
    
    func doSomething(){
        print("subject do something")
    }
}

fileprivate class Proxy0:Subject{
    func doSomething(){
        beforeDoSomething()
        subj.doSomething()
        endDoSomething()
    }
    
    private let subj:Subject
    
    init(_ subject:Subject) {
        subj = subject
    }
    
    func beforeDoSomething() {
        print("before!")
    }
    
    func endDoSomething() {
        print("end!")
    }
}

fileprivate class commonProxyPatternClient{
    static func runFunction(){
        let sj = RealSubject("Jack");
        let proxy = Proxy0.init(sj)
        proxy.doSomething()
    }
    
}

//普通代理模式
fileprivate class Proxy1:Subject{
    private let subject :Subject
    init(_ name:String) {
        self.subject = RealSubject(name)
    }
    
    func doSomething(){
        beforeDoSomething()
        subject.doSomething()
        endDoSomething()
    }
    
    func beforeDoSomething() {
        print("Proxy1:before!")
    }
    
    func endDoSomething() {
        print("Proxy1:end!")
    }
    
}

fileprivate class normalooProxyPatternClient{
    static func runFunction(){
        let proxy = Proxy1("monkey")
        proxy.doSomething()
    }
}

//强制代理模式
fileprivate class Subject2:Subject{
    private var proxy:Subject?
    private let name:String
    init(_ name:String) {
        self.name = name
    }
    
    func getProxy()->Subject{
        self.proxy = Proxy2(self)
        return self.proxy!
    }
    
    func doSomething() {
        if self.proxy != nil{
            print("subject2： do something!")
        }else{
            print("需要指定代理才能使用！")
        }
    }

}

fileprivate class Proxy2:Subject{
    private unowned let subject :Subject2
    init(_ subject:Subject2) {
        self.subject = subject
    }
    
    func doSomething(){
        beforeDoSomething()
        subject.doSomething()
        endDoSomething()
    }
    
    func beforeDoSomething() {
        print("Proxy2:before!")
    }
    
    func endDoSomething() {
        print("Proxy2:end!")
    }
    
}

fileprivate class forceProxyPatternClient{
    static func runFunction(){
        let subject = Subject2("Tommy")
        subject.doSomething();//无法使用 非要使用代理才行
        
        let proxy = subject.getProxy()
        proxy.doSomething() //正常使用
        
        let subject2 = Subject2("Tommy")
        let proxy2 = Proxy2(subject2)
        proxy2.doSomething() //不能使用 非要使用代理才行
    }
}

//动态代理模式
fileprivate class DynamicProxyPatternClient{
    //利用反射机制进行方法调用
}

class ProxyPatternClient{
    func mainFunc(){
//        commonProxyPatternClient.runFunction()
//        normalooProxyPatternClient.runFunction()
        forceProxyPatternClient.runFunction()
    }
}


