//
//  StarDetailViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

//此其项目遇见bug即解决方法   x
//
//固定行高(x)  x/非自动布局(x)(绝对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)  自动布局(x)(相对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)  x  x/x/x/
//非固定行高(x) x/自动布局(x)(相对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)  非自动布局(x)(绝对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)   x  x/x/x/
//固定x(x) x/非自动布局(x)(绝对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)  自动布局(x)(相对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)  x  x/x/x/
//非固定(x) x/动布局(x)(相对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)   非自动布局(x)(绝对位置操作(1(父考虑) 1(子考虑) 1(父子结合考虑) x x x),x,)  x  x/x/x/
//x
//x
//x
//x
//
//
//
//任何处地tabcell(1(xib) 1(storyboard) 1(代码) x x x),横向位置已经定屏幕宽(x),但自身可以缩放(大 小 等),纵向动态改变代码或处地相应设置(x),但自身可以缩放(大 小 等),外层主导,内层辅助,x,x,
//任何处地colcell(1 1 1 x x x),横向位置动态改变代码或处地相应设置(x),但自身可以缩放(大 小 等),纵向动态改变代码或处地相应设置(x),但自身可以缩放(大 小 等),外层主导,内层辅助,x,x,
//任何处地view(1 1 1 x x x),横向位置动态改变代码或处地相应设置(x),纵向动态改变代码或处地相应设置(x),内层主导,外层-辅助-主导-x-x-x,x,x,
//模拟器类型(x)   界面类型设置(代码默认/x/x/,xib-interred/x/x/,storyboard-interred/x/x/,x,x,x,)   综合(合理效果,不合理效果,x,x,)   x   x   x
//x
//x
//x
//
//
//
//自动布局（x）  非自动布局（x) x x/动态行高（x）  静态行高（x） x x/x / x/
//uilabel(x)   x/自动布局（x）  非自动布局（x) x x/x/x/
//uiscrollview(x)  uitableview(x)  uicollectionview(x)  x x x/自动布局（x）  非自动布局（x) x x/x/x/
//其他(x)  x/自动布局（x）  非自动布局（x) x x/x/x/
//综合其他(x) x/自动布局（x）  非自动布局（x) x x/x/x/
//特殊综合其他(uiscrollview(x)  uitableview(x)  uicollectionview(x)  x x x,x,) x/自动布局（x）  非自动布局（x) x x/x/x/
//x
//x
//x
//x
//x
//x


#import "StarDetailViewController.h"
#import "NetRequestClass+Recommend.h"
#import "UIImageView+WebCache.h"
//没用这个视图(x)  重新构造视图(x)  非自动布局(x)  自动布局(x)  非自动布局/自动布局/x/x/    自动布局/非自动布局/x/x/  x  x/那里选择规格操作(选择,不选择,x,x,)  x/x    x    x
#import "HeadViewController.h"
#import "ZPUITableViewCell.h"
#import "ZXUITableViewCell.h"
#import "FSUITableViewCell.h"
#import "LoginConViewController.h"
#import "XxViewController.h"
//出现link command错误:文件重复(x)  导入.m文件(x) 全局变量重复定义(x)  x   x   x
@interface StarDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTabStarView;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,retain)NSMutableArray *orArray;
@end

