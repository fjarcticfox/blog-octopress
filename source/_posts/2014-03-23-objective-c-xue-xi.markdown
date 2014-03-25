---
layout: post
title: "Objective-C 学习"
date: 2014-03-23 17:01:01 +0800
comments: true
categories: [Objective-C]
---


# 1 简介

## 1.1 预备知识

* 具备 C 类似编程语言的经验，对于不具备语言基础的，可以先阅读 Dava Mark 写的《Learn C On the Mac》
。

## 1.2 历史背景

* 20世纪80年代早期，Brad Cox 结合 C 语言及 Smalltakl 语言形成了 Objective-C。

## 1.3 内容简介

Objective-C 是 C 语言的一个扩展集。Objective-C 以 C 语言为基础，扩展了许多特性。


# 2 对 C 的扩展

## 2.1 Hello World

* 安装 Xcode

* 编写代码

```objective-c

#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSlog(@"Hello, world!");

    return (0);
}   // main

```

* .m 扩展名表示 Objective-C 文件，应由 Objective-C 编译器处理；.c 由 C编译器处理；.cpp 由 C++ 编译器处理。在 Xcode 中，所有这些编译工作全由 GCC（GNU Compiler Collection，GNU编译器集合）处理，这个编译器能理解 C 语言的这三个变体

### 2.2.1 #import

C 语言中使用 #include 语句通知编译器在头文件中查询定义；Objective-C 中也可以使用 #include 来实现这个目的，但一般只使用 #import。#import 保证头文件只被包含一次

> C 语言中，长用基于 #ifdef 命令的方案来避免一个文件包含另一个文件，而后者又包含第一个文件的情况；Objective-C 中，使用 #import 可以实现这个功能。

框架是一种聚集在一个单元的部件集合，包含头文件、库、图像、声音文件等。苹果公司提供 Cocoa（Cocoa 包含 Foundation 和 Application Kit（也称为 AppKit））、Carbon、QuickTime、OpenGL 等技术框架。还有一个支持框架的套件，包含 Core Animation 和 Core Image。

* Foundation 框架包含的头文件 Headers 目录位置：/System/Library/Frameworks/Foundation.framework/Headers/ 。仅查看，不修改或删除以避免造成破坏。

> 学完本书后，还需要精通 Cocoa 和 Application Kit，用户界面元素、打印、声音、颜色和声音管理、AppleScript 支持等。参阅《Learn Cocoa on the Mac》。

### 2.2.2 NSLog() 和 @“字符串”

* 类似 C 语言的 printf()，相对添加了新特性，例如时间戳、日期戳和自动附加换行符（'\n'）等。

* NS 前缀代表函数来自Cocoa（前身NextSTEP）。

* 双引号字符串前加 @ 符号，表示引用的字符串应该作为 Cocoa 的 NSString 元素来处理

## 2.3 布尔类型

类型 BOOL，值 YES 或 NO。

> Objective-C 中的 BOOL 实际上是一种对带符号的字符类型（signed char）的定义（typedef），它使用8位存储空间。YES 定义为1，NO 定义为0（使用 #define）。Objective-C 并不将 BOOL 作为仅能保存 YES 或 NO 值得真正布尔类型来处理。编译器将 BOOL 认作8位二进制数，YES 和 NO 只是一种约定。这引发了一个小问题：如果不小心将一个长于1字节的整型值（例如 short 或 int 值）赋给一个 BOOL 变量，那么只有低位字节会用作 BOOL 值。假设该低位字节刚好为0（例如8960，写成十六进制为0x2300），BOOL 值将会是0，即 NO 值。


# 3 面向对象编程基础知识

面向对象编程（Object-Oriented Programming，OOP）。Cocoa 基于 OOP 概念，Objective-C 是一种面向对象语言

## 3.1 间接（indirection）

### 3.1.1 变量与间接

```objective-c

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    int count = 5;

    NSLog(@"The numbers from 1 to %d:", count);

    int i;

    for (i = 1; i <= count; i++) {
        NSLog(@"%d\n", i);
    }
    return (0);
}   // main

```

### 3.1.2 使用文件名的间接

```objective-c

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    if (argc == 1) {
        NSLog(@"You need to provide a file name!");
        return (1);
    }

    FILE *wordFile = fopen(argv[1], "r");
    char word[100];

    while (fgets(word, 100, wordFile)) {
        // strip off the trailing \n
        word[strlen[word] - 1] = '\0';

        NSLog(@"%s is %d characters long", word, strlen(word));
    }

    fclose(wordFile);

    return (0);

}   // main

```

> 在 Xcode 中提供文件路径：在 Xcode 文件列表中展开 Executables，并双击程序名；单击 Arguments 区域下的加号，并输入启动参数。

