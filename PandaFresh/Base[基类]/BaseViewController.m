//
//  BaseViewController.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/1/31.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:DEFAULT_COLOR_F2F2F2];
    
}


@end
