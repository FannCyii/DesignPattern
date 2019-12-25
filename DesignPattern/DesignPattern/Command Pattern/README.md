
## 命令行模式：
### Encapsulate a request as an object, thereby letting you parameterize clients with diffrent requests, queue or log reqeust, and support undoable operations.
### 将一个请求封装成一个对象，从而让你使用不同的请求把客户端参数化，队请求排队或者记录请求日志，可以提供命令的撤销和恢复功能。

> [Command Pattern](https://www.geeksforgeeks.org/command-pattern/)

 减少调用者和接收者之间的耦合，命令相当于`中间层`。这也算是一种“行为”分离吧，`访问者模式`就是一种”行为“分离，将数据和操作分离。
 
 优点：
 1 类间解耦 
 减少调用者和接收者之间的耦合，命令相当于中间层。
 调用者与接受者之间没有任何依赖关系，调用者只需要调用抽象命令的excue()方法即可
 2 可扩展
 command 实例类很容易扩展
 3 命令模式和其他模式结合更好
 和 责任链模式 实现命令族解析任务，和模板方法模式结合 可以解决command子类膨胀的问题
 
 缺点：
 Command子类膨胀，如果出现很多命令，这Command子类将会有很多个
 
 使用场景
 类似dos命令的场景都可以，或者gui中点击一个按钮就是一个命令可以使用命令行模式
 
