//
//  MovieViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@property (nonatomic,strong)NSMutableArray *mutableArry;
@property (nonatomic,strong)UIScrollView *movieScrollView;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"电影";
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    
}
#pragma mark - initView
-(void)initView{
    self.mutableArry = nil;
    self.movieScrollView.frame = CGRectMake(0, 44, 320, 10000);
    self.movieScrollView.contentOffset = CGPointMake(0, 436);
   
}

#pragma mark - setters getters

-(NSMutableArray *)mutableArry{
    if (!_mutableArry) {
        _mutableArry = [NSMutableArray array];
        
    }
    return _mutableArry;
}
-(UIScrollView *)movieScrollView{
    if (!_movieScrollView) {
        _movieScrollView = [[UIScrollView alloc]init];
        [self.view addSubview:_movieScrollView];
    }
    return _movieScrollView;
}
#pragma mark - Private Methods
-(void)search{
    
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

@end
