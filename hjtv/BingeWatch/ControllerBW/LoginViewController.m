//
//  LoginViewController.m
//  hjtv
//
//  Created by mac on 16/11/28.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginConViewController.h"
#import "ZjViewController.h"

@interface LoginViewController ()
@end
//注意这几个文件的关联(x)  以及默认隐藏的默认不隐藏的相应操作(x)   以及先后调用或者调用不调用问题(x)   x   x   x
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   }
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationItem.title = @"我";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationController.navigationBar.hidden=NO;
}
-(void)back:(UIButton *)btn
{
//    问题(x) 多个导航栏链上交错与自身导航栏交错分析明确(x) x  x
//    ZjViewController *zj=[ZjViewController new];
//    [self.navigationController popToViewController:zj animated:YES];
    NSLog(@"%@",self.navigationController.viewControllers);
//此方案逻辑明确(x) x
//    LoginConViewController *con=[LoginConViewController new];
//    con.lt=@"100";
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(indexPath.section==0)
   {
       NSLog(@"123");

   }else if(indexPath.section==1)
   {
       NSLog(@"1433");
   }else
   {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ak"];
       [self.navigationController popViewControllerAnimated:YES];   }
}
@end
