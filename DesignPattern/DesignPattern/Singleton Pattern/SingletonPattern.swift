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



























