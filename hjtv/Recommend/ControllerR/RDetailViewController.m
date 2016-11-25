//
//  RDetailViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RDetailViewController.h"
#import "RPlayViewController.h"
#import "RSSecondViewController.h"
#import "RSFirstViewController.h"
#import "RSThreeViewController.h"
#import "NetRequestClass+Recommend.h"
#import  "UIImageView+WebCache.h"
#import "HjInfoSeries.h"

@interface RDetailViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mg;
@property (weak, nonatomic) IBOutlet UIImageView *bgmg;
@property (weak, nonatomic) IBOutlet UILabel *js;
@property (weak, nonatomic) IBOutlet UILabel *ly;
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property (weak, nonatomic) IBOutlet UIImageView *starOne;
@property (weak, nonatomic) IBOutlet UIImageView *starTwo;
@property (weak, nonatomic) IBOutlet UIImageView *starThree;
@property (weak, nonatomic) IBOutlet UIImageView *starFour;
@property (weak, nonatomic) IBOutlet UIImageView *starFive;
@property (weak, nonatomic) IBOutlet UIScrollView *sc;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIButton *jq;
@property (weak, nonatomic) IBOutlet UIButton *xq;
@property (weak, nonatomic) IBOutlet UIButton *tlq;
@property(nonatomic,strong)UIView *viewLine;
@property(nonatomic,strong)UIViewController  *currentVC;
@property (nonatomic ,strong) RSFirstViewController  *firstVC;
@property (nonatomic ,strong) RSSecondViewController *secondVC;
@property (nonatomic ,strong) RSThreeViewController *threeVC;
@property(nonatomic,strong)NSMutableArray *seriesArray;
@property(nonatomic,strong)NSMutableArray *playArray;
@end

@implementation RDetailViewController
dispatch_semaphore_t sema;
- (IBAction)tlbtn:(id)sender {
    self.sc.contentOffset=CGPointMake(640, 0);
    [self setLine:@"tlq"];
}
- (IBAction)xqbtn:(id)sender {
    self.sc.contentOffset=CGPointMake(320, 0);
     [self setLine:@"xq"];
}
- (IBAction)jubtn:(id)sender {
    self.sc.contentOffset=CGPointMake(0, 0);
     [self setLine:@"jq"];
}
- (IBAction)play:(id)sender {
    RPlayViewController *play=[[RPlayViewController alloc]init];
    play.url=[self.playArray[0] objectForKey:@"srcUrl"];
    [self presentViewController:play animated:YES completion:nil];
//    [self.navigationController pushViewController:play animated:YES];
}
- (IBAction)hc:(id)sender {
}
-(void)getModelData
{
   [NetRequestClass getHjVideoInfoForRequestUrl:firstUrlInfo WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
       self.seriesArray=returnValue2;
       self.playArray=returnValue1;
       NSLog(@"%@--%d----%@--%@",self.seriesArray,self.seriesArray.count,self.seriesArray[0],self.playArray);
       [self setInfo];
       [self setNavigation];
   }];
}
-(void)setInfo
{
    HjInfoSeries *ins=(HjInfoSeries *)self.seriesArray[0];
    
    [self.mg sd_setImageWithURL:[NSURL URLWithString:ins.thumb] placeholderImage:nil];
    self.rank.text=[NSString stringWithFormat:@"%.1f",(float)ins.rank/10];
    self.rank.font=[UIFont systemFontOfSize:8];
    self.rank.textColor=[UIColor orangeColor];
    self.ly.text=ins.source;
    if (ins.isFinished) {
        self.js.text=[NSString stringWithFormat:@"%d集全",ins.count];
        self.js.font=[UIFont systemFontOfSize:12];
        self.js.textColor=[UIColor greenColor];
    }else
    {
         self.js.text=[NSString stringWithFormat:@"更新到第%d集",ins.count];
         self.js.font=[UIFont systemFontOfSize:12];
         self.js.textColor=[UIColor greenColor];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLine];
    [self setSc];
    [self getModelData];
}
-(void)setNavigation
{
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    self.navigationItem.title=[NSString stringWithFormat:@"%@",[self.seriesArray[0] name]];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(dj)];
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
}
-(void)setSc
{
    self.sc.backgroundColor = [UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.delegate=self;
    self.sc.contentSize = CGSizeMake(960, 216-49);
    self.sc.showsVerticalScrollIndicator = NO;
    self.sc.showsHorizontalScrollIndicator = NO;
    self.sc.pagingEnabled = YES;
    self.firstVC = [[RSFirstViewController alloc] init];
    [self.firstVC.view setFrame:CGRectMake(0,0, 320, 216-49)];
    [self addChildViewController:self.firstVC];
    [self.sc addSubview:self.firstVC.view];
    self.secondVC = [[RSSecondViewController alloc] init];
    [self.secondVC.view setFrame:CGRectMake(320, 0, 320, 216-49)];
    [self addChildViewController:self.secondVC];
    [self.sc addSubview:self.secondVC.view];
    self.threeVC = [[RSThreeViewController alloc] init];
    [self.threeVC.view setFrame:CGRectMake(640, 0, 320, 216-49)];
    [self addChildViewController:self.threeVC];
    [self.sc addSubview:self.threeVC.view];
    self.currentVC = self.firstVC;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>600) {
        [self setLine:@"tlq"];
    }else
    {
   if (scrollView.contentOffset.x>300) {
            [self setLine:@"xq"];
        }else
        {
        [self setLine:@"jq"];
        }
    }
}
-(void)setLine
{
    self.viewLine=[[UIView alloc]initWithFrame:CGRectMake(self.jq.frame.origin.x, self.jq.frame.origin.y+30, 50, 2)];
    self.viewLine.backgroundColor=[UIColor redColor];
    [self.myView addSubview:self.viewLine];
}
-(void)setLine:(NSString *)str
{
    if ([str isEqualToString:@"jq"]) {
        self.viewLine.frame=CGRectMake(self.jq.frame.origin.x, self.jq.frame.origin.y+30, 50, 2);
    }else if([str isEqualToString:@"xq"])
    {
        self.viewLine.frame=CGRectMake(self.xq.frame.origin.x, self.xq.frame.origin.y+30, 50, 2);
    }else
    {
     self.viewLine.frame=CGRectMake(self.tlq.frame.origin.x, self.tlq.frame.origin.y+30, 50, 2);
    }
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)dj
{
    NSLog(@"");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
