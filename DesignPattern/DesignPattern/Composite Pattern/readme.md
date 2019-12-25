
### Composite Pattern
 组合模式 （部分-整体模式，Part-Whole）
 
 Compose object into tree sturctures to represent part-whole hierarchies. Composite lets clients treat individual object and compositions of objects uniformly.  
 将对象组合成树形结果，以表示“部分-整体”的层次结构，使得用户对单个对象和组合对象的使用具有一致性。
 

### 优缺点  
 * 优点：  
 1 高层模块调用单调，整体和局部对调用者来说没有区别，不用关心自己处理的单个对象还是组合对象。  
 2 节点自由添加，符合开闭原则
 
 * 缺点：  
 1 安全模式：与依赖倒置原则冲突，如上代码整体和部分都是直接实现的，没有依赖抽象接口 （透明模式使用抽象就没有这个问题）
 
 * 使用场景：  
 1 维护和展示部分与整体关系的场景，如树形菜单，文件和文件夹管理  
 2 从一个整体中能够独立出部分模块或功能的场景
 

 * 扩展   
 组合模式可以分成两种模式，一种是安全模式（#1），一种是透明模式（#2）  
  >安全模式就是 如上代码的样式，部分和整体进行了区分。  
  >透明模式，就是不区分整体和局部，对组合相关的操作都提取到通用父类中。这种模式日常见的也是很多的。
