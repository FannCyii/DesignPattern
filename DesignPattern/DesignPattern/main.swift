//
//  main.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/18.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation


print("=================================")
print("===== Hello, Design Pattern!=====")
print("=================================")
//命令模式
//let client = CommandClient()
//client.mainRun()

////响应者链
//let client2 = ChainResponsibilityClient()
//client2.mainRun()

////装饰者
//let derectorClient = DecoratorClient()
//derectorClient.mainRun()

////策略模式
//let strategyClient = StrategyPatternClient()
//strategyClient.mainRun()

//适配器模式
let adapterPatternClient = AdapterClient()
adapterPatternClient.mainRun()
