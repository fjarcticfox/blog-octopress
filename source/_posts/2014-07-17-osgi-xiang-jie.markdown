---
layout: post
title: "OSGI 详解"
date: 2014-07-17 17:32:15 +0800
comments: true
categories: [OSGI]
published: false
---

OSGI（Open Service Gateway Initiative，开放服务网关协议），根据上下文的不同，通常可能指的是 OSGI 联盟、[OSGI 标准][1]或 OSGI 框架。在 [OSGI 联盟官方网站][3]的介绍中，OSGI 现在只是作为一种技术名称了。因为 OSGI 已经逐渐扩展到了企业应用领域，并且在 JAVA 企业级开发中扮演越来越重要的角色。

<!-- more -->

OSGI 联盟现在将 OSGI 定义为

`OSGI 技术是指一系列用于定义 Java 动态化组件系统的标准。这些标准通过为大型分布式系统以及嵌入式系统提供一种模块化架构减少了软件的复杂度。`

这一系列的标准由 OSGI 联盟维护，标准的实现通常则称为 OSGI 容器或者 OSGI 服务平台。下面我们就分别简单介绍 OSGI 标准、OSGI 的特点、业务主流的 OSGI 实现与扩展和 OSGI 联盟。

## OSGI 标准

既然 OSGI 技术是指一系列标准，那么我们从对 OSGI 标准的了解开始。OSGI R1 于 2000 年发布，现在最新的标准版本是 R5，到现在为止应用最广泛的当属是 2005 年发布的 R4。2003 年 Eclipse 开始基于 OSGI 对 Eclipse 进行了重构，IBM 的加入也影响了 R4 的制定，作为 Eclipse 内核的 [Equinox][4] 也成为 OSGI 标准的参考实现。OSGI 各个版本的标准可以从 OSGI.org 中下载。最新标准分为两个部分，OSGI Core 和 OSGI Enterpise。

OSGI Core 顾名思义，就是 OSGI 的核心标准，正是这个标准定义了一种动态化模块化的应用架构，其中主要定义了 OSGI 框架。OSGI 框架提供了一个通用安全可管理的 Java 框架，能够支持可扩展可下载的应用（即 bundles）的部署。OSGI 框架是 OSGI 技术最基础也是最核心的部分。OSGI 框架分为以下几层，如下图所示：

* 安全层
* 模块层
* 生命周期层
* 服务层
* 服务

![OSGI_01](/images/blog/OSGI_01.png)

安全层基于 Java2 的安全机制增加了一些限制，并且弥补了 Java 标准的一些不足。

模块层定义了一个模块化 Java 模型，对 Java 部署模式的一些缺点进行了改进，并对 bundle（bundle 为 OSGI 中的组件模型，可以简单认为是增加了元数据的 Jar 包） 之间包的共享有严格的规定。模块层独立于生命周期层和服务层，使用时可以不需要生命周期层和服务层。生命周期层提供了对模块层的 bundle 进行管理的 API，而服务层提供了 bundle 之间的通信模型。

生命周期层为 bundle 提供了生命周期管理 API，为 bundle 提供了一个运行时模型，定义了一个 bundle 如何启动、停止、安装和卸载。另外，生命周期层也提供全面的事件 API，允许 bundle 去控制和操作服务平台。

服务层为 bundle 开发者提供了一个动态、简明且并且统一的编程模型，通过解耦服务标准（即 Java 接口）和它的实现，能够简化服务 bundle 的开发和部署。这个模型允许 bundle 开发者只使用他们自己的接口规范来绑定服务。这样接口的实现可以根据实际情况延迟到运行时来选择。框架通过使用服务层，为系统提供了一种扩展机制，成为 hooks。Hooks 是一种框架用来扩展功能的服务。

OSGI 中统一的编程模型可以帮助 bundle 开发者应对很多情况下的扩展的问题，这一点非常重要，因为框架需要运行在各种硬件设备上，设备的不同硬件特性可能影响服务实现的许多方面。统一的接口使得软件组件能够匹配和组合，同时保证稳定的运行。

