//
//  HomeCategoriesCell.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "HomeCategoriesCell.h"

@interface HomeCategoriesCell ()

/** 图片*/
@property (nonatomic, strong) UIImageView *imageView;

/** 标题*/
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation HomeCategoriesCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.imageView];
        
        //widthRatioToView
//        self.imageView.sd_layout
//        .topSpaceToView(self.contentView, 10)
//        .leftSpaceToView(self.contentView, 20)
//        .widthRatioToView(self.contentView, 0.5f)
//        .heightRatioToView(self.contentView, 0.5f);
        
        [self.contentView addSubview:self.titleLab];
//        self.titleLab.sd_layout
//        .topSpaceToView(self.imageView, 5)
//        .heightIs(20)
//        .leftSpaceToView(self.contentView, 5)
//        .rightSpaceToView(self.contentView, 5);
        
        
    }
    
    return self;
    
}

#pragma mark - 懒加载

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_imageView setFrame:CGRectMake(self.frame.size.width/2 - iPhoneX_LineX(35/2), iPhoneX_LineY(10), iPhoneX_LineX(35), iPhoneX_LineX(35))];
        } else {
            [_imageView setFrame:CGRectMake(self.frame.size.width/2 - LineX(35/2), LineY(10), LineX(35), LineX(35))];
        }
        
        [_imageView setBackgroundColor:[UIColor yellowColor]];
    }
    return _imageView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_titleLab setFrame:CGRectMake(iPhoneX_LineX(10), CGRectGetMaxY(self.imageView.frame) + iPhoneX_LineY(5), self.frame.size.width - iPhoneX_LineX(20), iPhoneX_LineX(20))];
            [_titleLab setFont:iPhoneX_Font(14)];
        } else {
            [_titleLab setFrame:CGRectMake(LineX(10), CGRectGetMaxY(self.imageView.frame) + LineY(5), self.frame.size.width - LineX(20), LineX(20))];
            [_titleLab setFont:Font(14)];
        }
        
        [_titleLab setText:@"标题"];
        [_titleLab setTextColor:DEFAULT_COLOR_51];
        [_titleLab setTextAlignment:NSTextAlignmentCenter];
        [_titleLab setBackgroundColor:[UIColor redColor]];
    }
    return _titleLab;
}

@end
