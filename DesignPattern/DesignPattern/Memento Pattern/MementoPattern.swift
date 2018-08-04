//
//  MementoPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/4.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 备忘录模式
 Memento Pattern
 Without violating encapsulation , capture and externalize an object's internal state so that the object can be restored to this state later.
 在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。这样以后就可以将该对象恢复到原先保存状态。
 
 
 */


/*
 场景模拟：标准备忘录模式
 
 
 Originator 需要备忘的对象
 Memento 备忘录
 Caretaker 备忘录管理者

 
 
 */



fileprivate class Originator{
    
    private lazy var oState = ""
    
    var state:String{
        get {
            return oState
        }
        set(newState){
            oState = newState
        }
    }
    
    func createAMemento() -> Memento{
        return Memento(state: self.state)
    }
    
    func restoreMemento(memento:Memento){
        state = memento.state
    }
    
    func printState(){
        print(self.state)
    }
}

fileprivate class Memento{
    private lazy var oState = ""
    
    var state:String{
        get {
            return oState
        }
        set(newState){
            oState = newState
        }
    }
    
    init(state:String) {
        oState = state
    }
}

fileprivate class Caretaker{
    var memento:Memento
    init(memento:Memento) {
        self.memento = memento
    }
    
}


class MementoPatterClient
{
    func mainRun(){
        let originator = Originator()
        //对象原始状态
        originator.state = "happy"
        originator.printState()
        //创建备忘录
        let caretaker = Caretaker(memento: originator.createAMemento())
        //对象状态修改
        originator.state = "unhappy"
        originator.printState()
        //恢复备忘录
        originator.restoreMemento(memento: caretaker.memento)
        originator.printState()
    }
}


/*
 
 
使用场景
 1 需要保存和备份数据的相关状态的场景
 2 提供一个可回滚的操作
 3 需要监控的副本场景
 4 数据库连接的事务管理就是用的备忘录模式
 
注意事项
 
 1 需要管理备忘录的生命周期
 2 备忘录的性能问题
 
 
 1 虽然备忘录模式的定是将备忘录存放到对象以外，但是对于不同的场景，可以将备忘录存储在对象内部。
 2 备忘录的管理者存在，是视具体情况而定的。同时也可以修改管理者让其能够存储多种状态，或者多种类型的备忘录。
 3 一般对象的备忘录只允许该对象访问，而其他对象不能访问，这是可以使用“双接口设计” （一个接口提供多功能，一个空接口），让备忘录管理者使用空接口来存储备忘录
 
 */




