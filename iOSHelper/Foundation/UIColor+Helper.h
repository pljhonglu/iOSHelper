//
//  UIColor+Helper.h
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

void RGB2HSL(CGFloat r, CGFloat g, CGFloat b,
             CGFloat *h, CGFloat *s, CGFloat *l);

void HSL2RGB(CGFloat h, CGFloat s, CGFloat l,
             CGFloat *r, CGFloat *g, CGFloat *b);

void RGB2HSB(CGFloat r, CGFloat g, CGFloat b,
             CGFloat *h, CGFloat *s, CGFloat *v);

void HSB2RGB(CGFloat h, CGFloat s, CGFloat v,
             CGFloat *r, CGFloat *g, CGFloat *b);

void RGB2CMYK(CGFloat r, CGFloat g, CGFloat b,
              CGFloat *c, CGFloat *m, CGFloat *y, CGFloat *k);

void CMYK2RGB(CGFloat c, CGFloat m, CGFloat y, CGFloat k,
              CGFloat *r, CGFloat *g, CGFloat *b);

void HSB2HSL(CGFloat h, CGFloat s, CGFloat b,
             CGFloat *hh, CGFloat *ss, CGFloat *ll);

void HSL2HSB(CGFloat h, CGFloat s, CGFloat l,
             CGFloat *hh, CGFloat *ss, CGFloat *bb);


#define UIColorRGB(r, g, b)     [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1]
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]

#define UIColorHSB(h, s, b)     [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:1]
#define UIColorHSBA(h, s, b, a) [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:(a)]

#define UIColorHSL(h, s, l)     [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:1]
#define UIColorHSLA(h, s, l, a) [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:(a)]

#define UIColorCMYK(c, m, y, k) [UIColor colorWithCyan:(c) magenta:(m) yellow:(y) black:(k) alpha:1]
#define UIColorCMYKA(c,m,y,k,a) [UIColor colorWithCyan:(c) magenta:(m) yellow:(y) black:(k) alpha:(a)]



/**
 Provide some method for `UIColor` to convert color between
 RGB,HSB,HSL,CMYK and Hex.
 
 | Color space | Meaning                                |
 |-------------|----------------------------------------|
 | RGB         | Red, Green, Blue                       |
 | HSB(HSV)    | Hue, Saturation, Brightness (Value)    |
 | HSL         | Hue, Saturation, Lightness             |
 | CMYK        | Cyan, Magenta, Yellow, Black           |
 
 Apple use RGB & HSB default.
 
 All the value in this category is float number in the range `0.0` to `1.0`.
 Values below `0.0` are interpreted as `0.0`,
 and values above `1.0` are interpreted as `1.0`.
 
 If you want convert color between more color space (CIEXYZ,Lab,YUV...),
 see https://github.com/ibireme/yy_color_convertor on Github
 */
@interface UIColor (Helper)

///=============================================================================
/// @name Creating a UIColor Object
///=============================================================================

//HSL 颜色，0.0 - 1.0
+ (UIColor *)colorWithHue:(CGFloat)hue
               saturation:(CGFloat)saturation
                lightness:(CGFloat)lightness
                    alpha:(CGFloat)alpha;


//CMYK 颜色，0.0 - 1.0
+ (UIColor *)colorWithCyan:(CGFloat)cyan
                   magenta:(CGFloat)magenta
                    yellow:(CGFloat)yellow
                     black:(CGFloat)black
                     alpha:(CGFloat)alpha;

/**
 *  十六进制转 UIColor
 *
 *  @param rgbValue 类似0xFF00AA
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithRGB:(uint32_t)rgbValue;

/**
 *  十六进制转 UIColor
 *
 *  @param rgbaValue 0x66CCFFAA
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithRGBA:(uint32_t)rgbaValue;

/**
 *  十六进制转 UIColor
 *
 *  @param rgbValue 0x66CCFF
 *  @param alpha    0.0 - 1.0
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

/**
 *  十六进制转 UIColor
 *
 *  @param hexStr 类似#rgb #rgba #rrggbb #rrggbbaa 0xrgb...
 *  # 和 0x 可以不写
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexStr;

///=============================================================================
/// @name Get color's description
///=============================================================================

// return such as 0x66ccff
- (uint32_t)rgbValue;
// return such as 0x66ccaaff
- (uint32_t)rgbaValue;

/**
 *  hex，色彩空间不是 rgb 时，返回 nil
 *
 *  @return such as @"0066cc"
 */
- (NSString *)hexString;

/**
 *  根据 UIColor 获取十六进制的值
 *  如果不是 RGBA 空间的色彩就返回 nil
 *
 *  @return such as @"0066ccff"
 */
- (NSString *)hexStringWithAlpha;

///=============================================================================
/// @name Retrieving Color Information
///=============================================================================

//rgb各通道值 0.0 - 1.0
@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;

//hsb各通道值 0.0 - 1.0
@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat brightness;

//透明度通道值 0.0 - 1.0
@property (nonatomic, readonly) CGFloat alpha;


/**
 *  颜色转换为HSL
 *
 *  @param hue        转换后 hue 通道的值
 *  @param saturation 转换后 saturation 通道的值
 *  @param lightness  转换后 lightness 通道的值
 *  @param alpha      转换后 alpha 通道的值
 *
 *  @return 如果可以转换成HSL则返回yes
 */
- (BOOL)getHue:(CGFloat *)hue
    saturation:(CGFloat *)saturation
     lightness:(CGFloat *)lightness
         alpha:(CGFloat *)alpha;

// 颜色转换为CMYK
- (BOOL)getCyan:(CGFloat *)cyan
        magenta:(CGFloat *)magenta
         yellow:(CGFloat *)yellow
          black:(CGFloat *)black
          alpha:(CGFloat *)alpha;
@end
