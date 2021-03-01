
## 中介者模式
### Mediator Pattern

### Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it lets you vary their interaction independently.

### 用一个中介对象封装一系列的对象交互，中介者使各对象不需要显示的相互作用，从而使其耦合松散，而且可以独立地改变它们之间的交互。

>  [Mediator design pattern](https://www.geeksforgeeks.org/mediator-design-pattern/)

优缺点:

优点：类间解耦，使多个类之间的相互依赖关系，变成一对一的依赖关系
缺点：逻辑越复杂 中介类会越膨胀

在项目开发过程中 模块间解耦使用的router就可以理解为一个中介者模式，只是这个中介者的职责比较单一，只用来处理界面跳转


MVC中的controller也可以理解为一个中介者

现实中有个很好的例子：
机场控制室，所有的飞机都空过控制室来调控，统一安排起降，次序井然。
