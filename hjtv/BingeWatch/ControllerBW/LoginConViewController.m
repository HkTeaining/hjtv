//
//  LoginConViewController.m
//  hjtv
//
//  Created by mac on 16/12/1.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "LoginConViewController.h"
#import "YzViewController.h"
#import "LoginViewController.h"


@interface LoginConViewController ()
@end

@implementation LoginConViewController
int flaglt=100;
- (void)viewDidLoad {
    [super viewDidLoad];
    }
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title = @"登录";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
//此方案逻辑明确(x)  x
//真实逻辑应用(x)  场景逻辑应用(x)   环境逻辑应用(x)  x x x
//逻辑所有明确(x): 这里(x)  其他(x)  x   x   
    if(flaglt==100)
    {
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
        {
            LoginViewController *login=[[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"login"];
            [self.navigationController pushViewController:login animated:NO];
            NSLog(@"");
            flaglt=10;
        }else
        {
            NSLog(@"已经登录");
        }

    }else
    {
        if(![[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.label.text=@"正在退出登录";
//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
//            float progress = 0.0f;
//            while (progress < 1.0f) {
//                progress += 0.01f;
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [MBProgressHUD HUDForView:self.view].progress = progress;
//                });
//                usleep(3);
//            }
//            dispatch_async(dispatch_get_main_queue(), ^{
//                   [HUD removeFromSuperview];
//            });
//        });
        [HUD showAnimated:YES  whileExecutingBlock:^{
            sleep(3);
        }completionBlock:^{
            [HUD removeFromSuperview];
        }];
        NSLog(@"退出登录");
        flaglt=100;
    }else
    {
    [self.navigationController popViewControllerAnimated:NO];
    flaglt=100;
    }
    }
}
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)wLogin:(id)sender {
    YzViewController *yz=[YzViewController new];
    [self.navigationController pushViewController:yz animated:YES];
}
- (IBAction)wxLofin:(id)sender {
      NSLog(@"暂时不支持");
}
- (IBAction)qqLogin:(id)sender {
        NSLog(@"暂时不支持");
}

@end
