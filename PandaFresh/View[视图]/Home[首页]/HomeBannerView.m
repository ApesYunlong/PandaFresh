//
//  HomeBannerView.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/2.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "HomeBannerView.h"

#import "BannerView.h"

@interface HomeBannerView ()

/** <#注释#>*/
@property (nonatomic, strong) BannerView *bannerView;

@end

@implementation HomeBannerView



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.bannerView];
        
    }
    
    return self;
    
}

#pragma mark - 数据加载

- (BannerView *)bannerView {
    if (!_bannerView) {
        _bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        [_bannerView setBannerChecked_block:^(NSInteger idx) {
            NSLog(@"%ld", idx);
        }];
    }
    return _bannerView;
}

#pragma mark - 数据加载

- (void)setImageUrlArray:(NSMutableArray *)imageUrlArray {
    
    self.bannerView.imageUrlArray = imageUrlArray;
    
}

@end
