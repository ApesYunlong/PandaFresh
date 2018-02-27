//
//  HomeViewController.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/1/31.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "HomeViewController.h"

//头部banner
#import "HomeBannerView.h"
//商品分类
#import "HomeCategoriesCell.h"
//活动模块
#import "HomeActivityModuleCell.h"
//分组标题
#import "HomeGroupTitleHeadView.h"
//商品列表
#import "HomeProductListCell.h"
//定位
#import "PositioningViewController.h"

@interface HomeViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

/** 列表*/
@property (nonatomic, strong) UICollectionView *homeCollectionView;

/** 数组*/
@property (nonatomic, strong) NSMutableArray *currentArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addLeftBarButtonWithImage:GetImage(@"dingwei") Action:@selector(LeftNavBarButton)];
    
    [self.view addSubview:self.homeCollectionView];
    
    NSLog(@"%f",self.view.frame.size.height);
    
}

#pragma mark - 导航栏按钮

- (void)LeftNavBarButton {
    
    PositioningViewController *vc = [PositioningViewController new];
    vc.title = @"选择收货地址";
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

//  点击元素响应方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"一群草泥马奔过~~~~ %ld %ld", indexPath.section,indexPath.row);
    
}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) { //头部banner
           
            HomeBannerView *bannerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeBannerView" forIndexPath:indexPath];
            
            NSMutableArray *array = [NSMutableArray array];
            
            NSArray *imageUrl = @[@"https://img10.360buyimg.com/babel/jfs/t17239/20/368417242/138267/3439d56b/5a7065b3N8196594c.jpg",@"https://img11.360buyimg.com/babel/jfs/t17302/331/386124501/144979/b9d6c985/5a72772eNe8d77bc9.jpg",@"https://img12.360buyimg.com/babel/jfs/t18838/93/425507591/132774/a8a8257e/5a72c90dNed47392f.jpg",@"https://img13.360buyimg.com/babel/jfs/t16138/335/1872118100/91561/d206001e/5a7007dcNb9b81ae7.jpg"];
            
            [array addObjectsFromArray:imageUrl];
            
            bannerView.imageUrlArray = array;
            
            return bannerView;
            
        } else if (indexPath.section == 2) {
            
            HomeGroupTitleHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeGroupTitleHeadView" forIndexPath:indexPath];
            
            return headerView;
            
        } else {
            
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
            [headerView setBackgroundColor:DEFAULT_COLOR_F2F2F2];
            return headerView;
            
        }
        
    } else if([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        [footerView setBackgroundColor:DEFAULT_COLOR_F2F2F2];
        return footerView;
        
    }
    
    return nil;
}

//  设置页脚(水平滑动的时候设置width,垂直滑动的时候设置height)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    if (section == 2) { //商品列表
        return CGSizeMake(appWidth, 0);
    }
    
    return CGSizeMake(appWidth, 4);
    
}

//  设置页眉(水平滑动的时候设置width,垂直滑动的时候设置height)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        if (IS_IPHONE_X == YES) {
            return CGSizeMake(appWidth, iPhoneX_LineY(200));
        } else {
            return CGSizeMake(appWidth, LineY(200));
        }
        
    } else if (section == 2) {
        
        if (IS_IPHONE_X == YES) {
            return CGSizeMake(appWidth, iPhoneX_LineY(44));
        } else {
            return CGSizeMake(appWidth, LineY(44));
        }
        
    }
    
    return CGSizeMake(appWidth, 0);
    
}

//  定义每个单元格相互之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}

//  定义单元格所在行line之间的距离,前一行和后一行的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0.01;
}

//  设置分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
    
}



//  定义每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    self.homeCollectionView.mj_footer.hidden = self.currentArr.count == 0;
    
    if (section == 0) { //商品分类
        return 5;
    } else if (section == 2) { //推荐列表
        return 6;
    }
    
    return 1;
    
}

//  设置每个元素大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) { //商品分类
        
        return CGSizeMake(appWidth/5, appWidth/5);
        
    } else if (indexPath.section == 1) { //活动模块
        
        if (IS_IPHONE_X == YES) {
            return CGSizeMake(appWidth, iPhoneX_LineY(152));
        } else {
            return CGSizeMake(appWidth, LineY(152));
        }
        
    } else { //商品列表
        
        if (IS_IPHONE_X == YES) {
            return CGSizeMake(appWidth, iPhoneX_LineY(100));
        } else {
            return CGSizeMake(appWidth, LineY(100));
        }
        
    }
 
}

//  定义每个元素的margin(边缘 上-左-下-右)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) { //商品分类
        
        HomeCategoriesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCategoriesCell" forIndexPath:indexPath];
        
        return cell;
        
    } else if (indexPath.section == 1) { //活动模块
        
        HomeActivityModuleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeActivityModuleCell" forIndexPath:indexPath];
        
        return cell;
        
    } else {
     
        HomeProductListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeProductListCell" forIndexPath:indexPath];
        
        [cell.layer setBorderWidth:0.5f];
        [cell.layer setBorderColor:DEFAULT_COLOR_F2F2F2.CGColor];
        
        return cell;
        
    }
    
}

#pragma mark - 懒加载

- (UICollectionView *)homeCollectionView {
    if (!_homeCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        if (IS_IPHONE_X == YES) {
            
            _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight - 86) collectionViewLayout:layout];
            
        } else {
            
            _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight - 64) collectionViewLayout:layout];
            
        }
        
        _homeCollectionView.backgroundColor = [UIColor whiteColor];
        
        _homeCollectionView.dataSource = self;
        _homeCollectionView.delegate = self;
        
        _homeCollectionView.showsVerticalScrollIndicator = NO;
        _homeCollectionView.showsHorizontalScrollIndicator = NO;
        
        //表头占位
        [_homeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        //头部banner
        [_homeCollectionView registerClass:[HomeBannerView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeBannerView"];
        //分组标题
        [_homeCollectionView registerClass:[HomeGroupTitleHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeGroupTitleHeadView"];
        
        //商品分类
        [_homeCollectionView registerClass:[HomeCategoriesCell class] forCellWithReuseIdentifier:@"HomeCategoriesCell"];
        //活动模块
        [_homeCollectionView registerClass:[HomeActivityModuleCell class] forCellWithReuseIdentifier:@"HomeActivityModuleCell"];
        //商品列表
        [_homeCollectionView registerClass:[HomeProductListCell class] forCellWithReuseIdentifier:@"HomeProductListCell"];
        
        // 尾部占位
        [_homeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];

    }
    return _homeCollectionView;
}

@end
