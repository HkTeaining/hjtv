//
//  XxViewController.m
//  hjtv
//
//  Created by mac on 16/12/2.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "XxViewController.h"

@interface XxViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWeb;

@end

@implementation XxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=[[NSString stringWithFormat:@"http://baike.baidu.com/item/%@",@"朴信惠"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.myWeb loadRequest:request];
}
@end
