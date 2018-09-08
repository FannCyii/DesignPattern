//
//  FlyweightPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/9/8.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/**
 享元模式
 FlyweightPattern
 
 Use sharing to support large numbers of fine-grained objects efficiently
 
 使用共享对象有效的支持大量的细粒度对象。
 
 两个关键词，共享对象和细粒度对象，
 
 **/


/*
 场景模拟
 
 Flyweight    抽象享元角色
 ConcreteFlyweight 具体享元角色
// UnsharedConcreteFlyweight  不可共享的享元角色
 FlyweightFactory 享元工厂

 
 */



fileprivate class Flyweight {
    
    //内部状态  可用于共享的 不随环境改变
    private var intrinsic:String?
    
//    外部状态  不能用户共享的 可以随环境改变
    fileprivate var extrinsic:String?
    
    init(_ ext:String) {
        extrinsic = ext
    }
    
    fileprivate func operation(){
        print("\(intrinsic ?? "")")
    }
}

fileprivate class ConcreteFlyweight:Flyweight{
    override init(_ ext:String){
        super.init(ext)
    }
    
    override func operation() {
        //具体的业务逻辑，
        print("这是一个对象\(self)")
    }
}

//fileprivate class ConcreteFlyweight2:Flyweight{
//    override init(_ ext:String){
//        super.init(ext)
//    }
//
//    override func operation() {
//        super.operation()
//        //具体的业务逻辑，
//    }
//}


fileprivate class FlyweightFactory{
    var pool = Dictionary<String, Flyweight>()  //通过外部状态来标识一个 细粒度对象，如果在共享池中则直接使用，
    func getFlyweight(_ ext:String)->Flyweight{
        
        if pool[ext] != nil {
            return pool[ext]!
        }else{
            let flyOjbc = ConcreteFlyweight(ext)
            pool[ext] = flyOjbc
            return flyOjbc
        }
    }
}

class FlyweightClient{
    func mainRun(){
        let factory = FlyweightFactory()
        for _ in 1...10000 {
            let fly1 = factory.getFlyweight("this is object fly1");
            fly1.operation();
        }
        
        //上面使用的10000个对象 都是一个对象，实际之创建了一个。
    }
}


//享元模式注意 多线程的情况

























