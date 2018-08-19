//
//  InterpreterPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/8/19.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


/*
 解释器模式
 
 Given a language, define a representation for its grammer along with an interpreter that uses the representation to interpret sentences in the language.
 给定一门语言，定义它的文法的一种表示，定义一个解释器，该解释器使用该表示来解释语言中的句子。
 
 */

/*
 如计算器，给定一个代数公式，然后代数公式的形式给出数值计算表达式，解释器会自动解释这个表达式并计算出结果
 */



/*
 场景模拟
 
 AbstractExpression  抽象解释器
 TerminalExpression 终结符表达式
 NonterminalExpression 非终结表达式
 Context 环境角色
 
解释器是一个比较少用的模式，如果将表达式比作树形结构的话，那么TerminalExpression相当于是叶子节点，NonterminalExpression是非叶子节点
 */



fileprivate class Expresstion{
    func interpreter(ctx:Context)->Any?{
        return nil
    }
}

fileprivate class Context{
    
}

fileprivate class TerminalExpression:Expresstion{
    //通常终结表达式只有一个，但是有多个对象
    override
    func interpreter(ctx:Context)->Any?{
        return nil;
    }
}

fileprivate class NonterminalExpression:Expresstion{
    //非终结表达式会对其他表达式产生依赖
    init(noterninalExpression:Expresstion){
        
    }
    
    init(ex1:Expresstion,ex2:Expresstion){
        
    }
    //...
    
    override
    func interpreter(ctx:Context)->Any?{
        //进行文法处理，这里处理每个非终结表达式的逻辑，比如加减运算的具体运算
        return nil;
    }
}


class InterpreterPatterClient{
    func mainRun(){
//        let context = Context()
//        //通常定一个一个语法容器，容纳一个具体表达式，通常使用容器类来存储
//        let stk = Array<Expresstion>()
//        for ex in stk{
//            //递归调用表达式
//        }
//        let expretion = skt.pop
//        exp.interpreter(context)
    }
}






/*
 总而言之，使用解释器时要慎重，尽量使用已有的轮子。
 
 解释器运行效率可能比较低，以为运用了大量递归和循环，。也可能引起类膨胀。

 
 */














