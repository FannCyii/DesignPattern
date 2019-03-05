//
//  SingletonPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/9/9.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 单利模式
 Singleton Pattern
 
 Ensure a class has only one instance , and provide a global point of access to it.
 
 */

fileprivate class SingletonClass{
    static var singleton:SingletonClass = SingletonClass("this is a singleton")
    var paramString:String
    init(_ paramStr:String) {
        self.paramString = paramStr;
    }
    
    static var shared:SingletonClass {
        get {
            return singleton
        }
        set {
            //do nothing
        }
    }
    
    func operation(){
        print(self.paramString)
    }
}

class SingletonPatternClient{
    func mainRun(){
        SingletonClass.shared.operation()
    }
}


/*
 优点：
 
 1 对于需要频繁的创建和销毁的对象，而且创建和销毁的性能无法优化的情况，单例的优势非常明显
 2 单例可以作为整个系统的全局访问点、共享资源访问点
 3 由于单例只能生成一个实例，所以可以减少系统的性能开销
 4 避免资源的多重占用，使用一个单例专门对某个资源进行处理
 
 单例的缺点：
 1 不符合职责单一模式
 2 不易扩展
 3 多线程读写时要注意读写安全
 4 对测试不利，单例可能会记录各种状态，导致上一个测试用例的状态被保存在单例中，而影响下一个测试用例的执行
 
 
 单例的代替方案 依赖注入:https://objccn.io/issue-13-2/
 
 */

























