//
//  HeadViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "HeadViewController.h"
#import "XxViewController.h"
#import "LoginConViewController.h"

@interface HeadViewController ()

@end

@implementation HeadViewController
- (IBAction)gz:(id)sender {
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"flaggz"] isEqualToString:@"1"])
        {
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"取消关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"flaggz"];
        }else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"已关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"flaggz"];
        }
    }else
    {
        LoginConViewController *con=[LoginConViewController new];
        [self.navigationController pushViewController:con animated:YES];
    }
}
- (IBAction)xxzl:(id)sender {
    XxViewController *xx=[XxViewController new];
    [self.navigationController pushViewController:xx animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
