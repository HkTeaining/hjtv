//
//  StarDetailViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

//此其项目遇见bug即解决方法   x

#import "StarDetailViewController.h"
#import "HeadViewController.h"
#import "ZPUITableViewCell.h"
#import "ZXUITableViewCell.h"
#import "FSUITableViewCell.h"

@interface StarDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTabStarView;
@property(nonatomic,assign)NSInteger selectIndex;
@end

@implementation StarDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectIndex=0;
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title=@"李宗硕";
//    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    HeadViewController *head=[[HeadViewController alloc]init];
//    head.view.frame=CGRectMake(0, 0, 320, 300);
    [self addChildViewController:head];
    self.myTabStarView.tableHeaderView=head.view;
//        NSArray *ay=[[NSBundle mainBundle]loadNibNamed:@"HeadViewController" owner:self options:nil];
//        UIView *vi=ay[0];
//        self.myTabStarView.tableHeaderView=vi;
//        vi.frame=CGRectMake(0, 0, 320, 130);
//        NSLog(@"%@",vi);
//    [self.myTabStarView registerNib:[UINib nibWithNibName:@"ZXUITableViewCell" bundle:nil] forCellReuseIdentifier:@"zx"];
//    [self.myTabStarView registerNib:[UINib nibWithNibName:@"ZPUITableViewCell" bundle:nil] forCellReuseIdentifier:@"zp"];
//    [self.myTabStarView registerNib:[UINib nibWithNibName:@"FSUITableViewCell" bundle:nil] forCellReuseIdentifier:@"fs"];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[[UICollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag==10)
    {
      return 1;
    }else if(tableView.tag==20)
    {
        return 10;
    }else
    {
        return 10;
    }
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
            static NSString *cellname=@"cellname";
            ZXUITableViewCell *cell=(ZXUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[ZXUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            //        cell.textLabel.text=@"213";
            return cell;
        }else if(self.selectIndex==10)
        {
            //        ZXUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"zx" forIndexPath:indexPath];
            //          cell.backgroundColor=[UIColor redColor];
            //        return cell;
            static NSString *cellname=@"cellname1";
            ZXUITableViewCell *cell=(ZXUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[ZXUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            //        cell.textLabel.text=@"213";
            cell.backgroundColor=[UIColor redColor];
            return cell;
            
        }else if (self.selectIndex==20)
        {
            //        ZPUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"zp" forIndexPath:indexPath];
            //        cell.backgroundColor=[UIColor blueColor];
            //        return cell;
            static NSString *cellname=@"cellname2";
            ZPUITableViewCell *cell=(ZPUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[ZPUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            //        cell.textLabel.text=@"213";
            cell.backgroundColor=[UIColor blueColor];
            return cell;
            
        }else
        {
            //        FSUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"fs" forIndexPath:indexPath];
            //        cell.backgroundColor=[UIColor orangeColor];
            //        return cell;
            static NSString *cellname=@"cellname3";
            FSUITableViewCell *cell=(FSUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
            if(cell==nil)
            {
                cell=[[FSUITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
            }
            cell.textLabel.text=@"213";
            cell.backgroundColor=[UIColor orangeColor];
            return cell;
        }
    }else if (tableView.tag==20)
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
    if(tableView.tag==10)
    {
    return 500;
    }else if (tableView.tag==20)
    {
        return 50;
    }else
    {
        return 50;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(tableView.tag==10)
    {
        return 40;
    }else if (tableView.tag==20)
    {
        return 1;
    }else
    {
        return 1;
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView.tag==10)
    {
    UIButton *btnxi=[[UIButton alloc]initWithFrame:CGRectMake(30,10,80, 20)];
    [btnxi setTitle:@"最新动态" forState:UIControlStateNormal];
    btnxi.tag=10;
    [btnxi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [btnxi setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
    [btnxi addTarget:self action:@selector(zx:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btnzp=[[UIButton alloc]initWithFrame:CGRectMake(120,10,80, 20)];
    [btnzp setTitle:@"作品集" forState:UIControlStateNormal];
    [btnzp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [btnzp setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
    btnzp.tag=20;
    [btnzp addTarget:self action:@selector(zp:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btnfs=[[UIButton alloc]initWithFrame:CGRectMake(210,10,80, 20)];
    [btnfs setTitle:@"粉丝区" forState:UIControlStateNormal];
    [btnfs addTarget:self action:@selector(fs:) forControlEvents:UIControlEventTouchUpInside];
    [btnfs setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [btnfs setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
    btnfs.tag=30;
    UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    [vi addSubview:btnxi];
    [vi addSubview:btnzp];
    [vi addSubview:btnfs];
    return vi;
    }else if (tableView.tag==20)
    {
        return nil;
    }else
    {
        return nil;
    }
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
