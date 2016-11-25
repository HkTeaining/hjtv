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

@interface ZjViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *sc;
@property (nonatomic ,strong) ZFirstViewController  *firstVC;
@property (nonatomic ,strong) ZSecondViewController *secondVC;
@property(nonatomic,strong)UIViewController  *currentVC;
@property(nonatomic,strong)UISegmentedControl *seg;
@end

@implementation ZjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSc];
    [self setNav];
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
-(void)bj
{
 NSLog(@"");
}
-(void)login
{
    NSLog(@"");
}
-(void)dj:(UIBarButtonItem *)btn
{
    NSUInteger count=self.seg.selectedSegmentIndex;
    if (count==0) {
        self.sc.contentOffset=CGPointMake(0, 0);
    }else
    {
        self.sc.contentOffset=CGPointMake(320, 0);
    }
}
-(void)setSc
{
    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,320,416-49)];
    self.sc.backgroundColor = [UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.delegate = self;
    self.firstVC = [[ZFirstViewController alloc] init];
    [self.firstVC.view setFrame:CGRectMake(0,0, 320, 416-49)];
    [self addChildViewController:self.firstVC];
    [self.sc addSubview:self.firstVC.view];
    self.secondVC = [[ZSecondViewController alloc] init];
    [self.secondVC.view setFrame:CGRectMake(320, 0, 320, 416-49)];
    [self addChildViewController:self.secondVC];
    [self.sc addSubview:self.secondVC.view];
    self.currentVC = self.firstVC;
    self.sc.contentSize = CGSizeMake(640, 416-49);
    self.sc.showsVerticalScrollIndicator = NO;
    self.sc.showsHorizontalScrollIndicator = NO;
    //sc.contentOffset = CGPointMake(200, 0);
    self.sc.pagingEnabled = YES;
    [self.view addSubview:self.sc];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>300) {
        self.seg.selectedSegmentIndex=1;
    }else
    {
        self.seg.selectedSegmentIndex=0;
    }

}
@end
