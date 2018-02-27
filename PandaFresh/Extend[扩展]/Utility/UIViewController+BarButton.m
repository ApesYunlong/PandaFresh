//
//  UIViewController+BarButton.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "UIViewController+BarButton.h"

@implementation UIViewController (BarButton)

/**
 * @brief   自定义导航栏左侧按钮
 * @param   image          按钮图片
 * @param   action         按钮事件
 */
- (void)addLeftBarButtonWithImage:(UIImage *)image Action:(SEL)action {
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 44, 44);
    [firstButton setImage:image forState:UIControlStateNormal];
    //    [firstButton setBackgroundImage:image forState:UIControlStateNormal];
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (!SYSTEM_VERSION_LESS_THAN(@"11")) {
        firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        //        [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5 *appWidth /375.0,0,0)];
    }
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:firstButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

/**
 * @brief   自定义导航栏右侧按钮
 * @param   image          按钮图片
 * @param   action         按钮事件
 */
- (void)addRightBarButtonWithImage:(UIImage *)image Action:(SEL)action {
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 30, 30);
    [firstButton setImage:image forState:UIControlStateNormal];
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (!SYSTEM_VERSION_LESS_THAN(@"11")) {
        firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    }
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:firstButton];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}

/**
 * @brief   自定义导航栏右侧按钮
 * @param   title          按钮文字
 * @param   titleColor     按钮文字颜色
 * @param   titleFont      按钮文字字号
 * @param   action         按钮事件
 */
- (void)addRightBarButtonWithTitle:(NSString *)title TitleColor:(UIColor *)titleColor TitleFont:(UIFont *)titleFont action:(SEL)action {
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 60, 30);
    
    [firstButton setTitle:title forState:UIControlStateNormal];
    [firstButton setTitleColor:titleColor];
    [firstButton.titleLabel setFont:titleFont];
    
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (!SYSTEM_VERSION_LESS_THAN(@"11")) {
        firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    }
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:firstButton];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}

@end