@implementation StarDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectIndex=0;
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title=[NSString stringWithFormat:@"%@",[self.rArray[self.kj] objectForKey:@"name"]];
//    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//2(约束问题,非约束(无)问题,x,x,)
//    HeadViewController *head=[[HeadViewController alloc]init];
//    head.view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 130);
//    [self addChildViewController:head];
//    self.myTabStarView.tableHeaderView=head.view;
//3(约束无问题,非约束无问题,x,x,)
    UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,130)];
    vi.backgroundColor=[UIColor redColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,130)];
    imageView.image=[UIImage imageNamed:@"1"];
    UIImageView *imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(20, 14, 80,108)];
   [imageView1 sd_setImageWithURL:[NSURL URLWithString:[self.rArray[self.kj] objectForKey:@"thumb"]] placeholderImage:nil];
    UILabel *la=[[UILabel alloc]initWithFrame:CGRectMake(120, 30, 25, 25)];
    la.text=@"粉丝";
    la.font=[UIFont systemFontOfSize:10];
      UILabel *la1=[[UILabel alloc]initWithFrame:CGRectMake(158, 30, 25, 25)];
    la1.text=[NSString stringWithFormat:@"%.f万",[[self.rArray[self.kj] objectForKey:@"fansCount"] floatValue]/10000.0];
    la1.font=[UIFont systemFontOfSize:8];
    UILabel *la2=[[UILabel alloc]initWithFrame:CGRectMake(120,65, 25, 25)];
    la2.text=@"排名";
    la2.font=[UIFont systemFontOfSize:10];
  UILabel *la3=[[UILabel alloc]initWithFrame:CGRectMake(158,65, 25, 25)];
    la3.text=[NSString stringWithFormat:@"第%d名",[[self.rArray[self.kj] objectForKey:@"rank"] intValue]];
    la3.font=[UIFont systemFontOfSize:9];
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(120, 98, 73, 20)];
    [btn1 setTitle:@"关注" forState:UIControlStateNormal];
    btn1.titleLabel.font=[UIFont systemFontOfSize:15];
    btn1.backgroundColor=[UIColor redColor];
    btn1.layer.masksToBounds=YES;
    btn1.layer.cornerRadius=5;
    [btn1 addTarget:self action:@selector(goLg:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(228, 33, 63, 22)];
    [btn2 setTitle:@"详细资料" forState:UIControlStateNormal];
    btn2.titleLabel.font=[UIFont systemFontOfSize:13];
    btn2.backgroundColor=[UIColor grayColor];
    [btn2 addTarget:self action:@selector(goWeb:) forControlEvents:UIControlEventTouchUpInside];
    btn2.layer.masksToBounds=YES;
    btn2.layer.cornerRadius=5;
    [vi addSubview:imageView];
    [vi addSubview:imageView1];
    [vi addSubview:la];
    [vi addSubview:la1];
    [vi addSubview:la2];
    [vi addSubview:la3];
    [vi addSubview:btn1];
    [vi addSubview:btn2];
    self.myTabStarView.tableHeaderView=vi;
//1(约束问题,非约束问题,x,x,)         NSArray *ay=[[NSBundle mainBundle]loadNibNamed:@"HeadViewController" owner:self options:nil];
//        UIView *vi=ay[0];
//        self.myTabStarView.tableHeaderView=vi;
//        vi.frame=CGRectMake(0, 0, 320, 130);
//        NSLog(@"%@",vi);
//    [self.myTabStarView registerNib:[UINib nibWithNibName:@"ZXUITableViewCell" bundle:nil] forCellReuseIdentifier:@"zx"];
//    [self.myTabStarView registerNib:[UINib nibWithNibName:@"ZPUITableViewCell" bundle:nil] forCellReuseIdentifier:@"zp"];
//    [self.myTabStarView registerNib:[UINib nibWithNibName:@"FSUITableViewCell" bundle:nil] forCellReuseIdentifier:@"fs"];
//4 //5 //6
}
//所有视图嵌套操作(x) x
//1 1 1 x x x
//x
//x
-(void)goWeb:(UIButton *)btn
{
    XxViewController *xx=[XxViewController new];
    [self.navigationController pushViewController:xx animated:YES];

}
-(void)goLg:(UIButton *)btn
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
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 10;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell *cell=[[UICollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    cell.backgroundColor=[UIColor redColor];
//    return cell;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(tableView.tag==10)
//    {
//      return 1;
//    }else if(tableView.tag==20)
//    {
//        return 10;
//    }else
//    {
//        return 10;
//    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag==10)
    {
        if(self.selectIndex==0)
        {
            //    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            //    cell.backgroundColor=[UIColor redColor];
            //    return cell;
            //        ZXUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"zx" forIndexPath:indexPath];
            //        cell.backgroundColor=[UIColor redColor];
            //        return cell;
            static NSString *cellname=@"zx";
            ZXUITableViewCell *cell=(ZXUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[ZXUITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellname sendArrar:self.rArray sendIndex:self.kj];
            }
//                    cell.textLabel.text=@"2133";
            return cell;
        }else if(self.selectIndex==10)
        {
            //        ZXUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"zx" forIndexPath:indexPath];
            //          cell.backgroundColor=[UIColor redColor];
            //        return cell;
            static NSString *cellname=@"zx";
            ZXUITableViewCell *cell=(ZXUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[ZXUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
//                    cell.textLabel.text=@"2133";
//            cell.backgroundColor=[UIColor redColor];
            
            return cell;
            
        }else if (self.selectIndex==20)
        {
            //        ZPUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"zp" forIndexPath:indexPath];
            //        cell.backgroundColor=[UIColor blueColor];
            //        return cell;
            static NSString *cellname=@"zp";
            ZPUITableViewCell *cell=(ZPUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[ZPUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
//            cell.backgroundColor=[UIColor blueColor];
            
            return cell;
            
        }else
        {
            //        FSUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"fs" forIndexPath:indexPath];
            //        cell.backgroundColor=[UIColor orangeColor];
            //        return cell;
            static NSString *cellname=@"fs";
            FSUITableViewCell *cell=(FSUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[FSUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
//            cell.textLabel.text=@"213";
//            cell.backgroundColor=[UIColor orangeColor];
            
            return cell;
        }
    }
//下面不起作用(x)  x
    else if (tableView.tag==20)
    {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor=[UIColor redColor];
    cell.textLabel.text=@"12313";
    return cell;
    }else
    {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor=[UIColor redColor];
    cell.textLabel.text=@"133333";
    return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(tableView.tag==10)
//    {
//    return 500;
//    }else if (tableView.tag==20)
//    {
//        return 50;
//    }else
//    {
//        return 50;
//    }
    if(self.selectIndex==0)
    {
        return 1500;
    }else if(self.selectIndex==10)
    {
     return 1500;
    }else if(self.selectIndex==20)
    {
        return 1800/2.5;
    }else
    {
        return 1400;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if(tableView.tag==10)
//    {
//        return 40;
//    }else if (tableView.tag==20)
//    {
//        return 1;
//    }else
//    {
//        return 1;
//    }
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    if(tableView.tag==10)
//    {
//    UIButton *btnxi=[[UIButton alloc]initWithFrame:CGRectMake(30,10,[UIScreen mainScreen].bounds.size.width/3.0-30, 20)];
//    [btnxi setTitle:@"最新动态" forState:UIControlStateNormal];
//    btnxi.tag=10;
//    [btnxi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
//    [btnxi setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
//    [btnxi addTarget:self action:@selector(zx:) forControlEvents:UIControlEventTouchUpInside];
//    UIButton *btnzp=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-40,10,80, 20)];
//    [btnzp setTitle:@"作品集" forState:UIControlStateNormal];
//    [btnzp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
//    [btnzp setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
//    btnzp.tag=20;
//    [btnzp addTarget:self action:@selector(zp:) forControlEvents:UIControlEventTouchUpInside];
//    UIButton *btnfs=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-110,10,80, 20)];
//    [btnfs setTitle:@"粉丝区" forState:UIControlStateNormal];
//    [btnfs addTarget:self action:@selector(fs:) forControlEvents:UIControlEventTouchUpInside];
//    [btnfs setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
//    [btnfs setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
//    btnfs.tag=30;
//    UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,40)];
//    [vi addSubview:btnxi];
//    [vi addSubview:btnzp];
//    [vi addSubview:btnfs];
//    return vi;
//    }else if (tableView.tag==20)
//    {
//        return nil;
//    }else
//    {
//        return nil;
//    }
        UIButton *btnxi=[[UIButton alloc]initWithFrame:CGRectMake(30,10,[UIScreen mainScreen].bounds.size.width/3.0-30, 20)];
        [btnxi setTitle:@"最新动态" forState:UIControlStateNormal];
        btnxi.tag=10;
        [btnxi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        [btnxi setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
        [btnxi addTarget:self action:@selector(zx:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *btnzp=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-40,10,80, 20)];
        [btnzp setTitle:@"作品集" forState:UIControlStateNormal];
        [btnzp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        [btnzp setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
        btnzp.tag=20;
        [btnzp addTarget:self action:@selector(zp:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *btnfs=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-110,10,80, 20)];
        [btnfs setTitle:@"粉丝区" forState:UIControlStateNormal];
        [btnfs addTarget:self action:@selector(fs:) forControlEvents:UIControlEventTouchUpInside];
        [btnfs setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        [btnfs setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
        btnfs.tag=30;
        UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,40)];
        [vi addSubview:btnxi];
        [vi addSubview:btnzp];
        [vi addSubview:btnfs];
        return vi;
}
-(void)zx:(UIButton *)btn
{
    self.selectIndex=btn.tag;
    [self.myTabStarView reloadData];
}
-(void)zp:(UIButton *)btn
{
    self.selectIndex=btn.tag;
     [self.myTabStarView reloadData];
}
-(void)fs:(UIButton *)btn
{
    self.selectIndex=btn.tag;
     [self.myTabStarView reloadData];
}

@end
