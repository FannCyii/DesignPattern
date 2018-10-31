//
//  MediatorPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/10/31.
//  Copyright © 2018 cheng. All rights reserved.
//

import Foundation


/*
 中介者模式
 Mediator Pattern
 
 Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it lets you vary their interaction independently.
 
 用一个中介对象封装一系列的对象交互，中介者使个对象不需要显示的相互作用，从而时期耦合松散，而且可以独立地改变它们之间的交互。
 
 */

/*
 场景模拟
 
 抽象中介者 AbstractMediator
 具体中介者 ConcreteMediator
 业务模块  BusinessMoudel
 */


fileprivate protocol AbstractMediator{
    var moudel1:BusinessMoudel1?{get set}
    var moudel2:BusinessMoudel2?{get set}
    var moudel3:BusinessMoudel3?{get set}

    func dosomething1();
    func dosomething2();
    func dosomething3();
}

fileprivate class ConcreteMediator:AbstractMediator{
    var moudel1:BusinessMoudel1?
    var moudel2:BusinessMoudel2?
    var moudel3:BusinessMoudel3?
    
    //个模块交互 处理
    func dosomething1(){
        moudel2?.moudel2dosomething002()
        moudel3?.moudel3dosomething002()
    }
    func dosomething2(){
        moudel1?.moudel1dosomething002()
        moudel3?.moudel3dosomething002()
    }
    func dosomething3(){
        moudel1?.moudel1dosomething002()
        moudel2?.moudel2dosomething002()
    }
}

fileprivate protocol Moudel{
    var mediator:AbstractMediator{get set}
    init(_ mediator:AbstractMediator);
}


fileprivate class BusinessMoudel1:Moudel{
    var mediator: AbstractMediator
    required init(_ mediator:AbstractMediator){
        self.mediator = mediator
        self.mediator.moudel1 = self;
    }
    
    func moudel1dosomething001() {
        mediator.dosomething1()
    }
    
    func moudel1dosomething002() {
        print("moudel1 do something")
    }
}

fileprivate class BusinessMoudel2:Moudel{
    var mediator:AbstractMediator
    required init(_ mediator:AbstractMediator){
        self.mediator = mediator
        self.mediator.moudel2 = self;
    }
    
    func moudel2dosomething001() {
       mediator.dosomething2()
    }
    
    func moudel2dosomething002() {
        print("moudel2: do 002")
    }
}

fileprivate class BusinessMoudel3:Moudel{
    var mediator:AbstractMediator
    required init(_ mediator:AbstractMediator){
        self.mediator = mediator
        self.mediator.moudel3 = self;
    }
    
    func moudel3dosomething001() {
         mediator.dosomething3()
    }
    
    func moudel3dosomething002() {
        print("moudel3: do 002")
    }
}


class MediatorPatternClient{
    func mainFunc(){
        
        let mediator = ConcreteMediator()
        
        let moudel1 = BusinessMoudel1(mediator)
        let moudel2 = BusinessMoudel2(mediator)
        let moudel3 = BusinessMoudel3(mediator)
        
        //假设三个模块是隔离的
        print("模块1 调用其他模块")
        moudel1.moudel1dosomething001()
        print("模块2 调用其他模块")
        moudel2.moudel2dosomething001()
        print("模块3 调用其他模块")
        moudel3.moudel3dosomething001()
    }
}

/*
 优缺点；
 
 优点：类间解耦，使多个类之间的相互依赖关系，变成一对一的依赖关系
 缺点：逻辑越复杂 中介类会越膨胀，
 
 在项目开发过程中 模块间解耦使用的router就可以理解为一个中介者模式，只是这个中介者的职责比较当以只用来处理界面跳转
 

 MVC中的controller也可以理解为一个中介者
 
 */
