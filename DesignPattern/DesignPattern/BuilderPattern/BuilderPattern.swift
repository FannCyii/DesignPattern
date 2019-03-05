//
//  BuilderPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/11/4.
//  Copyright © 2018 cheng. All rights reserved.
//

import Foundation


/*
 建造者模式（生成器模式）
 Builder Pattern
 
 Separate the construction of a complex object from its representation so that the same construction process can create differnent representations.
 
 将一个复杂的对象的建造与它的表示分离，使得同样的建造过程可以创建不同的表示。
 
 */

/*
 这个方法和模板方法很像，但是模板方法是确定了模板，即模板由父类定制了不能修改，但是如果要需要很多不同的模板该怎么办呢，这就需要建造者模式来解决了。建造者将父类的模板抽离出来，让模板可以定制，而不关心每一步建造的细节
 
 建造者模式，相当于将模板方法模式中的模板抽离出来，由建造类来定制，建造类定制好不同的流程，当需要执行什么流程时冲建造类中获取即可。
 
 场景模拟:
 
 Builder
 
 Director
 
 Product

 */


fileprivate class Product{
    func doSomething(){
        
    }
}

fileprivate protocol Builder{
    func setProcessingFlow(_ flows:[Int]);
    func buildProduct()->Product;
}

//似乎是对模板方法的改造
fileprivate class ConcreteBuilder:Builder{

    private let product:Product
    init(_ product:Product) {
        self.product = product
    }
    
    func flow1() {
        print("flow1")
        //product对product进行处理
    }
    
    func flow2() {
        print("flow2")
    }
    
    func flow3() {
        print("flow3")
    }
    
    
    //FIME:如果只有一个建造者 则可以这样写，同时可以省略Director
    //定制加工流程 从而生成不一样的产品
    func setProcessingFlow(_ flows:[Int]){
        for index in flows {
            if index == 1{
                self.flow1()
            }else if index == 2{
                self.flow2()
            }else{
                self.flow3()
            }
        }
    }
    
    func buildProduct()->Product{
        return product;
    }
}

//定制具体的生产流程
fileprivate class Director{
    
    func product1() -> Product{
        let builder = ConcreteBuilder(Product())
        builder.setProcessingFlow([1,2,3])
        return builder.buildProduct();
    }
    
    func product2() -> Product{
        let builder = ConcreteBuilder(Product())
        builder.setProcessingFlow([2,1,3])
        return builder.buildProduct();
    }
    
    func product3() -> Product{
        let builder = ConcreteBuilder(Product())
        builder.setProcessingFlow([3,2,1])
        return builder.buildProduct();
    }
    
}

class BuilderPatternClient{
    
    func mainFunc() {
        let director = Director()
        //生产不同的产品
        print("生成的产品1")
        _ = director.product1();
        print("生成的产品2")
        _ = director.product2();
        print("生成的产品3")
        _ = director.product3();
    }
}

