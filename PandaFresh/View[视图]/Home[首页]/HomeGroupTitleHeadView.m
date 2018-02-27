//
//  HomeGroupTitleHeadView.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "HomeGroupTitleHeadView.h"

@interface HomeGroupTitleHeadView ()

/** 标题*/
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation HomeGroupTitleHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.titleLab];
        
    }
    
    return self;
    
}

#pragma mark - 懒加载

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_titleLab setText:@"每日推荐"];
        [_titleLab setTextColor:DEFAULT_COLOR_51];
        [_titleLab setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
