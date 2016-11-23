//
//  RFirstViewController.m
//  hjtv
//
//  Created by mac on 16/11/22.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RFirstViewController.h"
#import "RCollectionViewCell.h"
#import "RDetailViewController.h"

@interface RFirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollec;

@end

@implementation RFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myCollec registerNib:[UINib nibWithNibName:@"RCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"cellId"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(90, 130);
    flowLayout.minimumLineSpacing=15;
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.sectionInset=UIEdgeInsetsMake(12,12, 0, 12);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    self.myCollec.collectionViewLayout=flowLayout;
    self.myCollec.backgroundColor=[UIColor whiteColor];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 56;
    
}
//1(x) 1(x) 1/1/(x) 1/1/(x) x x x x
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    RCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    UIImageView *im=(UIImageView *)[cell viewWithTag:100];
    im.image=[UIImage imageNamed:@"share_select_sms"];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [im addGestureRecognizer:singleTap];
    im.userInteractionEnabled=YES;
    UILabel *la0=(UILabel *)[cell viewWithTag:200];
    la0.text=[NSString stringWithFormat:@"更新到第%d集",indexPath.row];
    la0.font=[UIFont systemFontOfSize:10];
    la0.textColor=[UIColor greenColor];
    UILabel *la1=(UILabel *)[cell viewWithTag:300];
    la1.text=@"7.4";
    la1.font=[UIFont systemFontOfSize:10];
    UILabel *la2=(UILabel *)[cell viewWithTag:400];
    la1.textColor=[UIColor orangeColor];
    la2.text=@"蓝天大海的传说";
    la2.textAlignment=NSTextAlignmentCenter;
    la2.font=[UIFont systemFontOfSize:12];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}
- (void)singleTap:(UITapGestureRecognizer *)tap {
    RDetailViewController *rdetail=[[RDetailViewController alloc]init];
    [self.navigationController pushViewController:rdetail animated:YES];
}
@end
