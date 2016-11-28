//
//  SearchViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "SearchViewController.h"
#import "VarietyViewController.h"
#import "MovieViewController.h"
#import "ForumViewController.h"
#import "SearchTwoViewController.h"
#import "ForumTableViewController.h"
@interface SearchViewController ()<UISearchBarDelegate>
@property(nonatomic,strong)UIButton *varietyButton,*movieButton,*forumButton;
@property(nonatomic,strong)UISearchBar *search;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.search=[[UISearchBar alloc]initWithFrame:CGRectMake(20,0,280,40)];
    self.search.placeholder = @"请输入剧名";
    self.navigationItem.titleView=self.search;
    self.search.delegate = self;
    [self varietyButton];
    [self movieButton];
    [self forumButton];
    [self initView];
    
    
}
#pragma mark - initView
-(void)initView{
    self.varietyButton.frame = CGRectMake(20, 80, 80, 80);
    [self.varietyButton setImage:[UIImage imageNamed:@"zy"] forState:UIControlStateNormal];
    [self.varietyButton addTarget:self action:@selector(goToVariety) forControlEvents:UIControlEventTouchUpInside];
    self.movieButton.frame = CGRectMake(120, 80, 80, 80);
    [self.movieButton setImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
    [self.movieButton addTarget:self action:@selector(goToMovie) forControlEvents:UIControlEventTouchUpInside];
    self.forumButton.frame = CGRectMake(220, 80, 80, 80);
    [self.forumButton setImage:[UIImage imageNamed:@"forum"] forState:UIControlStateNormal];
    [self.forumButton addTarget:self action:@selector(goToForum) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - setters getters
-(UIButton *)varietyButton{
    if (!_varietyButton) {
        _varietyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_varietyButton];
    }
    return _varietyButton;
}

-(UIButton *)movieButton{
    if (!_movieButton) {
        _movieButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_movieButton];
    }
    return _movieButton;
}
-(UIButton *)forumButton{
    if (!_forumButton) {
        _forumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_forumButton];
    }
    return _forumButton;
}
#pragma mark - Private Methods
-(void)goToVariety{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"VarietyViewController" bundle:nil];
    VarietyViewController *vareityVC =[sb instantiateViewControllerWithIdentifier:@"VarietyView"];
    [self.navigationController pushViewController:vareityVC animated:YES];
}

- (void)goToMovie {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MovieViewController" bundle:nil];
    MovieViewController *movieVC = [sb instantiateViewControllerWithIdentifier:@"movie"];
    [self.navigationController pushViewController:movieVC animated:YES];
    
}

- (void)goToForum {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ForumViewController" bundle:nil];
    ForumTableViewController *forumVC = [sb instantiateViewControllerWithIdentifier:@"forum"];
    [self.navigationController pushViewController:forumVC animated:YES];
}
-(void)goToSearch{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SearchTwoViewController" bundle:nil];
    SearchTwoViewController *searchTwoVC = [sb instantiateViewControllerWithIdentifier:@"SearchTwoViewController"];
    [self presentViewController:searchTwoVC animated:YES completion:nil];
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self goToSearch];
}




@end