## 3.2 在面向对象的编程中使用间接


# 4 继承

## 4.1 为何使用继承

## 4.2 继承语法

```objective-c

@interface Circle : NSObject

```

> 某些语言（例如 C++）具有多继承特性。但 Objective-C 不支持多继承。你可以通过 Objective-C 的其他特性获取多继承的优点，例如分类或协议

## 4.3 继承的工作机制

### 4.3.1 方法调度

对象收到消息时，它从自身开始往其继承链上的超类层层往上查找对应方法，并执行。若在最高级别的超类（NSObject）中也没有该方法，则会出现运行时错误。

### 4.3.2 实例变量

## 4.4 重写方法


# 5 复合

## 5.1 什么是复合

## 5.2 存取方法

为存取方法命名：setter 方法需加前缀 set；getter 方法则仅仅根据其返回的属性名称来命名，不要将get作为前缀

> get 这个词在 Cocoa 中有特殊约定含义：get 出现在 Cocoa 的方法名称中，意味着这个方法会通过你当做参数传入的指针来返回数值。例如，NSData的getBytes方法。

## 5.3 复合（has a）与继承（is a）的选择


# 6 源文件组织

Objective-C 类的源码分为两部分：接口（interface），用来提供类的公共描述；实现（implementation），告诉编译器如何让该类工作，实现了接口中声明的方法。

* .h 文件存放接口部分代码：类的 @interface 指令、公共 struct 定义、enum 常量、#defines 和 extern 全局变量等。

* .m 文件存放所有实现细节：类的 @implementation 指令、全局变量的定义、私有struct等

> .mm 文件表示你用 Objective-C++ 编写代码的文件，可以使用 C++ 语言和 Objective-C 结合编程

> @class 创建向前引用，避免循环依赖关系时，编译错误


# 7 深入了解 Xcode

* 通用常用快捷键

    * control + A：      移动到行首（同 command + 左箭头）
    * control + E：      移动到行尾（同 command + 右箭头）
    * control + D：      删除（Delete）光标右边的字符
    * control + K：      删除（Kill）光标所在行中光标后的代码
    * control + L：      将插入点置于窗口正中。找不到光标或者想要移动窗口使插入点快速位于正中的快捷键

* Xcode 快捷键

    * command + shift + D：          查找文件
    * command + option + 上箭头：     查看当前文件的配套文件
    * command + shift + E：          打开扩展编辑器
    * command + [：                  左移代码块
    * command + ]：                  右移代码块
    * Tab：                          接受代码提示
    * Esc：                          显示代码提示菜单
    * control + .：                  循环浏览代码提示
    * shift + control + .：          反向循环浏览代码提示
    * control + /：                  移动到代码提示中得下一个占位符
    * command + option + D：         显示 Open Quickly 窗口
    * command + option + 上箭头：     查看当前文件的配套文件
    * command + D：                  添加书签
    * option + 双击某个符号：          查找该符号相关文档
    * command + R：                  运行程序
    * command + Y：                  调试程序
    * command + option + P：         继续（在调试器中）
    * command + option + O：         跳过
    * command + option + I：         跳入
    * command + option + T：         跳出

> Xcode 使用的调试器是 GDB。GDB 是GNU项目的一部分，它可以在很多不同平台上使用。


# 8 Foundation Kit

## 8.1 数据类型

### 8.1.1 NSRange

```objective-c

typedef struct _NSRange {
    unsigned int location;
    unsigned int length;
} NSRange;

/* 聚合结构赋值 */
NSRange range = {17, 4};

/* NSMakeRange()赋值 */
NSRange r = NSMakeRange(17, 4);

```

### 8.1.2 几何数据类型

```objective-c

typedef struct _NSPoint {
    float x;
    float y;
} NSPoint;

typedef struct _NSSize {
    float width;
    float height;
} NSSize;

typedef struct _NSRect {
    NSPoint origin;
    NSSize size;
} NSRect;

/* 创建这些数据类型的快捷函数：NSMakePoint()、NSMakeSize() 和 NSMakeRect() */

```

> 这些数据类型是 C 的 struct，能提升性能。程序（尤其是 GUI 程序）会用到许多临时的点，大小和句型来完成它们的工作。所有的 Objective-C 对象都是动态分配的，而动态分配是一个代价较高得操作，它会消耗大量的时间。所以将这些结构创建成第一等级的对象都会在使用过程中增加大量的系统开销。

## 8.2 不可变字符串 NSString

* NSString 的 length 方法能够准确无误的处理国际字符串，如含有中文、俄文或日文字符的字符串，以及使用 Unicode 国际字符标准的字符串。

* 比较两个字符串内容是否相等时，应用 isEuqalToString:，而不能用 == 进行比较，后者仅进行指针（即是否是同一个对象）的比较。

