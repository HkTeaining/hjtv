//
//  StarZHQViewController.m
//  hjtv
//
//  Created by mac on 16/11/27.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "StarZHQViewController.h"

@interface StarZHQViewController ()

@end

@implementation StarZHQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"讨论区";
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
}
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
