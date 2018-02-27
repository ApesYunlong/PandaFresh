//
//  HomeProductListCell.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "HomeProductListCell.h"

@interface HomeProductListCell ()

/** 商品主图*/
@property (nonatomic, strong) UIImageView *productMainMapIamgeView;

/** 商品标题*/
@property (nonatomic, strong) UILabel *productTitleLab;

/** 商品描述*/
@property (nonatomic, strong) UILabel *productDescriptionLab;

/** 商品价格*/
@property (nonatomic, strong) UILabel *productPriceLab;

/** 加入购物车*/
@property (nonatomic, strong) UIButton *addShoppingCartBtn;

@end

@implementation HomeProductListCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.productMainMapIamgeView];
        
        [self.contentView addSubview:self.productTitleLab];
        
        [self.contentView addSubview:self.productDescriptionLab];
        
        [self.contentView addSubview:self.productPriceLab];
        
        [self.contentView addSubview:self.addShoppingCartBtn];
        
    }
    
    return self;
    
}

#pragma mark - 数据加载

- (UIImageView *)productMainMapIamgeView {
    if (!_productMainMapIamgeView) {
        _productMainMapIamgeView = [[UIImageView alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_productMainMapIamgeView setFrame:CGRectMake(iPhoneX_LineX(10), iPhoneX_LineY(10), iPhoneX_LineX(80), iPhoneX_LineX(80))];
        } else {
            [_productMainMapIamgeView setFrame:CGRectMake(LineX(10), LineY(10), LineX(80), LineX(80))];
        }
        
        [_productMainMapIamgeView setBackgroundColor:DEFAULT_COLOR_F2F2F2];
    }
    return _productMainMapIamgeView;
}

- (UILabel *)productTitleLab {
    if (!_productTitleLab) {
        _productTitleLab = [[UILabel alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_productTitleLab setFrame:CGRectMake(CGRectGetMaxX(self.productMainMapIamgeView.frame) + iPhoneX_LineX(10), iPhoneX_LineY(10), iPhoneX_LineX(260), iPhoneX_LineY(20))];
            [_productTitleLab setFont:iPhoneX_Font(14)];
        } else {
            [_productTitleLab setFrame:CGRectMake(CGRectGetMaxX(self.productMainMapIamgeView.frame) + LineX(10), LineY(10), LineX(260), LineY(20))];
            [_productTitleLab setFont:Font(14)];
        }
        
        [_productTitleLab setText:@"【现货】智利J级车厘子500g*1盒"];
        [_productTitleLab setTextColor:DEFAULT_COLOR_51];

    }
    return _productTitleLab;
}

- (UILabel *)productDescriptionLab {
    if (!_productDescriptionLab) {
        _productDescriptionLab = [[UILabel alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_productDescriptionLab setFrame:CGRectMake(CGRectGetMaxX(self.productMainMapIamgeView.frame) + iPhoneX_LineX(10), CGRectGetMaxY(self.productTitleLab.frame), iPhoneX_LineX(260), iPhoneX_LineY(20))];
            [_productDescriptionLab setFont:iPhoneX_Font(14)];
        } else {
            [_productDescriptionLab setFrame:CGRectMake(CGRectGetMaxX(self.productMainMapIamgeView.frame) + LineX(10), CGRectGetMaxY(self.productTitleLab.frame), LineX(260), LineY(20))];
            [_productDescriptionLab setFont:Font(14)];
        }
        
        [_productDescriptionLab setText:@"品尝智利的味道"];
        [_productDescriptionLab setTextColor:DEFAULT_COLOR_153];
    
    }
    return _productDescriptionLab;
}

- (UILabel *)productPriceLab {
    if (!_productPriceLab) {
        _productPriceLab = [[UILabel alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_productPriceLab setFrame:CGRectMake(CGRectGetMaxX(self.productMainMapIamgeView.frame) + iPhoneX_LineX(10), iPhoneX_LineY(70), iPhoneX_LineX(150), iPhoneX_LineY(20))];
            [_productPriceLab setFont:iPhoneX_Font(14)];
        } else {
            [_productPriceLab setFrame:CGRectMake(CGRectGetMaxX(self.productMainMapIamgeView.frame) + LineX(10), LineY(70), LineX(150), LineY(20))];
            [_productPriceLab setFont:Font(14)];
        }
        
        [_productPriceLab setText:@"商城价￥39.9"];
        [_productPriceLab setTextColor:DEFAULT_COLOR_51];
       
    }
    return _productPriceLab;
}

- (UIButton *)addShoppingCartBtn {
    if (!_addShoppingCartBtn) {
        _addShoppingCartBtn = [[UIButton alloc] init];
        
        if (IS_IPHONE_X == YES) {
            [_addShoppingCartBtn setFrame:CGRectMake(iPhoneX_LineX(330), iPhoneX_LineY(56), iPhoneX_LineX(30), iPhoneX_LineY(30))];
        } else {
            [_addShoppingCartBtn setFrame:CGRectMake(LineX(330), LineY(56), LineX(30), LineY(30))];
        }
        
        [_addShoppingCartBtn setBackgroundColor:DEFAULT_COLOR_F2F2F2];
        [_addShoppingCartBtn addTarget:self action:@selector(AddShoppingCartBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addShoppingCartBtn;
}

#pragma mark - 按钮点击事件

- (void)AddShoppingCartBtnClick {
    
    
    
}

@end
