iOSHelper
=========
### 介绍

iOS 开发的辅助类，帮助快速开发

### 使用说明

在项目的`.pch`文件中引入`#import "iOSHelper.h"`

### category说明

category是objc运行时对类的方法进行扩展，也就是说如果没有使用某些方法那么系统是不会加载这个方法的，所以不需要在意一个category里面的方法过多的问题

### coredata说明

这里的这个coredata比较简单，但是看起来比较直观，另外可以看一下下面的两个coredata相关库

[ObjectiveRecord](https://github.com/supermarin/ObjectiveRecord)
这个coredata的库亮点在于有一个map的映射关系，方便接口json中的数据直接映射成model。缺点在于非线程安全。代码相对简单，可以把这个与上面的库整合一下

[MagicalRecord](https://github.com/magicalpanda/MagicalRecord)
这个应该是最好的coredata库了，github排名也很高

### UIDevice说明

device扩展中有获取设备ID的相关方法，需注意，UDID相关方法都是通过MAC地址来标识设备的。iOS7以后苹果对其进行了技术处理，MAC地址返回的都是02:00:00:00:00:00，因此UDID方法已经不可用。iOS7请使用UUID方法

### 感谢原作者

> 这其中大部分代码都是从网络上摘的，本人只是起到了板砖的作用，少部分是个人开发中的总结。由于时间较长，代码的具体出处我也不是很清楚了，如果您知道的话麻烦告诉我，我会在这里加上

* [SFHFKeychainUtils](https://github.com/kamiro/SFHFKeychainUtils)

### 其他常用三方库

* [Reachability](https://github.com/tonymillion/Reachability): 苹果官方的网络状态库，网上看到说用这个库实时获取网络状态会影响性能
* [AHReach](https://github.com/warrenm/AHReach): 实时动态检测网络，对于有这样需求的APP使用这个库应该比reachability性能要好些
* [TMCache](https://github.com/tumblr/TMCache): tumble的开源项目
* [AHEasing](https://github.com/warrenm/AHEasing): 路径动画，包含弹性路径
* [GTMBase64](https://code.google.com/p/google-toolbox-for-mac/source/browse/trunk/Foundation/?r=87): 谷歌code上的开源项目，用于base64编码/解码
* [AFNetWorking](https://github.com/AFNetworking/AFNetworking): 网络库
* [FMDB](https://github.com/ccgus/fmdb): sqlite的库，包含线程安全的一些方法
* [WebViewJavascriptBridge](https://github.com/marcuswestin/WebViewJavascriptBridge): webview与JavaScript的中间件
* [ObjectiveRecord](https://github.com/supermarin/ObjectiveRecord): 这个coredata的库亮点在于有一个map的映射关系，方便接口json中的数据直接映射成model。缺点在于非线程安全。代码相对简单，可以把这个与上面的库整合一下
* [MagicalRecord](https://github.com/magicalpanda/MagicalRecord): 这个应该是最好的coredata库了，github排名也很高
* [SFHFKeychainUtils](https://github.com/kamiro/SFHFKeychainUtils): 一个钥匙串的三方库，此处已经集成
* [ARCHelper](https://gist.github.com/nicklockwood/1563325): 一个适配ARC和MRC的宏定义的库

> 更多类库详见: [Github-iOS备忘](http://github.ibireme.com/github/list/ios/)

### 待完善...

* 加入 cocospod 支持
* 在 NSObject 中加入 block 相关方法
