
## 访问者模式

###  Visitor Pattern

### Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation withoout changing the classes of the elements on which it operates.

### 封装一些作用于某种数据结构中的元素的操作，他可以在不改变数据结构的前提下定义作用于这些元素的新的操作。

>  好的事例：
>  [Visitor design pattern](https://www.geeksforgeeks.org/visitor-design-pattern/)
> [这里有UML](https://www.tutorialspoint.com/design_pattern/visitor_pattern.htm)

visitor pattern可以很好处理数据与操作的分离，而且各个操作不会相互影响


优缺点
 
 优点：
 1 符合职责单一原则，
 2 优秀的扩展性
 3 灵活性非常高
 
 缺点
 
 1 具体元素对访问者公布细节，不符合迪米特法则
 2 具体元素变更比较困难
 3 背离了依赖倒置原则
 
 使用场景：
 1 对象结构包含很多不同的类对象，他们有不同的接口，而你想对这些对象实施一些依赖于具体类的操作，也就是说 迭代器模式不能胜任的场景
 2 需要对对象结构中的对象进行很多不同且不相干的操作，而你想避免让这些操作 “污染”这些对象类

 
 
 .... 访问者模式 是双分派，
还有单分派 了解下。。。 


