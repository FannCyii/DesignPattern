//
//  decoratorPattern.swift
//  DesignPattern
//
//  Created by cheng on 2018/7/23.
//  Copyright © 2018年 cheng. All rights reserved.
//

import Foundation

/*
 * 装饰模式  （包装模式的一种，还有适配模式也是包装模式的一种）
 *  Attach additional responsiblities to an object dynamically keeping the sam interface. Decorators provide a flexible alternative to subclassing for extending functionality.
 *
 * 动态的给一个对象添加一些额外的职责。就增加了功能来说，装饰模式相比生成子类更为灵活。
 */


//装饰者
/*
 Decorator 装饰者
 Component 抽象构件
 
 ConcreteComponent 具体构件
 ConcreteDecorator 具体装饰者
 */

private class Component{ //抽象类
    public func operate(){
        
    }
}

private class Decorator:Component{
    var compnent = Component()
    init(comp:Component){
        compnent = comp;
    }
    public override func operate(){
        compnent.operate()
    }
}

private class ConcreteComponent:Component{
    override func operate(){
        print("这是原始操作！")
    }
}

private class ConcreteDecorator1:Decorator{
    init(compnent:Component) {
        super.init(comp: compnent)
    }
    
    func method1() {
        print("装饰1 ");
    }
    
    public override func operate(){
        method1()
        super.operate()
        //这里的调用顺序 由具体逻辑决定
    }
    
}

private class ConcreteDecorator2:Decorator{
    init(compnent:Component) {
        super.init(comp: compnent)
    }
    
    func method1() {
        print("装饰2 ");
    }
    
    public override func operate(){
        method1()
        super.operate()
    }
}

private class ConcreteDecorator3:Decorator{
    init(compnent:Component) {
        super.init(comp: compnent)
    }
    
    func method1() {
        print("装饰3 巴拉巴拉");
    }
    
    public override func operate(){
        super.operate()
        method1()
    }
}

class DecoratorClient{
    func mainRun(){
        
        let originCompnent = ConcreteComponent()
        
        var compnent = Component();
        compnent = ConcreteDecorator1(compnent: originCompnent);
        compnent = ConcreteDecorator2(compnent: compnent);
        compnent = ConcreteDecorator3(compnent: compnent);
        compnent.operate()
    }
}


//有点像依赖注入
//

/**
 装饰模式的优缺点
 
 优点：
 1 装饰类和被装饰类可以独立发展，而不会相互耦合。换句话说就是Component类无需知道Decorator类，Decorator类时从外部扩展Compnent功能，而Decorator也不用知道具体的构件。
 2 装饰模式是继承关系的替代方案。我们看装饰类Decorator,不管多少层，返回的对象始终是Component，实现的s还是is-a关系。
 3 装饰模式可以动态的t扩展一个实现类的功能，这个模式的定义就是如此。
 
 
 缺点：
 当装饰类比较多时，维护起来比较困难，比如查找bug 要想剥洋葱一样一层层剥开，才发现是最里面的装饰出了问题，所以减少装饰类可以降低系统的复杂度。
 
 
 场景：
 
 1 需要动态的扩展一个类，或给一个类增加附加功能
 2 需要动态地给对象增加功能，这些功能z可以再动态的撤销。
 3 需要为一批兄弟类进行改装或加装功能，当然z是首选 装饰模式
 */
