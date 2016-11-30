//
//  ParticularViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "ParticularViewController.h"
#import "UIImageView+WebCache.h"
#import "NetRequestClass+Recommend.h"


@interface ParticularViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)NSMutableArray *mutableArry;
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property(nonatomic,strong)UIView *searchView;
@property(nonatomic,strong)UIButton *goBackButton, *searchButton;
@property(nonatomic,strong)NSMutableArray *ltArray;
@end

@implementation ParticularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self searchView];
    [self searchBar];
    [self searchButton];
    [self goBackButton];
    [self initView];
}
#pragma mark - initView
-(void)initView{
    self.searchView.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 54);
    self.searchView.backgroundColor =[UIColor darkGrayColor];
    //;
    self.searchBar.frame = CGRectMake(60, 10,[UIScreen mainScreen].bounds.size.width/2.0+40, 40);
    self.searchBar.placeholder = @"请输入剧名";
    self.searchBar.barTintColor=[UIColor darkGrayColor];
    self.goBackButton.frame = CGRectMake(10, 20, 40, 20);
    [self.goBackButton setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
    [self.goBackButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
    self.searchButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-50, 20,50, 20);
    [self.searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    self.searchButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
//    self.searchView.frame = CGRectMake(0, 0, 320, 54);
//   self.searchView.backgroundColor =[UIColor darkGrayColor];
////;
//    self.searchBar.frame = CGRectMake(60, 10, 200, 40);
//   self.searchBar.placeholder = @"请输入剧名";
//    self.searchBar.barTintColor=[UIColor darkGrayColor];
//    self.goBackButton.frame = CGRectMake(10, 20, 40, 20);
//    [self.goBackButton setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
//    [self.goBackButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
//    self.searchButton.frame = CGRectMake(270, 20, 40, 20);
//    [self.searchButton setTitle:@"搜索" forState:UIControlStateNormal];
//     self.searchButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
//    [self.searchView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self.view);
//        make.width.equalTo(self.view.width);
//        make.height.equalTo(64);
//    }];
//    [self.goBackButton makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.searchView.left).offset(10);
//        make.height.equalTo(20);
//        make.width.equalTo(40);
//        make.top.equalTo(self.searchView.top).offset(20);
//    }];
//    [self.searchButton makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.goBackButton);
//        make.right.equalTo(self.searchView.right).offset(10);
//        make.width.height.equalTo(self.goBackButton);
//    }];
//    [self.searchBar makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.goBackButton.right).offset(10);
//        make.height.equalTo(40);
//        make.right.equalTo(self.searchButton.left).offset(10);
//        
//    }];
    
}
#pragma mark - setters getters
-(UIView *)searchView{
    if (!_searchView) {
        _searchView = [[UIView alloc]init];
        [self.view addSubview:_searchView];
    }
    return _searchView;
}
-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        [self.searchView addSubview:_searchBar];
    }
    return _searchBar;
}
-(UIButton *)goBackButton{
    if (!_goBackButton) {
        _goBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.searchView addSubview:_goBackButton];
    }
    return _goBackButton;
}
-(UIButton *)searchButton{
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.searchView addSubview:_searchButton];
        
    }
    return _searchButton;
}
-(void)getModelData
{
    [NetRequestClass getSearchForRequestUrl:[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/search/s2?_ts=1480334229846&k=%@",self.searchBar.text] WithParameter:nil WithReturnValeuBlock:^(id returnValue1) {
        self.ltArray=returnValue1;
        self.tabView.delegate=self;
        self.tabView.dataSource=self;
        [self.tabView reloadData];
    }];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ltArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    UIImageView *im=(UIImageView *)[cell viewWithTag:100];
    [im sd_setImageWithURL:[NSURL URLWithString:[self.ltArray[indexPath.row] objectForKey:@"thumb"]] placeholderImage:nil];
    UILabel *la0=(UILabel *)[cell viewWithTag:400];
    if ([[self.ltArray[indexPath.row] objectForKey:@"isFinished"]boolValue]) {
        la0.text=[NSString stringWithFormat:@"%d集全",[[self.ltArray[indexPath.row] objectForKey:@"count"]intValue]];
        la0.font=[UIFont systemFontOfSize:10];
        la0.textColor=[UIColor greenColor];
    }else
    {
        la0.text=[NSString stringWithFormat:@"更新到第%d集",[[self.ltArray[indexPath.row]objectForKey:@"count"]intValue]];
        la0.font=[UIFont systemFontOfSize:10];
        la0.textColor=[UIColor greenColor];
    }
    UILabel *la1=(UILabel *)[cell viewWithTag:300];
    la1.text=[NSString stringWithFormat:@"%.1f",[[self.ltArray[indexPath.row] objectForKey:@"rank"]floatValue]/10];
    la1.font=[UIFont systemFontOfSize:10];
    UILabel *la2=(UILabel *)[cell viewWithTag:200];
    la1.textColor=[UIColor orangeColor];
    la2.text=[NSString stringWithFormat:@"%@",[self.ltArray[indexPath.row] objectForKey:@"name"]];
    la2.textAlignment=NSTextAlignmentCenter;
    la2.font=[UIFont systemFontOfSize:12];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"123");
}
#pragma mark -Private Methods
-(void)search{
    [self getModelData];
}
-(void)goToBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
