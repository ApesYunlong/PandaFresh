//
//  MineViewController.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/1/31.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *lab = [[UILabel alloc] init];
    
    if (IS_IPHONE_X == YES) {
        [lab setFrame:CGRectMake(iPhoneX_LineX(10), iPhoneX_LineY(20), iPhoneX_LineX(300), iPhoneX_LineY(200))];
    } else {
        [lab setFrame:CGRectMake(LineX(10), LineY(20), LineX(300), LineY(200))];
    }
    
    [lab setBackgroundColor:[UIColor yellowColor]];
    
    [self.view addSubview:lab];
    
}

@end
