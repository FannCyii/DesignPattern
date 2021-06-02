//
//  BridgePattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/9/9.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*桥梁模式  （又称接口模式）
 
 Bridge Pattern
 
 Decouple an abstraction from its implementation so that the two can vary indenpendently.
 将抽象和现实解构，使得两者可以独立变化
这里的抽象和现实，不一定是接口与实现，也可以指框架代码和具体库
 */


/*
 
 场景模拟
 Abstraction   抽象角色
 Implementor   实现变化角色
 RefinedAbstraction 修正抽象觉得
 ConcreteImplementor 具体实现变化角色
 
 
 桥梁模式的主要目的就是类间解耦，将场景系列类 Abstraction 和 系列类Implementor进行解耦，分别让它们依赖于它们各自的抽象，然后让他们的抽象处理它们之间的关联关系，只要这个两个抽象不变，它们的其他子类随意变动扩展也对现有逻辑影响不大。
 */


//系列类一
fileprivate protocol Implementor {
    func doSomething();
    func doOtherthings();
}

fileprivate class concreteImplementor1:Implementor{
    func doSomething(){
        print("concreteImplementor1 do something")
    }
    func doOtherthings(){
        print("concreteImplementor1 do other things")
    }
}

fileprivate class concreteImplementor2:Implementor{
    func doSomething(){
        print("concreteImplementor2 do something")
    }
    func doOtherthings(){
        print("concreteImplementor2 do other things")
    }
}

//系列类二
fileprivate class Abstraction{
    private let doThingsImp:Implementor;
    init(_ imp:Implementor) {
        self.doThingsImp = imp
    }
    
    func impDoSomething(){
        self.doThingsImp.doSomething();
//        self.doThingsImp.doOtherthings();
    }
    
    func fetchDoThingsImp() -> Implementor{
        return self.doThingsImp;
    }
}

fileprivate class RefineAbstraction:Abstraction{
    override init(_ imp: Implementor) {
        super.init(imp)
    }
    
    override func impDoSomething() {
        super.impDoSomething();
    }
}



class BrigePattern{
    func mainRun(){
        let cimpl1 = concreteImplementor1();
        let cimpl2 = concreteImplementor2();
        
        let refineAbstraction1 = RefineAbstraction(cimpl1);
        let refineAbstraction2 = RefineAbstraction(cimpl2);
        
        refineAbstraction1.impDoSomething();
        refineAbstraction2.impDoSomething();
    }
}




/*
 继承有继承的缺点，桥梁模式就很好的解决了继承的缺点。
 
 */












