//
//  VarietyViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "VarietyViewController.h"
#import "NetRequestClass+Recommend.h"
#import "RDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "RCollectionViewCell.h"
#import "SearchTwoViewController.h"

@interface VarietyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSMutableArray *mutableArry;
@property (weak, nonatomic) IBOutlet UITableView *varietyTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionOne;
@property(nonatomic,strong)NSMutableArray *dataArrayTwo;
@end

@implementation VarietyViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"综艺";
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    [self addHeader];
    [self addFooter];
    [self setColLayout];
    [self getModelData];
}
-(void)search{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SearchTwoViewController" bundle:nil];
    SearchTwoViewController *searchTwoVC = [sb instantiateViewControllerWithIdentifier:@"SearchTwoViewController"];
    [self presentViewController:searchTwoVC animated:YES completion:nil];
}
-(void)setColLayout
{
//    [self.myCollectionOne registerNib:[UINib nibWithNibName:@"RCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"cellId"];
//    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
//    flowLayout.itemSize=CGSizeMake(90, 130);
//    flowLayout.minimumLineSpacing=15;
//    flowLayout.minimumInteritemSpacing=10;
//    flowLayout.sectionInset=UIEdgeInsetsMake(12,12, 0, 12);
//    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
//    self.myCollectionOne.collectionViewLayout=flowLayout;
//    self.myCollectionOne.backgroundColor=[UIColor whiteColor];
        [self.myCollectionOne registerNib:[UINib nibWithNibName:@"RCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"cellId"];
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake(([UIScreen mainScreen].bounds.size.width-40)/3.0, 130);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        self.myCollectionOne.collectionViewLayout=flowLayout;
        self.myCollectionOne.backgroundColor=[UIColor whiteColor];

}
-(void)getModelData
{
    [NetRequestClass getHjVideoListForRequestUrl:firstUrl  WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        self.dataArrayTwo=returnValue;
        self.myCollectionOne.delegate=self;
        self.myCollectionOne.dataSource=self;
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArrayTwo.count;
    
}
int selectRow2;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    RCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    UIImageView *im=(UIImageView *)[cell viewWithTag:100];
    [im sd_setImageWithURL:[NSURL URLWithString:[self.dataArrayTwo[indexPath.row] objectForKey:@"thumb"]] placeholderImage:nil];
        UILabel *la1=(UILabel *)[cell viewWithTag:300];
    la1.text=[NSString stringWithFormat:@"%.1f",[[self.dataArrayTwo[indexPath.row] objectForKey:@"rank"]floatValue]/10];
    la1.font=[UIFont systemFontOfSize:8];
    UILabel *la2=(UILabel *)[cell viewWithTag:400];
    la1.textColor=[UIColor orangeColor];
    la2.text=[NSString stringWithFormat:@"%@",[self.dataArrayTwo[indexPath.row] objectForKey:@"name"]];
    la2.textAlignment=NSTextAlignmentCenter;
    la2.font=[UIFont systemFontOfSize:12];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectRow2=indexPath.row;
    RDetailViewController *rdetail=[[RDetailViewController alloc]init];
    rdetail.recivceArray=self.dataArrayTwo;
    rdetail.selectRow=selectRow2;
    [self.navigationController pushViewController:rdetail animated:YES];
}
- (void)addHeader
{
    __unsafe_unretained typeof(self) vc = self;
    [self.myCollectionOne addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc.myCollectionOne reloadData];
            [vc.myCollectionOne headerEndRefreshing];
        });
    }];
}
int rowCountFour=60;
- (void)addFooter
{
    __unsafe_unretained typeof(self) vc = self;
    [self.myCollectionOne addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            rowCountFour=rowCountFour+30;
            NSString *url=[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/series/indexV2?_ts=1479963005307&count=%d&offset=0",rowCountFour];
            [NetRequestClass getHjVideoListForRequestUrl:url  WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
                vc.dataArrayTwo=returnValue;
                [vc.myCollectionOne reloadData];
                [vc.myCollectionOne headerEndRefreshing];
            }];
        });
    }];
}


-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
//
//#pragma mark - initView
//-(void)initView{
//    self.mutableArry =nil;
//    
//    
//    
//    
//}
//#pragma mark  - Private Methods
//-(void)search{
//    
//}
//-(void)addobjectToMutableArry{  
//    
//}
//#pragma mark -UITableViewDataSource
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.mutableArry.count/3;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
//    return cell;
//    
//}
//
//#pragma mark -UITableViewDelegate
//
//
//#pragma mark - setters getters
//
//-(NSMutableArray *)mutableArry{
//    if (!_mutableArry) {
//        _mutableArry = [NSMutableArray array];
//    }
//    return _mutableArry;
//}
//
//-(void)back:(UIButton *)btn
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
