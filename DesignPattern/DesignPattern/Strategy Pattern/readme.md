
## 策略模式

### Strategy Pattern
>Define a family of algorithms ,encapsulate each one ,and make them interchangeable.  
>定义一组算法，将每个算法都封装起来，并且使他们之间可以互换

策略模式将各个算法抽象出一个公共接口，提供给上层使用，下层不同的算法都实现这个接口。context在使用接口时，接口可以指定为任意想要的算法。
策略模式也是替换if-else的一种方式
 
 Context 封装角色，b屏蔽高层模块对策略（算法）的直接访问
 Strategy 抽象策略角色，定义每个算法必须有的方法或属性
 ConcreteStrategy 具体策略角色


## 疑惑： 为何能消除if else 语句？ 
看很多例子只不过是将context中的ifelse 移动到工厂类中，或者另一个管理类（必定绕不开对给定条件的筛选，
就是需要一个类似ifelse的过程），例如使用map<key, strategy>这种方式，是一种筛选过程，在某些情况下实现起来未必比ifelse好吧？所以应该说是为了代码的
可维护性和可读性，不能把实现都房子ifelse中，而是让ifelse代码更加简洁易懂，可以结合strategy模式，来达到这个效果，同时ifelse也可以通过算法命中率来提供
命中效率上的优化。如果是使用枚举也是一样的，需要使用switch来筛选对应的算法。
