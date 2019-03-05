//
//  BuilderPattern2.swift
//  DesignPattern
//
//  Created by cheng on 2019/3/5.
//  Copyright © 2019 cheng. All rights reserved.
//

import Foundation

fileprivate class Product {
    
}

fileprivate protocol Builder:class {
    func stepA(product:Product)
    func stepB()
    func stepC()
//    func get
}

fileprivate class ConcreteBuilder1:Builder{
    func stepA(product:Product) {
        print("build1 stepA")//比如这里加工了product
    }
    
    func stepB() {
        print("build1 stepB")//比如这里加工了product
    }
    
    func stepC() {
        print("build1 stepB")//比如这里加工了product
    }
}

fileprivate class ConcreteBuilder2:Builder{
    func stepA(product:Product) {
        print("build2 stepA")//比如这里加工了product
    }
    
    func stepB() {
        print("build2 stepB")//比如这里加工了product
    }
    
    func stepC() {
        print("build2 stepB")//比如这里加工了product
    }
}

fileprivate class Director {
    private var builder:Builder
    init(builder:Builder) {
        self.builder = builder
    }
    
    @discardableResult
    func getProduct() -> Product{
        let product = Product()
        self.builder.stepA(product: product)
        self.builder.stepB()
        self.builder.stepC()
        return product
    }
}

class BuilderPatternClient2{
    
    func mainFunc() {
        
        let builder1 = ConcreteBuilder1()
        let director = Director(builder: builder1)
        director.getProduct()//#1
        
        let builder2 = ConcreteBuilder2()
        let director2 = Director(builder: builder2)
        director2.getProduct()//#2

        //#1和#2由于建造者得不同 产生的商品也不一样
    }
}