OSGI 框架中 bundle 可以在运行时通过服务注册中心选择一个可用的实现，bundle 可以注册新服务、接收关于服务状态的通知或者查找服务区以适配当前的设备。这使得一个 bundle 在部署后仍然具有可扩展性，新的 bundle 可被安装，已存在的 bundle 可修改和更新，而无需重新启动系统。

OSGI Enterprise 由 OSGI 联盟的 [EEG(Enterprise Expert Group )][5]制定，主要通过裁剪或者扩展 OSGI 框架（即 OSGI Core）来定义技术需求与标准，以满足企业环境下 IT 软件基础设施的用况。OSGI Enterprise 主要包括组件模型、分布式服务、Web 应用于 HTTP Servlet、事件模型、管理与配置服务、名称与目录服务、数据访问、事务支持以及其它一些支持服务。OSGI Enterprise 在这里不详细展开，后面我们将会有详细的介绍。

## OSGI 特点

OSGI 已经被用于构建很多非常复杂的系统，比如 IDE（Eclipse），应用服务器（GlassFish, IBM Websphere, Oracle/BEA Weblogic, Jonas, JBoss），应用框架（Spring，Guice），工业自动化等等。是什么特点使得 OSGI 称为这些系统的选择呢？

不妨从几个角度来说一说 OSGI 的特点。从开发的角度来说，OSGI 具有以下特点： 
* 复杂性的降低：基于 OSGI 的组件模型 bundle 能够隐藏内部实现，bundle 基于服务进行交互。 
* 复用：很多第三方的组件可以以 bundle 的形式进行复用。 
* 简单：核心的 API 总共包括不超过 30 个类和接口。 
* 小巧：OSGI R4 框架的实现仅需要 300KB 的 JAR file 就足够。在系统中引入 OSGI 几乎没有什么开销。 
* 非侵入式：服务可以以 POJO 的形式实现，不需要关注特定的接口。

从部署和运行的角度来说，OSGI 的特点就更多了，OSGI 的动态化很大程度体现在系统的部署和运行时。这些特点包括： 
* 切合真实运行环境：OSGI 框架是动态的，bundle 能够进行即时的更新，服务可以根据需要动态增加或者删除。比如一个服务可以是一个网络中的设备，如果一个设备被监测到，则服务可以动态注册；如果设备被移除，则服务能够动态注销。在这样的运行环境中编程将需要耗费大量的开销来处理动态性，但是 OSGI 帮助开发者处理了绝大多数动态性方面的工作。 
* 易于部署：OSGI 定义了组件是如何安装和管理的，标准化的管理 API 使得 OSGI 能够和现有和将来的各种系统有机的集成。 
* 动态更新：这是 OSGI 被最经常提起的一个特性，即所谓的“热插拔”特性，bundle 能够动态的安装、启动、停止、更新和卸载，而整个系统无需重启。 
* 适配性：这主要得益于 OSGI 提供的服务机制、组件可以动态的注册、获取和监听服务，使得系统能够在 OSGI 环境调整自己的功能。 
* 透明：提供了管理 API 来访问内部状态，因此通常无需去查看日志，能够通过命令行进行调试。 
* 版本化：bundle 可以版本化，多版本能够共存而不会影响系统功能，解决了 JAR hell 的问题。（这在开发时也提供了很大的帮助） 
* 快速：这得益于 OSGI 的类加载机制，和 JAR 包的线性加载不同，bundle 委托式的类加载机制，使得类的加载无需进行搜索，这又能有效的加快系统的启动速度。 
* 懒加载：OSGI 技术采用了很多懒加载机制。比如服务可以被注册，但是直到被使用时才创建。

此外 OSGI 还有一些其他的优势，比如： 
* 安全：OSGI 提供了一个安全层，基于 Java 的安全模型增加了可用性。 
* 大公司的支持：OSGI 联盟的成员里包含了很多业界有名的 IT 公司，比如 Oracle, IBM, Samsung, Nokia, Progress, Motorola, NTT, Siemens, Hitachi, Deutsche Telekom, Redhat, Ericsson等。

## OSGI 的实现与扩展

