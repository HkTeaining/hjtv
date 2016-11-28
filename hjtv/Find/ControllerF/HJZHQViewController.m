//
//  HJZHQViewController.m
//  hjtv
//
//  Created by mac on 16/11/27.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "HJZHQViewController.h"

@interface HJZHQViewController ()

@end

@implementation HJZHQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"讨论区";
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
