//
//  ForumViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "ForumViewController.h"

@interface ForumViewController ()

@end

@implementation ForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"讨论区";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - initView
-(void)initView{
    
}
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
