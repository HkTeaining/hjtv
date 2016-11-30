//
//  SearchTwoViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "SearchTwoViewController.h"
#import  "ParticularViewController.h"
@interface SearchTwoViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UISearchBar *search;
@property(nonatomic,copy)NSMutableArray *JuMingArry;
@property(nonatomic,strong)UIButton *clearButton;
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)UIButton *cancelButton;
@property(nonatomic,strong)UIView *searchView;
@end

@implementation SearchTwoViewController
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.cancelButton setTitle:@"搜索" forState:UIControlStateNormal];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
   [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width-55, 35)];
    self.search.placeholder = @"请输入剧名";
    self.search.delegate=self;
    self.search.barTintColor=[UIColor darkGrayColor];
    [self.searchView addSubview:self.search];
    self.tabView.delegate = self;
    [self JuMingArry];
    [self clearButton];
    [self searchView];
    [self initView];
    
}
#pragma mark - initView
-(void)initView{
    self.JuMingArry = nil;
    [self.clearButton setTitle:@"清除搜索记录" forState:UIControlStateNormal];
    [self.clearButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.clearButton addTarget:self action:@selector(clearHistory) forControlEvents:UIControlEventTouchDragInside];
    self.cancelButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-55+20 , 25, 35, 20);
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelButton.titleLabel.font=[UIFont systemFontOfSize:15];
    self.searchView.userInteractionEnabled = YES;
    [self.cancelButton addTarget:self action:@selector(goToBack:) forControlEvents:UIControlEventTouchUpInside];
    self.searchView.backgroundColor = [UIColor darkGrayColor];
    self.searchView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 55);
//  self.JuMingArry = nil;
//  [self.clearButton setTitle:@"清除搜索记录" forState:UIControlStateNormal];
//  [self.clearButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
// [self.clearButton addTarget:self action:@selector(clearHistory) forControlEvents:UIControlEventTouchDragInside];
//    self.cancelButton.frame = CGRectMake(280 , 30, 40, 20);
// [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//self.cancelButton.titleLabel.font=[UIFont systemFontOfSize:15];
//  self.searchView.userInteractionEnabled = YES;
// [self.cancelButton addTarget:self action:@selector(goToBack:) forControlEvents:UIControlEventTouchUpInside];
// self.searchView.backgroundColor = [UIColor darkGrayColor];
//    self.searchView.frame = CGRectMake(0, 0, 320, 55);
//    [self.searchView makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.left);
//        make.top.equalTo(self.view.top);
//        make.width.equalTo(self.view.width);
//        make.height.equalTo(64);
//    }];
//    [self.search makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.searchView.left).offset(10);
//        make.top.equalTo(self.searchView.top).offset(10);
//        make.bottom.equalTo(self.searchView.bottom).offset(10);
//        make.right.equalTo(self.searchView.right).offset(60);
//    }];
//    [self.cancelButton makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.search.right).offset(10);
//        make.right.equalTo(self.searchView.right).offset(10);
//        make.height.equalTo(20);
//    }];
}
#pragma mark - setters getters
-(NSArray *)JuMingArry{
    if (!_JuMingArry) {
        _JuMingArry = [NSMutableArray array];
    }
    return _JuMingArry;
}

-(UIButton *)clearButton{
    if (!_clearButton) {
        _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:self.clearButton];
    }
    return _clearButton;
}
-(UITableView *)tabView{
    if (!_tabView) {
        _tabView = [[UITableView alloc]init];
        [self.view addSubview:_tabView];
    }
    return _tabView;
}
-(UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.searchView addSubview:_cancelButton];
    }
    return _cancelButton;
}
-(UIView *)searchView{
    if (!_searchView) {
        _searchView = [[UIView alloc]init];
        [self.view addSubview:_searchView];
    }
    return _searchView;
}
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.JuMingArry.count==0) {
        return self.JuMingArry.count;
    }
    return self.JuMingArry.count+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.JuMingArry[indexPath.row];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ParticularViewController" bundle:nil];
    ParticularViewController *particularVC = [sb instantiateViewControllerWithIdentifier:@"ParticularViewController"];
    [self.navigationController pushViewController:particularVC animated:YES];
}

#pragma mark - Private Methods
-(void)goToBack:(UIButton *)sender{
    if([sender.titleLabel.text isEqualToString:@"取消"])
    {  [self dismissViewControllerAnimated:YES completion:nil];
    }else
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ParticularViewController" bundle:nil];
        ParticularViewController *particularVC = [sb instantiateViewControllerWithIdentifier:@"Particular"];
        [self presentViewController:particularVC animated:YES completion:nil];
    }
}
-(void)clearHistory{
    [self.tabView removeFromSuperview];
    self.JuMingArry = nil;
    
}

- (IBAction)buttonPress:(UIButton *)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ParticularViewController" bundle:nil];
    ParticularViewController *particularVC = [sb instantiateViewControllerWithIdentifier:@"Particular"];
//    particularVC.searchBar.text=sender.titleLabel.text;
    [self presentViewController:particularVC animated:YES completion:nil];
    [self.JuMingArry addObject:sender.titleLabel.text];
    [self tabView];
    [self.view addSubview:self.tabView];
    
    
}
@end
