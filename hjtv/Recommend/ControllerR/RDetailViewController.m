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
#import "CacheViewController.h"

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
//1 1 x x
dispatch_semaphore_t sema;
- (IBAction)tlbtn:(id)sender {
    self.sc.contentOffset=CGPointMake(2*[UIScreen mainScreen].bounds.size.width, 0);
    [self setLine:@"tlq"];
}
- (IBAction)xqbtn:(id)sender {
    self.sc.contentOffset=CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
     [self setLine:@"xq"];
}
- (IBAction)jubtn:(id)sender {
    self.sc.contentOffset=CGPointMake(0, 0);
     [self setLine:@"jq"];
}
- (IBAction)play:(id)sender {
    MBProgressHUD *HUD= [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.label.text=@"请稍等";
    [HUD showAnimated:YES  whileExecutingBlock:^{
        sleep(2);
    }completionBlock:^{
    [HUD removeFromSuperview];
    RPlayViewController *play=[[RPlayViewController alloc]init];
    play.url=[self.playArray[0] objectForKey:@"srcUrl"];
    play.Jurl=[self.recivceArray[self.selectRow] objectForKey:@"name"];
    play.Jcount=0;
    [self presentViewController:play animated:NO completion:nil];
    //    [self.navigationController pushViewController:play animated:YES];
    }];
}
- (IBAction)hc:(id)sender {
   CacheViewController *cache=[[CacheViewController alloc]init];
    //有view传值(有x-view(x)对,无x-view(x)对错,x,x,),无view传值(有x-view(x)对,无x-view(x)对,x,x,),
    cache.btnCount=[(HjInfoSeries *)self.seriesArray[0] count];
    [self presentViewController:cache animated:YES completion:nil];
}
-(void)getModelData
{
   [NetRequestClass getHjVideoInfoForRequestUrl:[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/series/detailV3?&sid=%@",[self.recivceArray[self.selectRow] objectForKey:@"sid"]] WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
       self.seriesArray=returnValue2;
       self.playArray=returnValue1;
//       NSLog(@"%@--%d----%@--%@",self.seriesArray,self.seriesArray.count,self.seriesArray[0],self.playArray);
       [self setInfo];
       [self setNavigation];
        [self setSc];
   }];
}
-(void)setInfo
{
    HjInfoSeries *ins=(HjInfoSeries *)self.seriesArray[0];
    
    [self.mg sd_setImageWithURL:[NSURL URLWithString:ins.thumb] placeholderImage:nil];
    self.rank.text=[NSString stringWithFormat:@"%.1f",(float)ins.rank/10];
    self.rank.font=[UIFont systemFontOfSize:13];
    self.rank.textColor=[UIColor orangeColor];
    self.ly.text=ins.source;
    if (ins.isFinished) {
        self.js.text=[NSString stringWithFormat:@"%ld集全",ins.count];
        self.js.font=[UIFont systemFontOfSize:12];
        self.js.textColor=[UIColor greenColor];
    }else
    {
         self.js.text=[NSString stringWithFormat:@"更新到第%ld集",ins.count];
         self.js.font=[UIFont systemFontOfSize:12];
         self.js.textColor=[UIColor greenColor];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLine];
//1 2 x x[self setSc];//1 //2 x x; x ;x;
    [self getModelData];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
}
-(void)setNavigation
{
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title=[NSString stringWithFormat:@"%@",[self.seriesArray[0] name]];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bbs_detail_like"] style:UIBarButtonItemStylePlain target:self action:@selector(dj)];
}
-(void)setSc
{
//    self.sc.backgroundColor = [UIColor whiteColor];
//    self.sc.bounces=NO;
//    self.sc.delegate=self;
//    self.sc.contentSize = CGSizeMake(960, 216-49);
//    self.sc.showsVerticalScrollIndicator = NO;
//    self.sc.showsHorizontalScrollIndicator = NO;
//    self.sc.pagingEnabled = YES;
//    self.firstVC = [[RSFirstViewController alloc] init];
//    self.firstVC.recivceTwoArray=self.recivceArray;
//    self.firstVC.selectTwoRow=self.selectRow;
////     self.firstVC.recivceTwoArray=self.seriesArray;;
//    [self.firstVC.view setFrame:CGRectMake(0,0, 320, 216-49)];
//    [self addChildViewController:self.firstVC];
//    [self.sc addSubview:self.firstVC.view];
//    self.secondVC = [[RSSecondViewController alloc] init];
//    [self.secondVC.view setFrame:CGRectMake(320, 0, 320, 216-49)];
//    self.secondVC.recivceThreeArray=self.recivceArray;
////    self.secondVC.recivceThreeArray=self.seriesArray;;
//    self.secondVC.selectThreeRow=self.selectRow;
//    [self addChildViewController:self.secondVC];
//    [self.sc addSubview:self.secondVC.view];
//    self.threeVC = [[RSThreeViewController alloc] init];
//    [self.threeVC.view setFrame:CGRectMake(640, 0, 320, 216-49)];
//    [self addChildViewController:self.threeVC];
//    [self.sc addSubview:self.threeVC.view];
//    self.currentVC = self.firstVC;
    self.sc.backgroundColor = [UIColor whiteColor];
    self.sc.bounces=NO;
    self.sc.delegate=self;
    self.sc.showsVerticalScrollIndicator = NO;
    self.sc.showsHorizontalScrollIndicator = NO;
    self.sc.pagingEnabled = YES;
    self.firstVC = [[RSFirstViewController alloc] init];
    self.firstVC.recivceTwoArray=self.recivceArray;
    self.firstVC.selectTwoRow=self.selectRow;
    [self addChildViewController:self.firstVC];
    [self.sc addSubview:self.firstVC.view];
    [self.firstVC.view  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
          //这里scrolview height尺寸问题
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height-260-65);
        make.left.equalTo(self.sc.mas_left).offset(0);
        make.right.equalTo(self.sc.mas_right).offset(-2*[UIScreen mainScreen].bounds.size.width);
        make.bottom.equalTo(self.sc.mas_bottom).offset(0);
        make.top.equalTo(self.sc.mas_top).offset(0);
    }];
    self.secondVC = [[RSSecondViewController alloc] init];
    self.secondVC.recivceThreeArray=self.recivceArray;
    self.secondVC.selectThreeRow=self.selectRow;
    [self addChildViewController:self.secondVC];
    [self.sc addSubview:self.secondVC.view];
    [self.secondVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        //这里scrolview height尺寸问题
        make.height.equalTo([UIScreen mainScreen].bounds.size.height-260-65);
        make.left.equalTo(self.firstVC.view.mas_right).offset(0);
        make.right.equalTo(self.sc.mas_right).offset(-[UIScreen mainScreen].bounds.size.width);
        make.bottom.equalTo(self.sc.mas_bottom).offset(0);
        make.top.equalTo(self.sc.mas_top).offset(0);
    }];
    self.threeVC = [[RSThreeViewController alloc] init];
    [self addChildViewController:self.threeVC];
    [self.sc addSubview:self.threeVC.view];
    [self.threeVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([UIScreen mainScreen].bounds.size.width);
          //这里scrolview height尺寸问题
        make.height.equalTo([UIScreen mainScreen].bounds.size.height-260-65);
        make.left.equalTo(self.secondVC.view.mas_right).offset(0);
        make.right.equalTo(self.sc.mas_right).offset(0);
        make.bottom.equalTo(self.sc.mas_bottom).offset(0);
        make.top.equalTo(self.sc.mas_top).offset(0);
    }];
    self.currentVC = self.firstVC;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>2*[UIScreen mainScreen].bounds.size.width-100) {
        [self setLine:@"tlq"];
    }else
    {
   if (scrollView.contentOffset.x>[UIScreen mainScreen].bounds.size.width-100) {
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
//        self.viewLine.frame=CGRectMake(self.xq.frame.origin.x, self.xq.frame.origin.y+30, 50, 2);
         self.viewLine.frame=CGRectMake(self.xq.frame.origin.x+25, self.xq.frame.origin.y+30, 50, 2);
    }else
    {
     self.viewLine.frame=CGRectMake(self.tlq.frame.origin.x, self.tlq.frame.origin.y+30, 50, 2);
    }
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//简单逻辑  复杂逻辑  x   x
//此处方法解决问题(x)  其他方法解决问题(x)   其他扩展方法x解决问题相应问题xx(x)  x  x  x
int pselectPop=0;
-(void)dj
{
    if(pselectPop==0)
    {
    self.navigationItem.rightBarButtonItem.image=[UIImage imageNamed:@"bbs_detail_like_highlight"];
        pselectPop=1;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = @"已加入追剧列表";
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:3];}
    else{
     self.navigationItem.rightBarButtonItem.image=[UIImage imageNamed:@"bbs_detail_like"];
        pselectPop=0;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"取消追剧列表";
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:3];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
