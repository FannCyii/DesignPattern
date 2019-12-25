//
//  TemplateMethodPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/11/3.
//  Copyright © 2018 cheng. All rights reserved.
//

import Foundation

/*
 

 */


/**
 这个模式是我们常用的模式，同时定义也说的很清楚
 
 */

fileprivate class BaseClass{
    func section1() {
        print("sectin 1")
    }
    
    func section2() {
        print("sectin 2")
    }
    
    func section3() {
        print("sectin 3")
    }
    
    func section4() {
        print("sectin 4")
    }
    
    //使用final修饰， 子类不能重写
    final func growUp(){
        section1();
        section2();
        section3();
        section4();
    }
}

fileprivate class SubClass1: BaseClass{
    override func section1() {
        print("subClass1: override section1!")
    }
    
    override func section3() {
        print("subClass1: override section1!")
    }
}

fileprivate class SubClass2: BaseClass{
    override func section2() {
        print("subClass2: override section1!")
    }
    
    override func section4() {
        print("subClass2: override section1!")
    }
}

class TemplateMethodPatternClient{
    
    func mainFunc(){
        let subClass1 = SubClass1();
        let subClass2 = SubClass2();
        subClass1.growUp()
        subClass2.growUp()
        
    }
}

/*
 由上面代码可以看出，基类中定义好了流程，且这个流程不能修改，但是流程中的每一步可以由子类根据需要去定制，这就是模板方法
 
 
 
 优缺点:
 
优点： 封装不变，扩展可变；
      提取出公共代码，便于维护
      行为由父类控制，子类实现，（这里父类可能有默认实现）
缺点：
     子类会影响父类，复杂项目中可能会导致阅读上的困难（其实我觉得还好，这个模式非常好用）
 */










