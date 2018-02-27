//
//  BannerView.h
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/1.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import <UIKit/UIKit.h>

/** banner选中*/
typedef void(^BannerCheckedBlock)(NSInteger);

@interface BannerView : UIView

@property(nonatomic,copy)BannerCheckedBlock bannerChecked_block;

/** 图片url数组*/
@property (nonatomic, strong) NSMutableArray *imageUrlArray;

@end
