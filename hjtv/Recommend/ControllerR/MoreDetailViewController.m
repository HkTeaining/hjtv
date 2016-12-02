//
//  MoreDetailViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "MoreDetailViewController.h"
#import "RankTableViewOneCell.h"
#import "RankTableViewTwoCell.h"
#import "NetRequestClass+Recommend.h"
#import "UIImageView+WebCache.h"
#import "StarDetailViewController.h"
#import "LoginConViewController.h"

@interface MoreDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTabView;
@property(nonatomic,strong)NSArray *moreinfo;
@end
dispatch_semaphore_t sema1;
@implementation MoreDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title=@"明星排行榜";
//    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self.myTabView registerNib:[UINib nibWithNibName:@"RankTableViewTwoCell" bundle:nil] forCellReuseIdentifier:@"cellrank2"];
    [self.myTabView registerNib:[UINib nibWithNibName:@"RankTableViewOneCell" bundle:nil] forCellReuseIdentifier:@"cellrank1"];
    [self getModelData];
//    self.myTabView.delegate=self;
//    self.myTabView.dataSource=self;
    [self addHeader];
    [self addFooter];
}
-(void)getModelData
{
//    sema1 = dispatch_semaphore_create(0);
//     __unsafe_unretained typeof(self) vc = self;
    [NetRequestClass getMoreInfoForRequestUrl:secondUrlMoreInfo  WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        self.moreinfo=returnValue;
        self.myTabView.delegate=self;
        self.myTabView.dataSource=self;//1 1 x x
//        dispatch_semaphore_signal(sema1);
        [self.myTabView reloadData];
    }];