OSGI 框架最著名的三个实现包括 [Apache Felix][6], Equinox 和 Knopflerfish，这三个实现也是 R4 的认证实现。伴随 OSGI 框架的实现，通常会有相关的扩展，以进一步提供 OSGI 开发的工具或平台。

* [Apache Felix][6]

[Felix][7] 项目包含了一个 OSGI R4 服务平台（Service Platform）标准的实现，以及大量相关的 OSGI 功能与技术的实现。Felix 下的子项目有二十多个。除了核心框架的实现，也对主要的 OSGI 服务进行了实现，同时还提供了 iPojo 这样的 OSGI 编程模型（后面我们将会详细介绍）。Felix 还提供了一个强大的 Shell，名叫 Gogo, 用以与 OSGI 的交互。还记得 OSGI 易于部署的特点吗？基于 OSGI 提供的管理 API，你也可以实现一个于 OSGI 平台的交互控制台，甚至是图形化或者 Web 形式的交互方式。Gogo 也被接下来要介绍的 Virgo 所采用。当然，Felix 也提供了支持 OSGI 开发的 SDK，同时还提供了一个 bundle 的中央仓库。

Apache 还有另外一个项目 [Aries][8]，这个项目里主要基于 Felix，对 OSGI 企业标准进行了实现。

* [Equinox][9]

Equinox 是 Eclipse 社区开发的 OSGI 框架，也是 Eclipse 强大的插件体系的基础，是 Eclipse 著名的 PDE 开发环境的底层。在 Equinox 的基础上，Eclipse 社区还有其它一些针对企业级开发的扩展项目。2008 年开始 Spring 社区开始将 Spring 的编程模型引入到 OSGI 中，那时项目叫做 Spring-OSGI，后来改名变成 Spring DM，之后成为 OSGI 企业应用的标准，即 [Blueprint][10]。可见，Gemini Blueprint 是从 Spring DM 发展而来。使用 Gemini Blueprint 编写的代码更易于测试，同时与 OSGI API 是松耦合的。[Gemini Web][11] 是 OSGI Web Application Specification 的一个参考实现，目的在于在 OSGI 环境下更好的支持 Java EE 中的 Servlet 模型。[Virgo][12] 项目 EclipseRT 项目的一部分，是一个完全模块化的 Java 运行时。Virgo 自身就是设计为在 Equinox 之上的一个 OSGI bundle 集合。Virgo 可以运行企业级 Java 应用以及基于 Spring 的应用。

值得一提的是，Spring 社区的 OSGI 相关项目大多捐献给了 Eclipse 社区，这些项目也很大程度上影响了 OSGI 在企业级应用上的发展，从标准和工具支持上，都为 OSGI 走向企业级应用做出了很大的贡献。Spring Source 现在也维护着最大也是最全面的一个 bundle 仓库，叫做 [Enterprise Bundle Respository][13]，将绝大多数 Java 企业级开发的 Package 转换为了 OSGI bundle。当你真正将 OSGI 应用到实际开发中时，你就能体会到这样一个仓库给我们带来了多大的方便。

* [Knopflerfish][14]

Knopflerfish 也是一个大名鼎鼎的开源 OSGI 服务平台实现，由 Markwave 公司实现，目前最新的版本支持 OSGI R4 V4.2。除了提供运行环境外，Knopflerfish 也提供了一套 Eclipse 的 SDK，帮助开发者开发 OSGI 应用。





## 参考资料

1. [OSGI 是什么][2]

[1]: http://www.OSGI.org/Specifications/HomePage
[2]: http://OSGI.com.cn/article/7289226
[3]: http://OSGI.org/
[4]: http://eclipse.org/equinox
[5]: http://www.OSGI.org/EEG/HomePage
[6]: http://felix.apache.org/
[7]: http://elevenframework.org/article/7289225
[8]: http://aries.apache.org/
[9]: http://www.eclipse.org/equinox/
[10]: http://elevenframework.org/article/7289212
[11]: http://elevenframework.org/article/7289211
[12]: http://elevenframework.org/article/7289227
[13]: http://ebr.springsource.com/repository/app/
[14]: http://www.knopflerfish.org/