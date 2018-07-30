//
//  IteratorPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/30.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 迭代器模式
 
 Iterator Pattern
 
 Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.
 
 提供一种方法访问一个容器对象中各个元素，而又不需要暴露该对象的内部细节。
 
 
 场景：

 Iterator 抽象迭代器
 ConcreteIterator 具体迭代器
 Aggregate 抽象容器
 ConcreteAggregate 具体容器

 */


protocol Iterator {
    func next()->Any?
    func hasNext()->Bool
    func remove()
}

class ConcreteIterator<T>:Iterator{
    var aArray:Array<T>
    var cursor = -1  //第一个迭代器 不存值
    init(array:Array<T>) {
        self.aArray = array;
    }
    
    func next()->Any?{
        guard hasNext() else {
            return nil;
        }
        cursor += 1
        return aArray[cursor]
    }
    
    func hasNext()->Bool{
        guard cursor < aArray.count - 1 else {
            return false
        }
        return true
    }
    
    func remove(){
        aArray.remove(at: cursor)
    }
}

class Aggregate<T> {
    func add(objc:T){
        
    }
    
    func remove(objc:T) {
        
    }
    
    func iterator()->Iterator?{
        return nil;
    }
}

//具体容器
class ConcreteAggregate <T>:Aggregate<T>{
    
    var aArray = Array<T>()
    
    override func add(objc:T){
        aArray.append(objc)
    }
    
//    override func remove(objc:T) {
//        super.remove(objc: T)
//    }
    
    override func iterator()->Iterator?{
        return ConcreteIterator<T>(array:aArray)
    }
}


class IteratorPatter{
    func mainRun(){
        let aggregate = ConcreteAggregate<String>()
        
        aggregate.add(objc: "abc")
        aggregate.add(objc: "123")
        aggregate.add(objc: "rty")
        aggregate.add(objc: "456")
        
        let iterator =  aggregate.iterator()!
        
        while iterator.hasNext() == true {
            let str = iterator.next()
            print("\(str ?? " ")")
        }
        
    }
}


//swift 中有对象迭代器protocol,可以用于实现自己的迭代器
// 即：IteratroProtocol 










