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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLine];
    [self setSc];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden=YES;
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
    self.sc.contentOffset=CGPointMake(320, 0);
    [UIView commitAnimations];
//    [self replaceController:self.currentVC newController:self.secondVC];
}
-(void)setSc
{
    self.sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,320,416-49)];
    self.sc.backgroundColor = [UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.delegate = self;
    self.firstVC = [[RFirstViewController alloc] init];
    [self.firstVC.view setFrame:CGRectMake(0,0, 320, 416-49)];
    [self addChildViewController:self.firstVC];
    [self.sc addSubview:self.firstVC.view];
    self.secondVC = [[RSecondViewController alloc] init];
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
