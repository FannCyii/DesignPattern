//
//  FactoryMethodPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/9/13.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


/*
 工厂方法
 
 Factory method pattern

 Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.
 
 定义一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法使一个类的实例化延迟到其子类
 */


fileprivate protocol Product {
    static func product()->Product;
    func productionFunction1();
    func productionFunction2();
}

fileprivate class ConcreteProduct1:Product{
    static func product()->Product{
        return ConcreteProduct1();
    }
    
    func productionFunction1(){
        print("product1-function1")
    }
    func productionFunction2(){
        print("product1-function2")
    }
}

fileprivate class ConcreteProduct2:Product{
    static func product()->Product{
        return ConcreteProduct2();
    }
    
    func productionFunction1(){
        print("product2-function1")
    }
    func productionFunction2(){
        print("product2-function2")
    }
}

//#3
fileprivate protocol AbstractFactory{
//    associatedtype Element
    func createProduct(_ pClass:Product.Type)->Product;
}
//#4  //如果一个模块只需要一个工厂 那么可以使用简单工厂模式，不需要#3 AbstractFactory抽象层了
fileprivate class concreteFactory:AbstractFactory{
    func createProduct(_ pClass:Product.Type)->Product{
        let product = pClass.product();
        return product;
    }
}




class FactoryProductPatternClient{
    func mainFunc(){
        let factory:AbstractFactory = concreteFactory()
        let product1 = factory.createProduct(ConcreteProduct1.self)
        let product2 = factory.createProduct(ConcreteProduct2.self)
        
        product1.productionFunction1();
        product2.productionFunction2();
    }
}

/*
 笔记
 感觉有点像模板方法，只不过模板方法将模板设置在基类中，而工厂将模板设置在工程类中
 
 
 */