* NSString 是不可变的。它的子类 NSMutableString 是可变字符串。

## 8.4 集合家族

### 8.4.1 不可变数组 NSArray

NSArray 是一个 Cocoa 类，用来存储对象的有序列表。它只能存储 Objective-C 对象，而不能存储 C 语言中的基本数据类型，如 int、float、enum、struct，或 NSArray 中的随机指针；同时，不能在 NSArray 中存储 nil（对象的零值或 NULL 值）。

### 8.4.2 可变数组 NSMutableArray

### 8.4.3 枚举

```objective-c
NSArray *array;
array = [NSArray arrayWithObjects: @"one", @"two", @"three", nil];
NSEnumerator *enumerator;
enumerator = [array objectEnumerator];

id thingie;
while (thingie = [enumerator nextObject]) {
    NSLog(@"I found %@", thingie);
}

/* 可变数组枚举时，不能添加或身处对象等方式改变数组容器，否则可能会得到未定义结果 */

```

### 8.4.4 快速枚举

```objective-c

/* Mac OS X 10.5（Leopard），Objective-C 2.0 版本之后，增加快速枚举 */
for (NSString *string in array) {
    NSLog(@"I found %@", string);
}

```

### 8.4.5 不可变字典 NSDictionary 与 可变字典 NSMutableDictionary

> 字典（也被称为散列表或关联数组）使用的是键查询的优化存储方式，它可以立即找出要查询的数据，而不需要遍历整个数组，比普通数组的查询方式更为快速

### 8.4.6 使用，但不要扩展

在 Cocoa 中，许多类实际上是以 *类簇* 的方式实现的，即它们是隐藏在通用接口下的与实现相关的类。创建 NSString 对象时，实际上获得的可能是 NSLiteralString、NSCFString、NSSimpleCString、NSBallofString 或者其他未写入文档的与实现相关的对象。通常，你可以将 NSString 或 NSArray 复合到你的某个类中或者使用类别来解决这种编程问题，而不用创建子类。

## 8.5 数值类型

NSArray 和 NSDictionary 只能存储对象，而不能直接存储任何基本类型的数据，如 int、float 或 struct。但你可以用对象来封装基本类型（装箱，boxing），例如，将 int 数据封装在一个对象中，然后就可以存入 NSArray 或 NSDictionary 了。

### 8.5.1 NSNumber

> 通常将一个基本类型的数据封装成对象叫做 *装箱（boxing）*，从对象中提取基本类型的数据叫做 *取消装箱（unboxing）*。有些语言有 *自动装箱* 功能。Objective-C 语言不支持自动装箱。

### 8.5.2 NSValue

NSNumber 实际上是 NSValue 的子类，NSValue 可以包装任意值。你可以用 NSValue 将结构放入 NSArray 或 NSDictionary 中。

```objective-c

NSRect rect = NSMakeRect(1, 2, 30, 40);

NSValue *value;
value = [NSValue valueWithBytes: &rect objCType: @encode(NSRect)];

[array addObject: value];

value = [array objectAtIndex: 0];
[value getValue: &rect];

```

### 8.5.3 NSNull

使用NSNull值代表不存在的意义，它可以被加入到集合中。`[NSNull null]` 总是返回一样的数值，并且可以使用 == 运算符进行比较。



# 9 内存管理

Objective-C 2.0 提供了垃圾回收机制。

## 9.1 对象生命周期

### 9.1.1 引用计数（reference counting，也叫保留计数）

### 9.1.2 对象所有权（object ownership）

### 访问方法中的保留和释放

```objective-c

- (void) setEnging: (Engine *) newEngine
{
    [newEngine retain];
    [engine release];
    engine = newEngine;
}   // setEngine

```

## 9.2 自动释放

### 9.2.1 所有对象全部入池

Cocoa 中有一个 *自动释放池（autorelease pool）* 的概念

```objective-c

- (NSString *) description
{
    NSString *description;
    description = [[NSString alloc] initWithFormat: @"I am %d years old.", 4];

    return ([description autorelease]);
}   // description

// 你可以编写如下代码
NSLog(@"%@", [someObject description]);

```

### 9.2.2 自动释放池的销毁时间

```objective-c

// 创建池
NSAutoreleasePool *pool;
pool = [[NSAutoreleasePool alloc] init];
// 其他代码

// 释放池
[pool release];

```

> -drain 方法只是清空自动释放池而不销毁它。-drain 方法适用于Mac OS X 10.4（Tiger）及更高版本。

### 9.2.3 自动释放池的工作过程

```objective-c

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool;
    pool = [[NSAutoreleasePool alloc] init];

    RetainTracker *tracker;
    tracker = [RetainTracker new];   // count: 1

    [tracker retain]; // count: 2
    [tracker autorelease]; // count: still 2
    [tracker release];  // count: 1

    NSLog(@"releasing pool");
    [pool release];

    return (0);
}   // main

```

