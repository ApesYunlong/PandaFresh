//
//  BannerView.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/1.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "BannerView.h"

@interface BannerView ()

@property (nonatomic, strong) SDCycleScrollView  * cycleScrollView;

@end

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.cycleScrollView];
        
    }
    
    return self;
    
}

#pragma mark - 懒加载

- (SDCycleScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) delegate:nil placeholderImage:[UIImage imageNamed:@"Null_home_icon_mrlb"]];
        
        _cycleScrollView.autoScrollTimeInterval = 3;
        
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        
        @weakify(self)
        [_cycleScrollView setClickItemOperationBlock:^(NSInteger idx) {
            
            @strongify(self)
            if (self.bannerChecked_block) {
                self.bannerChecked_block(idx);
            }
            
        }];
    }
    return _cycleScrollView;
}

#pragma mark - 数据加载

- (void)setImageUrlArray:(NSMutableArray *)imageUrlArray {
    
    self.cycleScrollView.imageURLStringsGroup = imageUrlArray;
    
}

@end