//    dispatch_semaphore_wait(sema1, DISPATCH_TIME_FOREVER);
//    vc.myTabView.delegate=self;
//    vc.myTabView.dataSource=self;
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
if(indexPath.row==0)
{
    return 250;
}else
{
    return 90;
}
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.moreinfo.count-2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
    RankTableViewOneCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellrank1" forIndexPath:indexPath];
    UIButton *btnOne=(UIButton *)[cell viewWithTag:700];
        [btnOne addTarget:self action:@selector(btnOne:) forControlEvents:  UIControlEventTouchUpInside];
    UIButton *btnTwo=(UIButton *)[cell viewWithTag:800];
        [btnTwo addTarget:self action:@selector(btnTwo:) forControlEvents:  UIControlEventTouchUpInside];
    UIButton *btnThree=(UIButton *)[cell viewWithTag:900];
        [btnThree addTarget:self action:@selector(btnThree:) forControlEvents:  UIControlEventTouchUpInside];
    UIImageView *im1=(UIImageView *)[cell viewWithTag:100];
    im1.image=[UIImage imageNamed:@"star_special_rank_2"];
    UIImageView *im2=(UIImageView *)[cell viewWithTag:200];
    im2.image=[UIImage imageNamed:@"star_special_rank_1"];
    UIImageView *im3=(UIImageView *)[cell viewWithTag:300];
    im3.image=[UIImage imageNamed:@"star_special_rank_3"];
    UIImageView *im4=(UIImageView *)[cell viewWithTag:400];
    UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap1:)];
        [im4 addGestureRecognizer:singleTap1];
        im4.userInteractionEnabled=YES;
    [im4 sd_setImageWithURL:[NSURL URLWithString:[self.moreinfo[1] objectForKey:@"thumb"]] placeholderImage:nil];
    UIImageView *im5=(UIImageView *)[cell viewWithTag:500];
    UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap2:)];
        [im5 addGestureRecognizer:singleTap2];
        im5.userInteractionEnabled=YES;
    [im5 sd_setImageWithURL:[NSURL URLWithString:[self.moreinfo[0] objectForKey:@"thumb"]] placeholderImage:nil];
    UIImageView *im6=(UIImageView *)[cell viewWithTag:600];
    UITapGestureRecognizer *singleTap3 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap3:)];
        [im6 addGestureRecognizer:singleTap3];
        im6.userInteractionEnabled=YES;
    [im6 sd_setImageWithURL:[NSURL URLWithString:[self.moreinfo[2] objectForKey:@"thumb"]] placeholderImage:nil];
    UILabel *la4=(UILabel *)[cell viewWithTag:1000];
    la4.text=[self.moreinfo[1] objectForKey:@"name"];
    UILabel *la5=(UILabel *)[cell viewWithTag:1100];
    la5.text=[self.moreinfo[0] objectForKey:@"name"];
    UILabel *la6=(UILabel *)[cell viewWithTag:1200];
    la6.text=[self.moreinfo[2] objectForKey:@"name"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    }
    else
    {
//        if(indexPath.row==30)
//        {
//            return nil;
//        }else
//        {
            RankTableViewTwoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellrank2" forIndexPath:indexPath];
        UIButton *btnFour=(UIButton *)[cell viewWithTag:600];
        [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:  UIControlEventTouchUpInside];
            UILabel *la1=(UILabel *)[cell viewWithTag:100];
           //注意nscnumber.....错误
            la1.text=[NSString stringWithFormat:@"%@",[self.moreinfo[indexPath.row+2] objectForKey:@"rank"]];
            UIImageView *im1=(UIImageView *)[cell viewWithTag:200];
            [im1 sd_setImageWithURL:[NSURL URLWithString:[self.moreinfo[indexPath.row+2] objectForKey:@"thumb"]] placeholderImage:nil];
            UILabel *la2=(UILabel *)[cell viewWithTag:300];
            la2.text=[self.moreinfo[indexPath.row+2] objectForKey:@"name"];
            UILabel *la3=(UILabel *)[cell viewWithTag:400];
            la3.text=[NSString stringWithFormat:@"%.1f万",[[self.moreinfo[indexPath.row+2] objectForKey:@"fansCount"] floatValue]/10000];
            return cell;
}
}
- (void)singleTap1:(UITapGestureRecognizer *)tap {
    StarDetailViewController *rdetail=[[StarDetailViewController alloc]init];
    [self.navigationController pushViewController:rdetail animated:YES];
}- (void)singleTap2:(UITapGestureRecognizer *)tap {
     StarDetailViewController *rdetail=[[StarDetailViewController alloc]init];
    [self.navigationController pushViewController:rdetail animated:YES];
}
- (void)singleTap3:(UITapGestureRecognizer *)tap {
     StarDetailViewController *rdetail=[[StarDetailViewController alloc]init];
    [self.navigationController pushViewController:rdetail animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StarDetailViewController *rdetail=[[StarDetailViewController alloc]init];
    [self.navigationController pushViewController:rdetail animated:YES];
}
-(void)btnOne:(UIButton *)btn
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"flaggz"] isEqualToString:@"1"])
            
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"取消关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"flaggz"];
        }else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"已关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"flaggz"];
        }
    }else
    {
        LoginConViewController *con=[LoginConViewController new];
        [self.navigationController pushViewController:con animated:YES];
    }
}
-(void)btnTwo:(UIButton *)btn
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"flaggz"] isEqualToString:@"1"])
            
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"取消关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"flaggz"];
        }else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"已关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"flaggz"];
        }
    }else
    {
        LoginConViewController *con=[LoginConViewController new];
        [self.navigationController pushViewController:con animated:YES];
    }

}
-(void)btnThree:(UIButton *)btn
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"flaggz"] isEqualToString:@"1"])
            
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"取消关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"flaggz"];
        }else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"已关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"flaggz"];
        }
    }else
    {
        LoginConViewController *con=[LoginConViewController new];
        [self.navigationController pushViewController:con animated:YES];
    }

}
-(void)btnFour:(UIButton *)btn
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ak"])
    {
        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"flaggz"] isEqualToString:@"1"])

        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"取消关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"flaggz"];
        }else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"已关注";
            hud.margin = 10.f;
            hud.removeFromSuperViewOnHide = YES;
             [hud hideAnimated:YES afterDelay:1];
         [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"flaggz"];
        }
    }else
    {
        LoginConViewController *con=[LoginConViewController new];
        [self.navigationController pushViewController:con animated:YES];
    }

}
- (void)addHeader
{
    __unsafe_unretained typeof(self) vc = self;
    [self.myTabView addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc.myTabView reloadData];
            [vc.myTabView headerEndRefreshing];
        });
    }];
}
int rowCountTwo=30;
- (void)addFooter
{
    __unsafe_unretained typeof(self) vc = self;
    [self.myTabView addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            rowCountTwo=rowCountTwo+100;
            NSString *url=[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/star/hotStars?_ts=1480301943418&count=%d&offset=0",rowCountTwo];
            [NetRequestClass getMoreInfoForRequestUrl:url  WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
                self.moreinfo=returnValue;
                [vc.myTabView reloadData];
                [vc.myTabView headerEndRefreshing];
            }];
  
        });
    }];
}
@end