## 9.3 Cocoa 内存管理规则

* 当你使用 new、alloc 或 copy 方法创建一个对象时，该对象的保留计数器值为1。当不再使用该对象时，你需要负责向该对象发送一条 release 或 autorelease 消息。

* 当你通过任何其他方法获得一个对象时，则将设该对象的保留计数器值为1，而且已经被设置为自动释放，你不需要执行任何操作来确保该对象被清理。如果你打算在一段时间内拥有该对象，则需要保留它并确保在操作完成时释放它。

* 如果你保留了某个对象，你需要（最终）释放或自动释放该对象。必须保持 retain 方法和 release 方法的使用次数相等。

### 9.3.1 临时对象

### 9.3.2 拥有对象

通常，你可能希望在多个代码行中一直拥有某个对象。常见方法：在其他对象的实例变量中使用这些对象，将它们加入到诸如 NSArray 或 NSDictionary 等集合中，或者（更罕见的情况）将其作为全局变量使用。

如果你正在使用 new、alloc 或 copy 方法获得一个对象，则不需要执行任何其他操作。该对象的保留计数器值为1，因此它将一直保留，只是一定要在拥有该对象的对象的 dealloc 方法中释放该对象。

```objective-c

- (void) doStuff
{
    // flonkArray is an instance variable
    flonkArray = [NSMutableArray new];    // count: 1
}   // doStuff

- (void) dealloc
{
    [flonkArray release];     // count: 0
    [super dealloc];
}   // dealloc

```

如果你使用除 alloc、new 或 copy 以外的方法获得一个对象，你需要保留该对象。考虑编写 GUI 应用程序时事件循环的情况。你希望保留自动释放的对象，使这些对象在当前的事件循环结束以后仍能继续存在。

为了降低程序的内存空间占用，Cocoa 在程序开始处理事件之前创建一个自动释放池，并在事件处理结束后销毁该自动释放池，这样可以使积累的临时对象的数量保持在最低程度。

```objective-c

// 当使用自动释放对象时，前面的方法可以重写如下：

- (void) doStuff
{
    // flonkArray is an instance variable
    flonkArray = [NSMutableArray arrayWithCapacity: 17];    // count: 1, autoreleased
    [flonkArray retain];    // count: 2, 1 autorelease
}   // doStuff

- (void) dealloc
{
    [flonkArray release];   // count: 0
    [super dealloc];
}   // dealloc

```

清理自动释放池

```objective-c

int i;
for (i = 0; i < 1000000; i++) {
    id object = [someArray objectAtIndex: i];
    NSString *desc = [object description];
    // and do something with the description
}

/* 上面这段代码执行一个循环，在大量的迭代中每次都会生成一个（或2个，10个）自动释放对象。请记住，自动释放池的销毁事件是完全确定的，它在循环执行的过程中不会被销毁。这个循环创建了100万个 description 字符串对象，所有这些对象都被放进当前的自动释放池中，因此就产生了100万个闲置的字符串，这100万个字符串对象一直存在，当自动释放池销毁时才最终获得释放。解决这类问题的方法是在循环中创建自己的释放池，每执行1000次左右，销毁当前自动释放池并创建一个新的自动释放池。代码如下 */

NSAutoreleasePool *pool;
pool = [[NSAutoreleasePool alloc] init];
int i;
for (i = 0; i < 1000000; i++) {
    id object = [someArray objectAtIndex: i];
    NSString *desc = [object description];
    // and do something with the description
    if (i % 1000 == 0) {
        [pool release];
        pool = [[NSAutoreleasePool alloc] init];
    }
}
[pool release];

/* 自动释放池以栈的形式实现：当你创建一个新的自动释放池时，它将被添加到栈顶，接收 autorelease 消息的对象将被放入最顶端的自动释放池中。如果将一个对象放入一个自动释放池中，然后创建一个新的自动释放池再销毁该新建的自动释放池，则这个自动释放对象仍将存在，因为容纳该对象的自动释放池仍然存在。 */

```

### 9.3.3 垃圾回收

Objective-C 2.0 引入了自动内存管理机制

> "-fobjc-gc" 选项能使代码既支持垃圾回收机制又支持对象的保留和释放。

启用垃圾回收以后，通常的内存管理命令全都变成了空操作指令，不执行任何操作。

Objective-C 的垃圾回收是一种继承性的垃圾回收器。与那些存在了一段时间的对象相比，新创建的对象更可能被当成垃圾。如果在一个实例变量中指向某个对象，一定要在某个时候使该实例变量赋值为 nil，以取消对该对象的引用并使垃圾回收器知道该对象可以被清理。


