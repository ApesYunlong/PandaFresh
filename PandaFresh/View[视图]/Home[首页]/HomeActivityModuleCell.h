//
//  HomeActivityModuleCell.h
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 活动模块*/
typedef void(^ActivityCheckedBlock)(NSInteger idx);

@interface HomeActivityModuleCell : UICollectionViewCell

@property(nonatomic,copy)ActivityCheckedBlock activityChecked_block;

@end
