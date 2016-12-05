//
//  RSFirstViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RSFirstViewController.h"
#import "NetRequestClass+Recommend.h"
#import "RPlayViewController.h"

@interface RSFirstViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *playArray;
@property(nonatomic,strong)UIScrollView *sc;
@end

@implementation RSFirstViewController
//1 1 x x
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getModelData];
   
}
-(void)setSc
{
//    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,320,216-49)];
//    self.sc.backgroundColor = [UIColor whiteColor];
//    self.sc.bounces=NO;
//    self.sc.delegate = self;
//    self.sc.showsVerticalScrollIndicator = NO;
//    self.sc.showsHorizontalScrollIndicator = NO;
//
//    self.sc.pagingEnabled = NO;
//    [self.view addSubview:self.sc];
    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:self.sc];
    self.sc.backgroundColor = [UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.delegate = self;
    self.sc.showsVerticalScrollIndicator = NO;
    self.sc.showsHorizontalScrollIndicator = NO;
    self.sc.pagingEnabled =NO;
//    [self.sc makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(0);
//        make.right.equalTo(self.view.mas_right).offset(0);
//        make.top.equalTo(self.view.mas_top).offset(0);
//        make.bottom.equalTo(self.view.mas_bottom).offset(0);
//    }];
}
-(void)getModelData
{
    NSLog(@"%@",[self.recivceTwoArray[self.selectTwoRow] objectForKey:@"sid"]);
    [NetRequestClass getHjVideoInfoForRequestUrl:[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/series/detailV3?&sid=%@",[self.recivceTwoArray[self.selectTwoRow] objectForKey:@"sid"]] WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
        self.playArray=returnValue1;
        [self setSc];
        [self setBtn];
    }];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//     [self setBtn];
//}
-(void)setBtn
{
    float col = ([UIScreen mainScreen].bounds.size.width-4*60)/5.0;
    float row = (216-3*30)/4.0;
    for (int i = 0 ; i < self.playArray.count ; i++) {
    UIButton *vi = [[UIButton alloc] initWithFrame:CGRectMake(col+(col+60)*(i%4), row+(row+30)*(i/4), 60, 30)];
        [vi setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [vi addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        vi.layer.masksToBounds=YES;
        vi.layer.cornerRadius=25;
        vi.tag=i+1;
        vi.backgroundColor=[UIColor darkGrayColor];
        [self.sc addSubview:vi];
    }
//    self.sc.contentSize=CGSizeMake(320, self.playArray.count*30/4+50+self.playArray.count*row/4);
        self.sc.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, self.playArray.count*30/4+50+self.playArray.count*row/4);
}
-(void)jump:(UIButton *)btn
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.label.text=@"请稍等";
    [HUD showAnimated:YES  whileExecutingBlock:^{
        sleep(2);
    }completionBlock:^{
    [HUD removeFromSuperview];
    //    self.sendBlock(self.playArray[btn.tag-1]);
    RPlayViewController *play=[RPlayViewController new];
    play.url=[self.playArray[btn.tag-1] objectForKey:@"srcUrl"];
    play.Jurl=[self.recivceTwoArray[self.selectTwoRow] objectForKey:@"name"];
    play.Jcount=btn.tag-1;
    [self presentViewController:play animated:NO completion:nil];
    //        [self.navigationController pushViewController:play animated:YES];

    }];
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