# 10 对象初始化

## 10.1 分配对象

分配（allocation）对象，从操作系统中获得一块内存并将其指定为存放对象的实例变量的位置。alloc 方法将分配的内存初始化为0。所有的 BOOL 类型变量初始化为 NO，int 类型变量初始化为0，float 类型变量初始化为0.0，指针被初始化为 nil。

## 初始化对象

初始化（initialization）从操作系统获取一块内存，准备用于存储对象。init 方法几乎总是返回他们正在初始化的对象。

```objective-c

Car *car = [[Car alloc] init]; // 不能将分配及初始化分开写，避免初始化方法返回的对象与分配的对象不同

```

### 10.2.1 编写初始化方法

```objective-c

- (id) init
{
    if (self = [super init]) {
        enging = [Engine new];

        tires[0] = [Tire new];
        tires[1] = [Tire new];
        tires[2] = [Tire new];
        tires[3] = [Tire new];
    }

    return (self);
}   // init

```

### 10.6 指定初始化函数

### 10.7 初始化函数规则

* 不需要为你自己的类创建初始化函数方法。如果不需要设置任何状态，或者只需要 alloc 方法将内存清零的默认行为，则不需要担心init。

* 如果构造了一个初始化函数，则一定要在你自己的指定初始化函数中调用超类的指定初始化函数。

* 如果初始化函数不止一个，则要选择一个作为指定初始化函数。被选定的方法应该调用超类的指定初始化函数。



# 11 特性

Objective-C 2.0 中引入了特性（property），它组合了新的预编译指令和新的属性访问器语法。

## 11.1 修改特性值

## 11.1.1 简化接口

```objective-c

#import <Foundation/Foundation.h>
#import "Tire.h"

@interface AllWeatherRadial : Tire {
    float rainHandling;
    float snowHandling;
}

@property float rainHandling;
@property float snowHandling;

@end    // AllWeatherRadial

```

@property 预编译指令自动声明属性的 setter 和 getter方法

### 11.1.2 简化实现

```objective-c

#import "AllWeatherRadial.h"

#implementtation AllWeatherRadial

@synthesize rainHandling;
@synthesize snowHandling;

- (id) initWithPressure: (float) p treadDepth: (float) td
{
    if (self = [super initWithPressure: p treadDepth: td]) {
        rainHandling = 23.7;
        snowHandling = 42.5;
    }

    return (self);
}   // initWithPressure: treadDepth

- (NSString *) description
{
    NSString *desc;
    desc = [[NSString alloc] initWithFormat: @"AllWeatherRadial: %.1f / %.1f / %.1f / %.1f", [self pressure], [self treadDepth], [self rainHandling], [self snowHandling]];

    return (desc);
}   // description

@end    // AllWeatherRadial

```

@synthesize 表示：创建该属性的访问器

### 11.1.3 点表达式

点表达式出现在等号左边，该属性名称的 setter 方法将被调用，如果点表达式出现在对象变量的右边，则该属性名称的 getter 方法将被调用。

## 11.2 特性扩展

### 11.2.1 名称的使用

```objective-c

@synthesize name = appellcation

```

### 11.2.2 只读特性


# 12 类别

## 12.1 创建类别（category）

### 12.1.1 声明类别

```objective-c

/* 类别的声明格式与类的声明格式相似，类别名称必须唯一 */
@interface NSString (NumberConvenience)

- (NSNumber) lengthAsNumber;

@end    // NumberConvenience

```

类别不能添加新的实例变量，因此类别的声明中没有实例变量部分。

### 12.1.2 实现类别

```objective-c

@implementation NSString (NumbreConvenience)

- (NSNumber *) lengthAsNumber
{
    unsigned int length = [self length];

    return ([NSNumber numberWithUnsignedInt: length]);
}   // lengthAsNumber

@end    // NumberConvenience

```

### 12.1.3 类别的局限性

* 无法向类中添加新的实例变量。类别没有位置容纳实例变量。

* 名称冲突，即类别中的方法与现有的方法重名。当发生名称冲突时，类别具有更高的优先级，类别方法将取代初始方法，从而无法再使用初始方法。可加特定前缀以避免冲突。

> 也有一些技术可以克服类别无法增加新实例变量的局限，例如：全局字典存储对象与你想要关联的额外变量之间的映射。但此时需考虑，类别是否完成当前任务的最佳选择。

### 12.1.4 类别的作用

* 将类的实现分散到多个不同文件或多个不同框架中；

* 创建对私有方法的向前引用；

* 向对象添加非正式协议（informal protocol）。

## 12.2 利用类别分散实现

## 12.3 使用类别创建向前引用

