//
//  CompositePattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/31.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 //场景描述
 
 Component  抽象构件角色
 Leaf 部分构件
 Composite 整体构件，块 由多个leaf组成
 
 */

//#1
fileprivate class Component {
    func someOperation(){

    }
}

//这种是透明模式 #2
//fileprivate protocol Component {
//    func someOperation()
//    func add(subComponent:Component)
//    func remove(subComponent:Component)
//    func allSubComponents() -> Array<Component>
//}
//
//private extension Component {
//    func add(subComponent:Component) {
//        //do nothing
//    }
//    func remove(subComponent:Component) {
//
//    }
//    func allSubComponents()->Array<Component> {
//
//    }
//}

fileprivate class Leaf:Component{
    override func someOperation(){
        print("leaf do some operation")
    }
}

fileprivate class Composite:Component{
    private var subCompons = Array<Component>()
    
    override func someOperation() {
        print("Composite do some operation")
    }
    
    func add(subComponent:Component){
        subCompons.append(subComponent);
    }
//    func remove(subComponent:Component){
//    }
 
    func adds(_ subComponent:Component)->Composite{
        subCompons.append(subComponent)
        return self
    }
    func allSubComponents()->Array<Component>{
        return self.subCompons
    }
}

class CompositePatternClient{
    func mainRun(){
        let root = Composite()
//        root.someOperation();
        
        let captain = Composite()
        let leaf1 = Leaf()
        
        root.add(subComponent: captain)
        root.add(subComponent: leaf1)
     
        display(root: root)
    }
    
    private func display(root:Composite){
        for i in root.allSubComponents(){
            i.someOperation()
            if i is Composite{
                i.someOperation()
                display(root: i as! Composite)
            }
        }
    }
}








