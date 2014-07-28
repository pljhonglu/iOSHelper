### 包/类说明

* json：直接调用系统接口
* ARC：定义了一些ARC相关的宏
* UIViewController:
    * UIViewController+Helper：这个可以作为日常库
* nsobject：两个runtime相关扩展，一个block扩展。block扩展不是特别好，貌似API比较老
* camera：相机的viewcontroller。没有测试
* uiview：UIview的category应该比较常用，可以作为日常库
* nsstring：一个正则库，一个生成URL的库，一个常规库。url库和常规库比较常用
* coredata：对coredata的简单封装，亮点在于他是线程安全的，可用于学习
* MD5：MD5加密
* UIDevice：设备相关属性，注意*UDID相关方法在iOS7中被禁止*
* keychain：用于操作钥匙串
* lunar：农历
* resourceHelper：
* others
    * NSData+AES: 用于AES加密/解密
    * NSData+DES: 用于DES加密/解密
    * NSDate+Helper: 包括日历方面的扩展
    * NSDictionary+Helper: 扩展比较少，基本用不到
    * NSFileManager+Helper: 这个扩展比较多，对于文件操作比较多的APP可以引入
    * UIColor+Helper: 做要是十六进制转color的扩展
* Util.h: 一些常用的宏定义，可以在Prefix.pch中引入这个文件，这样就可以全局使用了

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

### 常用三方库

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

### 总结

在项目中，*Util.h*/*UIView+Helper.h*/*UIViewController+Helper.h*/*NSString+URL.h*/

http://github.ibireme.com/github/list/ios/

### 

nsfilemanager 与 resourcehelper 合并



