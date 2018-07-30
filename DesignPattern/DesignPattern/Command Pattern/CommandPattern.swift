//
//  Command pattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/18.
//  Copyright © 2018年 cheng. All rights reserved.
//

/**
 命令行模式：
 Encapsulate a request as an object, thereby letting you parameterize clients with diffrent requests, queue or log reqeust, and support undoable operations.
 将一个请求封装成一个对象，从而让你使用不同的请求把客户端参数化，队请求排队或者记录请求日志，可以提供命令的撤销和恢复功能。
 **/


/*
 结构定义：
 Client     场景类
 Invoker    调用者
 Reciver    抽象接受者
 Command    抽象命令
 ConcreteCommand    具体命令
 */

import Foundation


protocol Receiver {
    func doSomething();//抽象方法，干活，如果是开发就开发程序，如果是美工就绘图，如果是产品则设计产品
}

class ConcreteReceiver1:Receiver{
    func doSomething() {
        print("coding")
    }
}

class ConcreteReceiver2:Receiver{
    func doSomething() {
        print("designing")
    }
}

protocol Command { //这里就是需要干的那些活的抽象
    func execute();
}

class ConcreteCommand:Command  //具体要干什么活 由谁来干
{
    private var receiver:Receiver
    init(aReceiver:Receiver) {
        receiver = aReceiver;
    }
    public func execute() {
        receiver.doSomething()
    }
}

class ConcreteCommand2:Command
{
    private var receiver:Receiver
    init(aReceiver:Receiver) {
        receiver = aReceiver;
    }
    public func execute() {
        receiver.doSomething()
    }
    

}

class ConcreteCommand3:Command //多个接受者 协作处理
{
    private let coder = ConcreteReceiver1()
    private let designer = ConcreteReceiver1()
    
    public func execute() {
        print("begin")
        designer.doSomething()
        print("...ing")
        coder.doSomething()
        print("end")
    }
}

class Invoker{
    private var command:Command? = nil
    public func setCommand(aCommand:Command){
        command = aCommand;
    }
    func action(){
        command?.execute()
    }
}
//场景模拟： 客户对项目组提各种需求
//场景类 相对于就是客户，客户需要项目组干活，invoker相当于经理（管理者），而receiver就是干活的：开发、美工、产品设计等
class CommandClient{
    func mainRun(){
        print("---命令模式---")
        let invoker = Invoker()
        
/*
        //通常会吧reciver隐藏
        let coder = ConcreteReceiver1()
        let designer = ConcreteReceiver2()
        let command1 = ConcreteCommand(aReceiver: coder) //开发者改代码
        let command2 = ConcreteCommand(aReceiver: designer) //产品改需求

        //经理从客户那边接到一个程序bug需要程序员改程序修复
        invoker.setCommand(aCommand: command1)
        invoker.action()
 */
/*
        //经理从客户那边收到一个需求变动，需要产品重新设计产品
        invoker.setCommand(aCommand: command2)
        invoker.action()
*/
        //一个协作的需求
        let command3 = ConcreteCommand3()
        invoker.setCommand(aCommand: command3)
        invoker.action()
    }
}


/*
 
 有点：
 1 类间解耦
 调用者与接受者之间没有任何依赖关系，调用者只需要调用抽象命令的excue()方法即可
 2 可扩展
 command 实例类很容易扩展
 3 命令模式和其他模式结合更好
 和 责任链模式 实现命令族解析任务，和模板方法模式结合 可以解决command子类膨胀的问题
 
 缺点：
 Command子类膨胀，如果出现很多命令，这Command子类将会有很多个
 
 使用场景
 类似dos命令的场景都可以，或者gui中点击一个按钮就是一个命令可以使用命令行模式
 
 */

//组合








