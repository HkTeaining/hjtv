//
//  RMainViewController.m
//  hanjutv
//
//  Created by mac on 16/11/22.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RMainViewController.h"
#import "RFirstViewController.h"
#import "RSecondViewController.h"
#import "SearchTwoViewController.h"

@interface RMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *hjbtn;
@property (weak, nonatomic) IBOutlet UIButton *mxbtn;
@property (weak, nonatomic) IBOutlet UIView *mytopView;
@property(nonatomic,retain)UIView *viewLine;
@property(nonatomic,strong)UIScrollView *sc;
@property(nonatomic,strong)UIViewController  *currentVC;
@property (nonatomic ,strong) RFirstViewController  *firstVC;
@property (nonatomic ,strong) RSecondViewController *secondVC;

@end

@implementation RMainViewController
- (IBAction)search:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SearchTwoViewController" bundle:nil];
    SearchTwoViewController *searchTwoVC = [sb instantiateViewControllerWithIdentifier:@"SearchTwoViewController"];
    [self presentViewController:searchTwoVC animated:YES completion:nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLine];
    [self setSc];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden=YES;
    self.tabBarController.tabBar.hidden=NO;
}
- (IBAction)hjbn:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.viewLine.frame=CGRectMake(self.hjbtn.frame.origin.x+10, self.hjbtn.frame.origin.y+25, 40, 2);
    self.sc.contentOffset=CGPointMake(0,0);
    [UIView commitAnimations];
//    [self replaceController:self.currentVC newController:self.firstVC];

}
- (IBAction)mxbn:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.viewLine.frame=CGRectMake(self.mxbtn.frame.origin.x+10, self.mxbtn.frame.origin.y+25, 40, 2);
    self.sc.contentOffset=CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    [UIView commitAnimations];
//    [self replaceController:self.currentVC newController:self.secondVC];
}
-(void)setSc
{
//    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,320,416-49)];
//    self.sc.backgroundColor = [UIColor whiteColor];
//    self.sc.bounces=NO;
//    self.sc.delegate = self;
//    self.firstVC = [[RFirstViewController alloc] init];
//    [self.firstVC.view setFrame:CGRectMake(0,0, 320, 416-49)];
//    [self addChildViewController:self.firstVC];
//    [self.sc addSubview:self.firstVC.view];
//    self.secondVC = [[RSecondViewController alloc] init];
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
    self.sc=[[UIScrollView alloc]init];
    [self.view addSubview:self.sc];
    self.sc.backgroundColor=[UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.pagingEnabled = YES;
    self.sc.showsHorizontalScrollIndicator = NO;
    self.sc.delegate=self;
    [self.sc makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height-49-64);
    }];
    self.firstVC=[[RFirstViewController alloc] init];
    [self addChildViewController:self.firstVC];
    [self.sc addSubview:self.firstVC.view];
    [self.firstVC.view  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height-49-64);
        make.left.equalTo(self.sc.mas_left).offset(0);
        make.right.equalTo(self.sc.mas_right).offset(-[UIScreen mainScreen].bounds.size.width);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
    self.secondVC=[[RSecondViewController alloc]init];
    [self.sc addSubview:self.secondVC.view];
    [self addChildViewController:self.secondVC];
    [self.secondVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.equalTo([UIScreen mainScreen].bounds.size.height-49-64);
        make.left.equalTo(self.secondVC.view.mas_left).offset(0);
        make.right.equalTo(self.sc.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>[UIScreen mainScreen].bounds.size.width-100) {
        [self setLine:@"mxbtn"];
    }else
    {
       [self setLine:@"hjbtn"];
    }

}
//- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
//{
//    [self transitionFromViewController:oldController toViewController:newController duration:1.0 options:UIViewAnimationOptionCurveLinear animations:nil completion:^(BOOL finished) {
//        if (finished) {
//        self.currentVC = newController;
//        }else{
//            self.currentVC = oldController;
//        }
//    }];
//}
-(void)setLine
{
    self.viewLine=[[UIView alloc]initWithFrame:CGRectMake(self.hjbtn.frame.origin.x+10, self.hjbtn.frame.origin.y+25, 40, 2)];
    self.viewLine.backgroundColor=[UIColor whiteColor];
    //    NSLog(@"%f--%f",self.hjbtn.frame.origin.x,self.hjbtn.frame.origin.y);
    [self.mytopView addSubview:self.viewLine];
}
-(void)setLine:(NSString *)str
{
    if ([str isEqualToString:@"hjbtn"]) {
        self.viewLine.frame=CGRectMake(self.hjbtn.frame.origin.x+10, self.hjbtn.frame.origin.y+25, 40, 2);
    }else
    {
      self.viewLine.frame=CGRectMake(self.mxbtn.frame.origin.x+10, self.mxbtn.frame.origin.y+25, 40, 2);
    }
}
@end
//1 1 1 x x x