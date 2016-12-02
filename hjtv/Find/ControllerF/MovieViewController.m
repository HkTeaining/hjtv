//
//  MovieViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "MovieViewController.h"
#import "NetRequestClass+Recommend.h"
#import "RDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "RCollectionViewCell.h"
#import "SearchTwoViewController.h"

@interface MovieViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;
//@property (nonatomic,strong)NSMutableArray *mutableArry;
@property (nonatomic,strong)UIScrollView *movieScrollView;
@property(nonatomic,strong)NSMutableArray *dataArrayOne;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"电影";
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    [self addHeader];
    [self addFooter];
    [self setColLayout];
    [self getModelData];
}
#pragma mark - initView
//-(void)initView{
//    self.mutableArry = nil;
//    self.movieScrollView.frame = CGRectMake(0, 44, 320, 10000);
//    self.movieScrollView.contentOffset = CGPointMake(0, 436);
//   
//}

#pragma mark - setters getters
//
//-(NSMutableArray *)mutableArry{
//    if (!_mutableArry) {
//        _mutableArry = [NSMutableArray array];
//        
//    }
//    return _mutableArry;
//}
//-(UIScrollView *)movieScrollView{
//    if (!_movieScrollView) {
//        _movieScrollView = [[UIScrollView alloc]init];
//        [self.view addSubview:_movieScrollView];
//    }
//    return _movieScrollView;
//}
//#pragma mark - Private Methods
-(void)search{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SearchTwoViewController" bundle:nil];
    SearchTwoViewController *searchTwoVC = [sb instantiateViewControllerWithIdentifier:@"SearchTwoViewController"];
    [self presentViewController:searchTwoVC animated:YES completion:nil];
}
//#pragma mark -UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 50;
//    
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
//    return cell;
//}
-(void)setColLayout
{
//    [self.myCollection registerNib:[UINib nibWithNibName:@"RCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"cellId"];
//    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
//    flowLayout.itemSize=CGSizeMake(90, 130);
//    flowLayout.minimumLineSpacing=15;
//    flowLayout.minimumInteritemSpacing=10;
//    flowLayout.sectionInset=UIEdgeInsetsMake(12,12, 0, 12);
//    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
//    self.myCollection.collectionViewLayout=flowLayout;
//    self.myCollection.backgroundColor=[UIColor whiteColor];
    [self.myCollection registerNib:[UINib nibWithNibName:@"RCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"cellId"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(([UIScreen mainScreen].bounds.size.width-40)/3.0, 130);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    self.myCollection.collectionViewLayout=flowLayout;
    self.myCollection.backgroundColor=[UIColor whiteColor];
}
-(void)getModelData
{
    [NetRequestClass getHjVideoListForRequestUrl:firstUrl  WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        self.dataArrayOne=returnValue;
        self.myCollection.delegate=self;
        self.myCollection.dataSource=self;
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArrayOne.count;
    
}
//1(x) 1(x) 1/1/(x) 1/1/(x) x x x x
int selectRow1;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    RCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    UIImageView *im=(UIImageView *)[cell viewWithTag:100];
    [im sd_setImageWithURL:[NSURL URLWithString:[self.dataArrayOne[indexPath.row] objectForKey:@"thumb"]] placeholderImage:nil];
    //    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    //    [im addGestureRecognizer:singleTap];
    //    im.userInteractionEnabled=YES;
//    UILabel *la0=(UILabel *)[cell viewWithTag:200];
//    if ([[self.dataArrayOne[indexPath.row] objectForKey:@"isFinished"]boolValue]) {
//        la0.text=[NSString stringWithFormat:@"%d集全",[[self.dataArrayOne[indexPath.row] objectForKey:@"count"]intValue]];
//        la0.font=[UIFont systemFontOfSize:8];
//        la0.textColor=[UIColor greenColor];
//    }else
//    {
//        la0.text=[NSString stringWithFormat:@"更新到第%d集",[[self.dataArrayOne[indexPath.row]objectForKey:@"count"]intValue]];
//        la0.font=[UIFont systemFontOfSize:8];
//        la0.textColor=[UIColor greenColor];
//    }
    UILabel *la1=(UILabel *)[cell viewWithTag:300];
    la1.text=[NSString stringWithFormat:@"%.1f",[[self.dataArrayOne[indexPath.row] objectForKey:@"rank"]floatValue]/10];
    la1.font=[UIFont systemFontOfSize:8];
    UILabel *la2=(UILabel *)[cell viewWithTag:400];
    la1.textColor=[UIColor orangeColor];
    la2.text=[NSString stringWithFormat:@"%@",[self.dataArrayOne[indexPath.row] objectForKey:@"name"]];
    la2.textAlignment=NSTextAlignmentCenter;
    la2.font=[UIFont systemFontOfSize:12];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectRow1=[NSNumber numberWithInteger:indexPath.row].intValue;
    RDetailViewController *rdetail=[[RDetailViewController alloc]init];
    rdetail.recivceArray=self.dataArrayOne;
    rdetail.selectRow=selectRow1;
    [self.navigationController pushViewController:rdetail animated:YES];
}
//- (void)singleTap:(UITapGestureRecognizer *)tap {
//
//}
- (void)addHeader
{
    __unsafe_unretained typeof(self) vc = self;
    [self.myCollection addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc.myCollection reloadData];
            [vc.myCollection headerEndRefreshing];
        });
    }];
}
int rowCountThree=60;
- (void)addFooter
{
    __unsafe_unretained typeof(self) vc = self;
    [self.myCollection addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            rowCountThree=rowCountThree+30;
            NSString *url=[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/series/indexV2?_ts=1479963005307&count=%d&offset=0",rowCountThree];
            [NetRequestClass getHjVideoListForRequestUrl:url  WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
                vc.dataArrayOne=returnValue;
                [vc.myCollection reloadData];
                [vc.myCollection headerEndRefreshing];
            }];
        });
    }];
}


-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