如果能够先定义一个方法，然后再使用它，编译器将会找到你的方法定义，因而不产生警告。如果不方便这么做，或者你使用了另一个类尚未发布的方法，那么就需要采取其他措施。

通过在类别中声明该方法，编译器将不会产生警告。

## 12.4 非正式协议和委托类别

委托强调类别的一种应用：被发送给委托对象的方法可以声明为一个 NSObject 的类别。

> 像这样创建 NSObject 的类别，任何类的对象都可以作为委托对象使用。

非正式协议是 NSObject 的一个类别，它可以列出对象能够响应的方法。非正式协议用于实现委托。

选择器：@selector，可以在代码中指定特定的 Objective-C 消息。


# 13 协议

## 13.1 正式协议

与非正式协议一样，正式协议也是一个命名的方法列表。但与非正式协议不同的是，正式协议要求显式的采用协议。采用协议的方法是在类的 @interface 声明中列出协议的名称。此时，你的类遵守该协议，并应该实现该协议的所有方法，否则，编译器会生成警告。Objective-C 2.0增加了一些良好的特性，以便更好使用协议。

> 正式协议类似 Java 接口

### 13.1.1 声明协议

```objective-c

// 声明正式协议
@protocol NSCopying

- (id) copyWithZone: (NSZone *) zone;

@end

```

* @protocol 告诉编译器，这是一个正式协议。

* 协议名称必须唯一。

* 方法声明列表中的方法，在协议的每个采用者中都必须被实现。

* 使用协议不可引入新的实例变量。

### 13.1.2 采用协议

要采用某个协议，必须在类声明中列出该协议的名称，并用尖括号括起。若存在多个协议，逗号隔开（顺序无关）。

```objective-c

// Car 采用协议 NSCopying 及 NSCoding
@interface Car : NSObject <NSCopying, NSCoding>
{
    // instance variables
}

// methods

@end    // Car

```

### 13.1.3 实现协议

## 13.2 复制

> 浅层复制（Shallow Copy）、深层复制（Deep Copy）

```objective-c

// 深层复制
- (id) copyWithZone: (NSZone *) zone
{
    Tire * tireCopy;
    tireCopy = [[[self class] allocWithZone: zone] initWithPressure: pressure treadDepth: treadDepth];

    return (tireCopy);
}   // copyWithZone

```

> C 风格指针运算符直接访问实例变量`tireCopy -> pressure = pressure; tireCopy -> treadDepth = treadDepth;`。一般，设置属性不涉及额外工作时，尽量使用init方法和访问器方法。

## 13.3 Objective-C 2.0 新特性

* 新增协议修饰符：@optional（方法可选实现）、@required（方法必须实现，默认属性）。

* 非正式协议在 Objective-C 2.0 之后，主键被带有 @optional 方法的正式协议代替。


# 14 AppKit 简介

## 14.1 构建项目

> 拖动连接的路径是从需要知道某些内容的对象到该对象需要了解的对象。类似 AppController 需要知道将哪个 NSTextField 用于用户输入，因此拖动方向从 AppController 到文本域。按钮需要知道告诉哪个对象，按钮被 click 了，此时需要从按钮拖到AppController。

# 15 文件加载与保存

标准 C 函数库提供了函数调用来创建、读取和写入文件，例如 open()、read()、write()、fopen() 和 fread()等。Cocoa 提供了 Core Data。另外 Cocoa 提供了两个通用的文件处理类：属性列表和对象编码。

# 15.1 属性列表

属性列表对象，常简写为 plist。属性列表类包括 NSArray、NSDictionary、NSString、NSNumber、NSDate、NSData，以及他们的变体（如果变体存在）。

### 15.1.1 NSDate

### 15.1.2 NSData

```objective-c

// NSData 对象保存一个普通的 C 字符串（一个字节序列），然后输出数据
const char *string = "Hi there, this is a C string!";
// length: strlen(string) + 1 用于包含 C 字符串所需的尾部的零字节。
NSData *data = [NSData dataWithBytes: string length: strlen(string) + 1];
NSLog(@"data is %@", data);

//输出结果：`data is <48692074 68657265 2c207468 69732069 73206120 43207374 72696e67 2100>`
// 包含末尾00的零字节数据，可以使用 %s 格式输出字符串
NSLog(@"%d byte string is '%s'", [data length], [data bytes]);

//输出结果：`30 byte string is 'Hi there, this is a C string!'`
```

NSMutableData

### 15.1.3 写入和读取属性列表

> 在操作系统中，有许多属性列表文件和系统配置文件，如主目录 Library/Preference 下的所有首选项文件和 /System/Library/LaunchDaemons 下的系统配置文件。有些属性列表文件（特别是首选项文件）是以二进制格式存储的。通过使用 plutil 命令：plutil -convert xml1 filename.plist，可以将这些文件转换成可读形式。

