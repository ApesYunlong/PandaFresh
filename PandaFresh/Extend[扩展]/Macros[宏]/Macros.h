//
//  Macros.h
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/1.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//获取屏幕宽度、高度
#define appWidth [UIScreen mainScreen].bounds.size.width
#define appHeight [UIScreen mainScreen].bounds.size.height

//获取状态栏和导航栏高度
#define appStatusBarHeight  [UIApplication sharedApplication].statusBarFrame.size.height
#define appNavigationBarHeight  self.navigationController.navigationBar.frame.size.height

#pragma mark - 适配

// 以iPhone6
#define XMGiPhone6W 375.0
#define XMGiPhone6H 667.0
// 计算比例 8p 736 x 812
// x比例 1.293750 在iPhone7的屏幕上
#define XMGScaleX appWidth / XMGiPhone6W
// y比例 1.295775
#define XMGScaleY appHeight / XMGiPhone6H

// X坐标
#define LineX(l) l*XMGScaleX
// Y坐标
#define LineY(l) l*XMGScaleY
// 字体
#define Font(x) [UIFont systemFontOfSize:x*XMGScaleX]

// X坐标
#define iPhoneX_LineX(l) l*1
// Y坐标
#define iPhoneX_LineY(l) l*1
// 字体
#define iPhoneX_Font(x) [UIFont systemFontOfSize:x*1]

//iPhoneX 适配
#define IS_IPHONE_X (appHeight == 812.0f) ? YES : NO
#define IPHONEX_TABBAR 83
#define NOIPHONEX_TABBAR 50

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif


#endif /* Macros_h */
