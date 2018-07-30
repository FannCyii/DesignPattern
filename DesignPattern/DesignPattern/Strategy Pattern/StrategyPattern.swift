//
//  StrategyPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/25.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


/*
 *策略模式
 *
 *Strategy Pattern
 *Define a family of algorithms ,encapsulate each one ,and make them interchangeable.
 *定义一组算法，将每个算法都封装起来，并且使他们之间可以互换
 *
 */

/*
 
 策略模式就是使用的面向对象的继承和多态机制,策略模式也是替换if-else的一种方式
 
 Context 封装角色，b屏蔽高层模块对策略（算法）的直接访问
 Strategy 抽象策略角色，定义每个算法必须有的方法或属性
 ConcreteStrategy 具体策略角色
 
 */


protocol Strategy {
    func operation();
}

class ConcreteStrategy1:Strategy{
    func operation() {
        print("strategy 1!")
    }
}

class ConcreteStrategy2:Strategy{
    func operation() {
        print("strategy 2!")
    }
}

class Context{
    private var strategy:Strategy?
    init(strategy:Strategy) {
        self.strategy = strategy
    }
    
    func operation(){
        self.strategy?.operation()
    }
}

class StrategyPatternClient{
    
    func mainRun(){
        var context:Context
        let strategy1 = ConcreteStrategy1()
        let strategy2 = ConcreteStrategy2()
        
        context = Context(strategy: strategy1)
        context.operation();
        context = Context(strategy: strategy2)
        context.operation();
        
        //实现加减法
        var enum1 = Calculator.add(2, 4).exe()
        print("Calculator add execute:\(enum1)")
        enum1 = Calculator.sub(2, 4).exe()
        print("Calculator sub execute:\(enum1)")
    }
}



/*
 策略模式优缺点
 
 优点：
 1 算法可以自由切换
 2 避免使用多重条件判断
 3 扩展性良好
 
 缺点：
 1 策略（算法）类数量增多
 2 所有策略类都需要对外暴露。上层模块需有哪些策略，才能决定使用哪一个策略。这也违背了迪米特法则
 
 iOS 中 自定义转场动画时，可以使用策略模式来开发，每一种动画效果就是一种策略。
 
 使用场景：
 1 多个类只有在算法或行为上稍有不同的场景
 2 算法需要自由切换的场景
 3 需要屏蔽算法规则的场景
 
 注意: 如果一个系统中的一个策略家族的具体策略数量超过4个，则需要考虑使用混合模式，解决策略类膨胀和对外暴露的问题，否则后期维护就会很麻烦。

 
 */


/*
 实例
 
 使用策略模式实现 两个数的加法和减法
 1 可以使用标准的策略模式，加法和减法算做两种算法（策略）
 2 使用 策略枚举，枚举中每一项都是一种算法
 
 */

enum Calculator {
    case add(Int,Int)
    case sub(Int,Int)
    func exe() -> Int {
        switch self {
        case .add(let a0,let b0):
            return a0+b0
        case .sub(let a0,let b0):
            return a0-b0
        }
    }
}














