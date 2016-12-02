//
//  CacheViewController.m
//  hjtv
//
//  Created by mac on 16/11/30.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "CacheViewController.h"
#import "CaseCacheViewController.h"

@interface CacheViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pc;
@property (weak, nonatomic) IBOutlet UIButton *qxd;
@end
//xibcell默认height不设置:49  storyboardcell默认height不设置:100   系统cell默认height不设置:49  x x x
//默认行高地点其他相关(1 1 1 1 1 1 x x x x x x)  设置行高地点其他相关(1 1 1 1 x x x x)  x  x
//约束:1 1 1 1 x x x x
//1UITableView/UIScrollView/UICollectionView/x/x/x   有导航  与上下(x)约束不约束距离0(x)(x)     与上下(x)约束不约束距离-100(x)(x)   x   x
//2UITableView/UIScrollView/UICollectionView/x/x/x   无导航  与上下(x)约束不约束距离0(x)(x)     与上下(x)约束不约束距离-100(x)(x)   x   x
//其他view:超出截取(x) 超出不截取(x) x x
//cell:超出截取(x) 超出不截取(x) 默认行高与设置行高出有此种出现默认截取默认不截取xx  x x x
@implementation CacheViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
int flag=0;
- (IBAction)changePc:(id)sender {
    //注意细节(x) x
    if(flag==0)
    {
    [UIView animateWithDuration:1 animations:^{
        self.pc.image=[UIImage imageNamed:@"star_watchlist_open"];
    }];
    UIView *pop=[[UIView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    pop.tag=100;
    pop.backgroundColor=[UIColor blackColor];
    pop.alpha=0.7;
    UIView *su=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 130)];
    su.alpha=1;
    su.backgroundColor=[UIColor whiteColor];
    UIButton *btnb=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-30, 20, 60, 20)];
    [btnb addTarget:self action:@selector(bq:) forControlEvents:UIControlEventTouchUpInside ];
    [btnb setTitle:@"标清" forState:UIControlStateNormal];
    [btnb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *btng=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-30, 60, 60, 20)];
    [btng addTarget:self action:@selector(bg:) forControlEvents:UIControlEventTouchUpInside ];
     [btng setTitle:@"高清" forState:UIControlStateNormal];
    [btng setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *btnc=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-30, 100, 60, 20)];
     [btnc setTitle:@"超清" forState:UIControlStateNormal];
    [btnc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnc addTarget:self action:@selector(bc:) forControlEvents:UIControlEventTouchUpInside ];
    [su addSubview:btnb];
    [su addSubview:btng];
    [su addSubview:btnc];
        [pop addSubview:su];
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width,130)];
        bgView.tag=90;
        bgView.backgroundColor=[UIColor redColor];
    [self.view addSubview:bgView];
        pop.tag=100;
    [self.view addSubview:pop];
        flag=1;}
    else
    {
    [UIView animateWithDuration:1 animations:^{
            self.pc.image=[UIImage imageNamed:@"star_watchlist_close"];
        }];
    [[self.view viewWithTag:100] removeFromSuperview];
    [[self.view viewWithTag:90] removeFromSuperview];
        flag=0;
    }
}
- (IBAction)cacheVideoCase:(id)sender {
    CaseCacheViewController *ase=[CaseCacheViewController new];
    ase.indexCount=self.btnCount;
    [self presentViewController:ase animated:YES completion:nil];
}
- (IBAction)cacheAll:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        for(int i=0;i<self.btnCount;i++)
        {
            [[self.view viewWithTag:1000+i] removeFromSuperview];
        }
    } completion:^(BOOL finished) {
        NSLog(@"123");
    }
     ];
//利用(x)现成规律逻辑  利用(x)现成非规律逻辑  x  x
//跳转是否:模态 push x x
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBtn];
}
-(void)setBtn
{
    float col = ([UIScreen mainScreen].bounds.size.width-4*60)/5.0;
    float row = (216-3*30)/4.0;
    for (int i = 0 ; i < self.btnCount ; i++) {
        UIButton *vi = [[UIButton alloc] initWithFrame:CGRectMake(col+(col+60)*(i%4), row+80+(row+30)*(i/4), 60, 30)];
        [vi setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [vi setBackgroundImage:[UIImage imageNamed:@"cache_caching"] forState:UIControlStateNormal];
        vi.layer.masksToBounds=YES;
        vi.layer.cornerRadius=5;
        vi.backgroundColor=[UIColor darkGrayColor];
        [self.view addSubview:vi];
    }

    for (int i = 0 ; i < self.btnCount ; i++) {
        UIButton *vi = [[UIButton alloc] initWithFrame:CGRectMake(col+(col+60)*(i%4), row+80+(row+30)*(i/4), 60, 30)];
        [vi setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [vi addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        vi.layer.masksToBounds=YES;
        vi.layer.cornerRadius=5;
        vi.tag=i+1000;
        vi.backgroundColor=[UIColor darkGrayColor];
        [self.view addSubview:vi];
    }
}
-(void)jump:(UIButton *)btn
{
    
    [UIView animateWithDuration:1 animations:^{
    [[self.view viewWithTag:btn.tag] setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height,0,0)];
    } completion:nil];
}
-(void)bq:(UIButton *)btn
{
    self.qxd.titleLabel.text=btn.titleLabel.text;
    [[self.view viewWithTag:100] removeFromSuperview];
    [[self.view viewWithTag:90] removeFromSuperview];
    flag=0;
}
-(void)bg:(UIButton *)btn
{
     self.qxd.titleLabel.text=btn.titleLabel.text;
    [[self.view viewWithTag:100] removeFromSuperview];
        [[self.view viewWithTag:90] removeFromSuperview];
      flag=0;
}
-(void)bc:(UIButton *)btn
{
     self.qxd.titleLabel.text=btn.titleLabel.text;
    [[self.view viewWithTag:100] removeFromSuperview];
        [[self.view viewWithTag:90] removeFromSuperview];
      flag=0;
}
@end