## 15.2 编码对象

采用 NSCoding 协议和实现方法来编码和解码对象：将大量对象转换成 NSData 类，保存到磁盘中，并在以后读取它，通过 NSData 类，重新创建对象。

# 16 键/值编码

键/值编码（KVC）是一种间接更改对象状态的方式，其实现方法是使用字符串描述要更改的对象状态部分。Cocoa 的一些特性，如 Core Data 或 Cocoa Bindings 在基础机制中包含了 KVC。

## 16.1 入门项目

## 16.2 KVC 简介

键/值编码中的基本调用包括 -valueForKey: 和 -setValue:forKey:。

```objective-c

[car setValue: @"Haroid" forKey: @"name"];
NSString *name = [car valueForKey: @"name"];
NSLog(@"%@", name);

```

-valueForKey: 首先查找以键 -key 或 -isKey 命名的 getter 方法，对于这类调用 valueForKey: 查找 -name。如果不存在 getter 方法，它将在对象内部查找名为 _key 或 key 的实例变量，如果没有通过 @synthesize 提供存取方法，valueForKey 将会查找实例变量 _name 和 name。

* -valueForKey 在 Objective-C 运行时使用元数据打开对象并进入其中查找需要的信息，在 C 或 C++ 中不能执行这种操作。通过 KVC ，可以获取不存在 getter 方法的对象值，无需通过对象指针直接访问实例变量。

* 对于 KVC，Cocoa 自动放入和取出标量值。仅 KVC 具有这种自动包装功能。

-setValue:forKey: 工作方法同 -valueForKey: 类似，首先查找名称的 setter 方法，如果不存在 setter 方法，它将再类中查找 key 或 _key 的实例变量，然后为其赋值。

> 编译器和苹果公司都以下划线开头的形式保存实例变量名称，如果你尝试在其他地方使用下划线，可能会出现严重的错误。这条规则实际上不是强制的，但如果不遵守它，可能会遇到某些风险。

## 16.3 路径

除了通过键设置值外，键/值编码还支持指定键路径，你可以遵循一定关系来指定该路径。路径可以指定以圆点分隔不同属性名称。例如：“engine.horsepower”。

## 16.4 整体操作

关于 KVC 非常棒的一点是，如果向 NSArray 请求一个键值，它实际上会查询数组中的每个对象来查找这个键值，然后将查询结果打包到另一个数组中并返回给你。这种方法也适用于通过键路径访问的对象内部的数组。

在 KVC 中，通常认为嵌入到其他对象中的 NSArray 具有一对多的关系。

```objective-c

NSArray *pressures = [car valueForKeyPath: @"tires.pressure"];

// 不能在键路径中为这些数组添加索引，例如，“tires[0].pressure” 是错误的。

```

键路径不仅能引用对象值，还可以引用一些运算符来进行一些计算，例如获取一组值的平均值或返回这组值中的最小值和最大值。

```objective-c

NSNumber *count;
// 计算汽车的数量，键路径 “cars.@count” 拆开，cars用于获取cars属性，它是 garage 的 NSArray 类型的值。@count 用于通知 KVC 机制计算键路径左侧的结果。
count = [garage valueForKeyPath: @"cars.@count"];

NSNumber *sum;
// 计算某些特定值的总和，例如，车队行驶的总英里数
sum = [garage valueForKeyPath: @"cars.@sum.mileage"];

NSNumber *avgMileage;
// 计算平均每辆汽车行驶的距离
avgMileage = [garage valueForKeyPath: @"cars.@avg.mileage"];

// @min、@max
NSNumber *min, *max;
min = [garage valueForKeyPath: @"cars.@min.mileage"];
max = [garage valueForKeyPath: @"cars.@max.mileage"];

```

> KVC 能非常轻松的处理集合。但是 KVC 需要通过解析字符串来计算你所需要的答案，因此速度比较慢；编译器无法对它进行错误检查，当你使用错误的键路径时，会出现运行时错误。

## 16.6 nil值处理

## 16.7 处理未定义的键

如果 KVC 机制无法找到键路径的处理方式，默认实现会取消操作。但我们可以通过更改默认行为来处理这种情况。valueForUndefinedKey: 方法或 setValue:forUndefinedKey: 方法。

```objective-c

@interface Garage : NSObject {
    NSString *name;
    NSMutableArray *cars;
    NSMutableDictionary *stuff;
}
// ... 其他代码
@end    // Garage

// 在实现中添加 valueForUndefinedKey: 及 setValue:forUndefinedKey: 方法
- (void) setValue: (id) value forUndefinedKey: (NSString *) key {
    if (stuff == nil) {
        stuff = [[NSMutableDictionary alloc] init];
    }
    [stuff setValue: value forKey: key];
}   // setValueForUndefinedKey

- (id) valueForUndefinedKey: (NSString *) key {
    id value = [stuff valueForKey: key];
    return (value);
}   // valueForUndefinedKey

```


