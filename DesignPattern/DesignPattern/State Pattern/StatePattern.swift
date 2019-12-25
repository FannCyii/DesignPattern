//
//  StatePattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/16.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

fileprivate protocol PersonState{
    func bodyHeight() -> Float
    func age() -> Int
    func job() -> String
    func education() -> String
}


struct Infancy: PersonState {
    func bodyHeight() -> Float {
        return 0.2
    }
    func age() -> Int {
        return 1
    }
    func job() -> String {
        return ""
    }
    func education() -> String {
        return ""
    }
}

struct Puberty: PersonState {
    func bodyHeight() -> Float {
        return 1.50
    }
    func age() -> Int {
        return 10
    }
    func job() -> String {
        return "student"
    }
    func education() -> String {
        return "Primary"
    }
}


struct Adult: PersonState {
    func bodyHeight() -> Float {
        return 18.2
    }
    func age() -> Int {
        return 21
    }
    func job() -> String {
        return "student"
    }
    func education() -> String {
        return "College"
    }
}

fileprivate class Person {
    private var state: PersonState
    init(begin: PersonState) {
        state = begin
    }
    var canRunBySelf: Bool {
        return state.age() < 2
    }
    
    var canWriteDiary: Bool {
        return !state.education().isEmpty
    }
    
    func growUp(_ state: PersonState) {
        self.state = state
    }
}


fileprivate class Context{
    
//类似映射表
//    static let STATE1 = ConcreteState1()
//    static let STATE2 = ConcreteState2()
//    static let STATE3 = ConcreteState3()
    
    func aLife() {
        let aPerson = Person(begin: Infancy())
        aPerson.growUp(Puberty())
        //aPerson do something
        aPerson.growUp(Adult())
        //aPerson do something
    }
}

class StatePatterClient{
    func mainRun(){
        let context = Context()
        context.aLife()
    }
}


















