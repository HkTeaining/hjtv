//
//  ZjViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "ZjViewController.h"
#import "ZFirstViewController.h"
#import "ZSecondViewController.h"
#import "LoginViewController.h"
@interface ZjViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *sc;
@property (nonatomic ,strong) ZFirstViewController  *firstVC;
@property (nonatomic ,strong) ZSecondViewController *secondVC;
@property(nonatomic,strong)UIViewController  *currentVC;
@property(nonatomic,strong)UISegmentedControl *seg;
@property(nonatomic,strong)UIView *bjView;
@property(nonatomic,strong)UIView *selView;
@end

@implementation ZjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSc];
    [self setNav];
    [self setSelView];
}
-(void)setNav
{
    NSArray *ay=[[NSArray alloc]initWithObjects:@"追剧",@"缓存", nil];
    self.seg=[[UISegmentedControl alloc]initWithItems:ay];
    self.seg.frame=CGRectMake(0, 0, 80, 30);
    self.seg.selectedSegmentIndex=0;
    self.seg.tintColor=[UIColor whiteColor];
    [self.seg addTarget:self action:@selector(dj:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=self.seg;
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_person"] style:UIBarButtonItemStylePlain target:self action:@selector(login)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"编辑"  style:UIBarButtonItemStylePlain target:self action:@selector(bj)];
}
-(void)setSelView
{
//   self.selView=[[UIView alloc]initWithFrame:CGRectMake(0, 416-25+55, 320, 50)];
//    self.selView.backgroundColor=[UIColor grayColor];
//    UIButton *btnAll=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
//    [btnAll setTitle:@"全选" forState:UIControlStateNormal];
//    [btnAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnAll setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    [btnAll addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
//    UIButton *btnSc=[[UIButton alloc]initWithFrame:CGRectMake(170, 0, 150, 50)];
//    [btnSc setTitle:@"删除" forState:UIControlStateNormal];
//     [btnSc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnSc setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    [btnSc addTarget:self action:@selector(schu:) forControlEvents:UIControlEventTouchUpInside];
//    [self.selView addSubview:btnAll];
//    [self.selView addSubview:btnSc];
//    [self.view addSubview:self.selView];
    self.selView=[[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-64-25+55,[UIScreen mainScreen].bounds.size.width, 50)];
    self.selView.backgroundColor=[UIColor grayColor];
    UIButton *btnAll=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width/2.0-20, 50)];
    [btnAll setTitle:@"全选" forState:UIControlStateNormal];
    [btnAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnAll setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btnAll addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btnSc=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0+20, 0,[UIScreen mainScreen].bounds.size.width/2.0-20, 50)];
    [btnSc setTitle:@"删除" forState:UIControlStateNormal];
    [btnSc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnSc setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btnSc addTarget:self action:@selector(schu:) forControlEvents:UIControlEventTouchUpInside];
    [self.selView addSubview:btnAll];
    [self.selView addSubview:btnSc];
    [self.view addSubview:self.selView];
}
-(void)select:(id)sender
{
    NSLog(@"1");
}
-(void)schu:(id)sender
{
    NSLog(@"2");
}
bool orBJ=YES;
-(void)bj
{
    if (orBJ == YES) {
        [self bjView];
        self.navigationItem.rightBarButtonItem.title = @"取消";
        orBJ = !orBJ;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.1];
//        self.selView.frame=CGRectMake(0, 416-25, 320, 50);
         self.selView.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-64-25, [UIScreen mainScreen].bounds.size.width, 50);
        [UIView commitAnimations];
    }
    else{
        [self.bjView removeFromSuperview];
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        orBJ = !orBJ;
//        self.selView.frame=CGRectMake(0, 416-25+55, 320, 50);
      self.selView.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-64-25+55, [UIScreen mainScreen].bounds.size.width, 50);
    }
 NSLog(@"");
}
-(void)login
{
    LoginViewController *login=[[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"login"];
    [self.navigationController pushViewController:login animated:NO];
    NSLog(@"");
}
-(void)dj:(UIBarButtonItem *)btn
{
    NSUInteger count=self.seg.selectedSegmentIndex;
    if (count==0) {
        self.sc.contentOffset=CGPointMake(0, 0);
    }else
    {
//        self.sc.contentOffset=CGPointMake(320, 0);
        self.sc.contentOffset=CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    }
}
-(void)setSc
{
//    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,320,416-49)];
//    self.sc.backgroundColor = [UIColor whiteColor];
//    self.sc.bounces=NO;
//    self.sc.delegate = self;
//    self.firstVC = [[ZFirstViewController alloc] init];
//    [self.firstVC.view setFrame:CGRectMake(0,0,320,416-49)];
//    [self addChildViewController:self.firstVC];
//    [self.sc addSubview:self.firstVC.view];
//    self.secondVC = [[ZSecondViewController alloc] init];
//    [self.secondVC.view setFrame:CGRectMake(320, 0, 320, 416-49)];
//    [self addChildViewController:self.secondVC];
//    [self.sc addSubview:self.secondVC.view];
//    self.currentVC = self.firstVC;
//    self.sc.contentSize = CGSizeMake(640, 416-49);
//    self.sc.showsVerticalScrollIndicator = NO;
//    self.sc.showsHorizontalScrollIndicator = NO;
//    //sc.contentOffset = CGPointMake(200, 0);
//    self.sc.pagingEnabled = YES;
//    [self.view addSubview:self.sc];

    
    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-64-49)];
    self.sc.backgroundColor = [UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.delegate = self;
    self.firstVC = [[ZFirstViewController alloc] init];
    [self.firstVC.view setFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width-49-64)];
    [self addChildViewController:self.firstVC];
    [self.sc addSubview:self.firstVC.view];
    self.secondVC = [[ZSecondViewController alloc] init];
    [self.secondVC.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-64-49)];
    [self addChildViewController:self.secondVC];
    [self.sc addSubview:self.secondVC.view];
    self.currentVC = self.firstVC;
    self.sc.contentSize = CGSizeMake(2*[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49);
    self.sc.showsVerticalScrollIndicator = NO;
    self.sc.showsHorizontalScrollIndicator = NO;
    //sc.contentOffset = CGPointMake(200, 0);
    self.sc.pagingEnabled = YES;
    [self.view addSubview:self.sc];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>[UIScreen mainScreen].bounds.size.width-100) {
        self.seg.selectedSegmentIndex=1;
    }else
    {
        self.seg.selectedSegmentIndex=0;
    }

}
#pragma mark - setters getters
-(UIView *)bjView{
    if (!_bjView) {
        _bjView = [[UIView alloc]init];
        [self.view addSubview:_bjView];
    }
    return _bjView;
}

@end