# 17 NSPredicate

Cocoa 用 NSPredicate 类描述查询方式

## 17.1 创建谓词

```objective-c

// 创建谓词，
NSPredicate *predicate;
predicate = [NSPredicate predicateWithFormat: @"name == 'Herbie'"];

// 计算谓词
BOOL match = [predicate evaluateWithObject: car];
NSLog(@"%s", (match) ? "YES" : "NO");

```

## 17.2 燃料过滤器

```objective-c

NSArray *results;
// 返回符合条件的car
results = [cars filteredArrayUsingPredicate: predicate];
NSLog(@"%@", results);

```

使用谓词确实很便捷，但它的运行速度不会比你自己编写全部代码快。因为它无法避免在所有汽车之间使用循环和对每辆汽车进行某些操作。一般来说，这种循环不会带来很大的性能影响，因为当今的计算机运行速度非常快。可以继续编写尽可能简易的代码。如果你遇到速度问题，可以使用苹果公司的工具（如 Shark 或 Instruments）测试程序性能。

## 17.3 格式说明符

可以在谓词中使用格式说明符 %d、%f、%@（指定值）或 %K（指定键路径）。或者直接将变量名放入字符串 $NAME 来指定值。

## 17.4 运算符

### 17.4.1 比较和逻辑运算符

谓词字符串语法支持 C 语言中的一些常用运算符。例如： ==、=、>、>= 或 =>、<、<= 或 =<、!= 或 <>、括号表达式、AND、OR、NOT 逻辑运算符或C样式的等效表达式 &&、|| 和 !。

谓词字符串中运算符不区分大小写。

### 17.4.2 数组运算符

```objective-c

predicate = [NSPredicate predicateWithFormat: @"engine.horsepower BETWEEN {50, 200}"];

predicate = [NSPredicate predicateWithFormat: @"name IN {'Herbie', 'Snugs', 'Badger', 'Flap'}"];

```

## 17.5 SELF

SELF 可以引用用于谓词计算的对象

```objective-c

predicate = [NSPredicate predicateWithFormat: @"SELF.name IN {'Herbie', 'Snugs', 'Badger', 'Flap'}"];

```

## 17.6 字符串运算符

BEGINSWITH：某个字符串是否以另外一个字符串开头；ENDSWITH：某个字符串是否以另外一个字符串结尾；CONTAINS：某个字符串是否在另一个字符串内部。

以上运算符可增加 \[c\] 不区分大小写、\[d\] 不区分发音符号、\[cd\] 既不区分大小写又不区分发音符号 等修饰符

## 17.7 LIKE 运算符

## 17.8 MATCHES 正则运算符













## 相关术语

* *类* 是一种结构，它表示对象的类型。对象引用类来获取和自身相关的各种信息。Objective-C 编程风格建议开发人员使用首字母大写的类名。

* *对象* 是一种结构，它包含值和指向其类的隐藏指针。引用对象的 Objective-C 变量通常不需要首字母大写。

* *消息* 是对象可以执行的操作，用于通知对象去做什么。在 [shape draw] 代码中，通过向 shape 对象发送 draw 消息来通知对象绘制自身。对象接收消息后，将查询对应的类，以便查找正确的代码来运行。

* *方法* 是为响应消息而运行的代码。根据对象的类，消息（例如 draw）可以调用不同的方法。

* *方法调度程序* 是 Objective-C 使用的一种机制，用于推测执行什么方法以响应某个特定得消息。

* *接口* 是对象的类应该提供的特性的描述。接口不提供具体的实现细节。

* *实现* 是使接口正常工作的代码。

* *实例化（instantiation）* 根据类信息进行内存分配和初始化，创建一个新的对象实例。

* *继承* 定义一个具有父类所有功能的新类，它继承了父类的这些功能。

* *复合* 在复合中，对象可以引用其他对象。例如汽车对象可以引用轮胎对象。

* *重构*。

* *超类（superclass）*、*父类（parentclass）*、*子类（subclass）*、*子类（childclass）*。

* *委托（delegate）* 是一种对象，另一个类的对象会要求委托对象执行它的某些操作。

* *非正式协议*。

* *正式协议（formal protocol）*。

* *.xib 文件* .xib 文件是 XML 格式的 nib 文件。在编译时，.xib文件将编译为nib格式。

* *编码（序列化）*、*解码（反序列化）*。

## 书名《Learn Objective-C on the Mac》Objective-C 基础教程
## 高朝勤 杨越 刘霞 等译，人民邮电出版社
## 2009年8月第一版

## **书写得不怎么样，做做笔记就OK了。**
