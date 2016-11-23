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
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)varietyButton:(UIButton *)sender {
    VarietyViewController *vareityVC = [VarietyViewController new];
    [self.navigationController pushViewController:vareityVC animated:YES];
}

- (IBAction)movieButton:(UIButton *)sender {
    MovieViewController *movieVC = [MovieViewController new];
    [self.navigationController pushViewController:movieVC animated:YES];
    
}

- (IBAction)forumButton:(UIButton *)sender {
    ForumViewController *forumVC = [ForumViewController new];
    [self.navigationController pushViewController:forumVC animated:YES];
}
@end
