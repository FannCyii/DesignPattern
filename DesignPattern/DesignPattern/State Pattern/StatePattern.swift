//
//  StatePattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/16.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 状态模式
 Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.
 当一个对象内部状态改变时允许其改变行为，这个对象看起来像改变了其类。
 
 */


/*
 状态模式的核心是封装
 
 场景模拟
 
 State  抽象状态类
 ConcreteState 具体状态类
 Context 环境类
 */

fileprivate protocol State{
    var context:Context?{get set}
    mutating func setContext(context:Context)
    func handle1()  //表示状态1
    func handle2()  //表示状态2
    //... other handle...
}

extension State{
    mutating func setContext(context:Context){
        self.context = context
    }
    
    func handle1(){
        
    }
    func handle2(){
        
    }
    func handle3(){
        
    }
}

fileprivate class Context{
    
    
    static let STATE1 = ConcreteState1()
    static let STATE2 = ConcreteState2()
    static let STATE3 = ConcreteState3()
    
    var _currentState:State?
    var currentState:State?{
        get{
            return _currentState
        }
        set(newState){
            _currentState = newState
            _currentState?.setContext(context: self)
        }
    }
    
    func thisIsDelegateHandle1(){
        self.currentState?.handle1();
    }
    
    func thisIsDelegateHandle2(){
        self.currentState?.handle2()
    }
    
    func thisIsDelegateHandle3(){
        self.currentState?.handle3()
    }
}


fileprivate class ConcreteState1:State{
    var context: Context?
    
    func handle1() {
        print("handle1 :doing doing sha?")
    }
    
    func handle2() {
        context?.currentState = Context.STATE2
        context?.thisIsDelegateHandle2()
    }
}

fileprivate class ConcreteState2:State{
    var context: Context?
    
    func handle1() {
        context?.currentState = Context.STATE1
        context?.thisIsDelegateHandle1()
    }
    
    func handle2() {
        print("handle2 :doing doing sha?")
    }
    
    
}

fileprivate class ConcreteState3:State{
    var context: Context?
    
    func handle1() {
        context?.currentState = Context.STATE1
        context?.thisIsDelegateHandle1()
    }
    
    func handle3() {
        print("handle3 :doing doing sha?")
    }
    
    
}


class StatePatterClient{
    func mainRun(){
        let context = Context()
        context.currentState = Context.STATE1//设置一个初始值
        
        context.thisIsDelegateHandle1()
        context.thisIsDelegateHandle2()
        
        context.thisIsDelegateHandle3()//此时不满足handle3的执行条件 顾没有执行结果
    }
}


/*
 优缺点
 
 结构清晰：
 1 避免过多的if ...else/switch...case
 
 遵循设计原则
 很好的实现了开闭原则 和职责单一原则
 
 封装性好
 这个也是状态模式的基本要求 ，状态改变放置到累的内部来实现，外部的调用不知道类内部如何实现状态和欣慰的变化
 
 
 缺点：
 当状态过多时 会出现子类膨胀
 
 
 使用场景
 1 行为随状态改变而改变的场景
 2 条件分支判断语句的替代者
 
 
 
 */















