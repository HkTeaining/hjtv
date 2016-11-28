//
//  LoginViewController.m
//  hjtv
//
//  Created by mac on 16/11/28.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
}

-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
