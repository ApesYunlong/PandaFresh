//
//  HomeActivityModuleCell.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "HomeActivityModuleCell.h"

@interface HomeActivityModuleCell ()

/** 活动1*/
@property (nonatomic, strong) UIButton *activity1Btn;

/** 活动2*/
@property (nonatomic, strong) UIButton *activity2Btn;

/** 活动3*/
@property (nonatomic, strong) UIButton *activity3Btn;

/** 活动3*/
@property (nonatomic, strong) UIButton *activity4Btn;

@end

@implementation HomeActivityModuleCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.activity1Btn];
        
//        self.activity1Btn.sd_layout
//        .topSpaceToView(self.contentView, 10)
//        .leftSpaceToView(self.contentView, 10)
//        .bottomSpaceToView(self.contentView, 10)
//        .widthRatioToView(self.contentView, 0.56f);
        
        
        [self.contentView addSubview:self.activity2Btn];
        
//        self.activity2Btn.sd_layout
//        .topSpaceToView(self.contentView, 10)
//        .leftSpaceToView(self.activity1Btn, 10)
//        .rightSpaceToView(self.contentView, 10)
//        .heightRatioToView(self.contentView, 0.42f);
        
        [self.contentView addSubview:self.activity3Btn];
        
//        self.activity3Btn.sd_layout
//        .topSpaceToView(self.activity2Btn, 5)
//        .leftSpaceToView(self.activity1Btn, 10)
//        .widthRatioToView(self.activity2Btn, 0.46f)
//        .heightEqualToWidth(self.activity3Btn);
        
        [self.contentView addSubview:self.activity4Btn];
        
//        self.activity4Btn.sd_layout
//        .topSpaceToView(self.activity2Btn, 5)
//        .leftSpaceToView(self.activity3Btn, 10)
//        .widthRatioToView(self.activity2Btn, 0.46f)
//        .heightEqualToWidth(self.activity4Btn);
        
    }
    
    return self;
    
}

#pragma mark - 懒加载

- (UIButton *)activity1Btn {
    if (!_activity1Btn) {
        _activity1Btn = [[UIButton alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_activity1Btn setFrame:CGRectMake(iPhoneX_LineX(10), iPhoneX_LineY(8.5), iPhoneX_LineX(198), iPhoneX_LineY(135))];
        } else {
            [_activity1Btn setFrame:CGRectMake(LineX(10), LineY(8.5), LineX(198), LineY(135))];
        }
        
        [_activity1Btn setBackgroundColor:DEFAULT_COLOR_F2F2F2];
        [_activity1Btn addTarget:self action:@selector(ActivityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_activity1Btn setTag:1000];
    }
    return _activity1Btn;
}

- (UIButton *)activity2Btn {
    if (!_activity2Btn) {
        _activity2Btn = [[UIButton alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_activity2Btn setFrame:CGRectMake(CGRectGetMaxX(self.activity1Btn.frame) + iPhoneX_LineX(10), iPhoneX_LineY(8.5), iPhoneX_LineX(145), iPhoneX_LineY(65))];
        } else {
            [_activity2Btn setFrame:CGRectMake(CGRectGetMaxX(self.activity1Btn.frame) + LineX(10), LineY(8.5), LineX(145), LineY(65))];
        }
        
        [_activity2Btn setBackgroundColor:DEFAULT_COLOR_F2F2F2];
        [_activity2Btn addTarget:self action:@selector(ActivityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_activity2Btn setTag:1001];
    }
    return _activity2Btn;
}

- (UIButton *)activity3Btn {
    if (!_activity3Btn) {
        _activity3Btn = [[UIButton alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_activity3Btn setFrame:CGRectMake(CGRectGetMaxX(self.activity1Btn.frame) + iPhoneX_LineX(10), CGRectGetMaxY(self.activity2Btn.frame) + iPhoneX_LineY(5), iPhoneX_LineX(65), iPhoneX_LineX(65))];
        } else {
            [_activity3Btn setFrame:CGRectMake(CGRectGetMaxX(self.activity1Btn.frame) + LineX(10), CGRectGetMaxY(self.activity2Btn.frame) + LineY(5), LineX(65), LineX(65))];
        }
        
        [_activity3Btn setBackgroundColor:DEFAULT_COLOR_F2F2F2];
        [_activity3Btn addTarget:self action:@selector(ActivityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_activity3Btn setTag:1002];
    }
    return _activity3Btn;
}

- (UIButton *)activity4Btn {
    if (!_activity4Btn) {
        _activity4Btn = [[UIButton alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_activity4Btn setFrame:CGRectMake(CGRectGetMaxX(self.activity3Btn.frame) + iPhoneX_LineX(12), CGRectGetMaxY(self.activity2Btn.frame) + iPhoneX_LineY(5), iPhoneX_LineX(65), iPhoneX_LineX(65))];
        } else {
            [_activity4Btn setFrame:CGRectMake(CGRectGetMaxX(self.activity3Btn.frame) + LineX(12), CGRectGetMaxY(self.activity2Btn.frame) + LineY(5), LineX(65), LineX(65))];
        }
        
        [_activity4Btn setBackgroundColor:DEFAULT_COLOR_F2F2F2];
        [_activity4Btn addTarget:self action:@selector(ActivityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_activity4Btn setTag:1003];
    }
    return _activity4Btn;
}

#pragma mark - 按钮点击事件

- (void)ActivityButtonClick:(UIButton *)btn {
    
    if (self.activityChecked_block) {
        self.activityChecked_block(btn.tag);
    }
    
}

@end
