//
//  ObserverPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/1.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 观察者模式
 Observer Pattern
 
 Define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
 定义对象间一对多的依赖关系，使得每当一个对象改变状态，则所有的依赖于它的对象都会得到通知并被自动更新。

 */

/*
 场景
 Subject 被观察者
 Observer 观察者
 ConcreteSubject  具体的被观察者
 ConcreteObserver 具体的观察者
 
 */

fileprivate protocol Subject{
//    associatedtype Element
    
    var observers:Dictionary<String,Observer>{get set}

}

extension Subject{
    
    mutating func addObserver(observer:Observer,identifier:String){
        observers[identifier] = observer
    }
    
    mutating func removeObserverWith(identifier:String){
        observers.removeValue(forKey: identifier)
    }
    
    func notifyObservers(message:String){
        for (_,value) in observers{
            value.updateMessage(message: message)
        }
    }
}


fileprivate protocol Observer{
    func updateMessage(message:String)
}

fileprivate class ConcreteSubject:Subject{
    var observers: Dictionary<String, Observer> = [:]
    func subjectDosomething0(){
        notifyObservers(message: "do something 0")
    }
    
    func subjectDosomething1(){
        notifyObservers(message: "do something 1")
    }
    
    func subjectDosomething2(){
        notifyObservers(message: "do something 2")
    }
}

fileprivate class ConcreteObserver:Observer{
    func updateMessage(message: String) {
        print("观察者0收到通知：\(message)")
    }
}

fileprivate class ConcreteObserver1:Observer{
    func updateMessage(message: String) {
        print("观察者1收到通知：\(message)")
    }
}

fileprivate class ConcreteObserver2:Observer{
    func updateMessage(message: String) {
        print("观察者2收到通知：\(message)")
    }
}

class ObserverPatternClient
{
    func mainRun(){
        var subject = ConcreteSubject()
        let observer0 = ConcreteObserver()
        let observer1 = ConcreteObserver1()
        let observer2 = ConcreteObserver2()
        
        subject.addObserver(observer: observer0, identifier: "id.observer0")
        subject.addObserver(observer: observer1, identifier: "id.observer1")
        subject.addObserver(observer: observer2, identifier: "id.observer2")
        
        subject.subjectDosomething0()
        subject.subjectDosomething1()
        subject.subjectDosomething2()
    }
}


/*
 
 相当于实现了一个简单的通知系统，类似 NSNotification
 
 优缺点
 
 优点：
 1 观察者和被观察者之间是抽象耦合
 2 建立了一套触发机制
 
 缺点：
 需要考虑开发的效率和运行效率的问题，通常使用异步执行，
 
 注意：1 广播链问题，多个观察者和被观察者之间可以形成一个链
      2 异步处理问题
 
 通常使用场景
 1 关联行为场景
 2 时间多级触发场景
 3 跨系统的消息交换场景，如消息队列的处理机制
 
 
 真实的观察者要解决的问题
 1 观察者和被观察者之间的消息传递
 2 观察者的响应方式，可能同时接受了多个消息，该如何快速的响应
 3 被观察者尽量自己做主
 
 */


































