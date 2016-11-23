//
//  TabBarViewController.m
//  hjtv
//
//  Created by mac on 16/11/22.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    self.tabBar.tintColor = [UIColor orangeColor];
//    self.tabBar.barTintColor=[UIColor whiteColor];
//    self.tabBar.selectionIndicatorImage=[self imageFromColor:[UIColor orangeColor]];
//    self.tabBar.selectedImageTintColor=[UIColor orangeColor];
}
//-(UIImage *)imageFromColor:(UIColor *)color{
//    
//    CGRect rect = CGRectMake(0, 0, 3, 3);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return img;
//}
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
