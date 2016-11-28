//
//  ParticularViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "ParticularViewController.h"

@interface ParticularViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)NSMutableArray *mutableArry;
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property(nonatomic,strong)UIView *searchView;
@property(nonatomic,strong)UIButton *goBackButton, *searchButton;
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
    self.searchView.frame = CGRectMake(0, 0, 320, 54);
    self.searchView.backgroundColor =[UIColor darkGrayColor];
;
    self.searchBar.frame = CGRectMake(60, 10, 200, 40);
    self.searchBar.placeholder = @"请输入剧名";
    self.searchBar.barTintColor=[UIColor darkGrayColor];
    self.goBackButton.frame = CGRectMake(10, 20, 40, 20);
    [self.goBackButton setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
    [self.goBackButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
    self.searchButton.frame = CGRectMake(270, 20, 40, 20);
    [self.searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    self.searchButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark -Private Methods
-(void)search{
    
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
