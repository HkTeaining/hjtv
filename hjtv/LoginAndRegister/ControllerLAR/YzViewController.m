//
//  YzViewController.m
//  hjtv
//
//  Created by mac on 16/12/1.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "YzViewController.h"
#import "LoginViewController.h"
#import "AFNetworking.h"
#define kWEIBO_CLIENT_KEY @"3884427178"
#define kWEIBO_REDIRECT_URI @"http://www.baidu.com"
#define kWEIBO_CLIENT_SECRET @"1ff135e0008915209f0831b9bd4e3750"

@interface YzViewController ()<UIWebViewDelegate>
@property (strong, nonatomic)UIWebView *webView;
@property(nonatomic,strong)UIButton *backButton;
@end

@implementation YzViewController

#pragma mark - custom methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title = @"微博授权";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(tz)];
    self.webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.delegate=self;
    [self.view addSubview:_webView];
    [self showWebView];
}
-(void)back
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ak"];
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)tz
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        LoginViewController *login=[[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController pushViewController:login animated:NO];
        NSLog(@"");
        
    }else
    {
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.label.text=@"授权中,请稍等......";
        [HUD showAnimated:YES  whileExecutingBlock:^{
            sleep(3);
        }completionBlock:^{
            [HUD removeFromSuperview];
        }];
    }
}
//xian shi web view
- (void)showWebView
{
    NSString *path = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",kWEIBO_CLIENT_KEY,kWEIBO_REDIRECT_URI];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
//dai li
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL);
    NSString *absoluteString = request.URL.absoluteString;
    if ([absoluteString containsString:@"code="])
    {
        NSString *queryString = request.URL.query;
        NSArray *components = [queryString componentsSeparatedByString:@"="];
        NSString *codeStr = components[1];
        [self  requestCode:codeStr];
        return NO;
    }
    return YES;
}
//huo de token key
- (void)requestCode:(NSString *)code
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //注意:4 1 2 x  x  x
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    NSString *pathStr = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *parameters = @{
                                 @"client_id" : kWEIBO_CLIENT_KEY,
                                 @"client_secret" : kWEIBO_CLIENT_SECRET,
                                 @"grant_type" : @"authorization_code",
                                 @"code" : code,
                                 @"redirect_uri" : kWEIBO_REDIRECT_URI};
    [manager
     POST:pathStr parameters:parameters success:^(NSURLSessionDataTask * task, id responseObject)
     {
         NSLog(@"%@",responseObject);
         NSDictionary *dic=responseObject;
         NSString  *str=[dic objectForKey:@"access_token"];
         [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"ak"];
         [self.navigationController popViewControllerAnimated:YES];
     }
     failure:^(NSURLSessionDataTask * task, NSError * error)
     {
         NSLog(@"%@",error);
     }];

}
@end

