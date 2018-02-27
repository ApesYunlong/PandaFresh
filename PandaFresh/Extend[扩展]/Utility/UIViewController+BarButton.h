//
//  UIViewController+BarButton.h
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BarButton)

/**
 * @brief   自定义导航栏左侧按钮
 * @param   image          按钮图片
 * @param   action         按钮事件
 */
- (void)addLeftBarButtonWithImage:(UIImage *)image Action:(SEL)action;

/**
 * @brief   自定义导航栏右侧按钮
 * @param   image          按钮图片
 * @param   action         按钮事件
 */
- (void)addRightBarButtonWithImage:(UIImage *)image Action:(SEL)action;

/**
 * @brief   自定义导航栏右侧按钮
 * @param   title          按钮文字
 * @param   titleColor     按钮文字颜色
 * @param   titleFont      按钮文字字号
 * @param   action         按钮事件
 */
- (void)addRightBarButtonWithTitle:(NSString *)title TitleColor:(UIColor *)titleColor TitleFont:(UIFont *)titleFont action:(SEL)action;

@end
