//
//  VarietyViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "VarietyViewController.h"

@interface VarietyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *mutableArry;
@property (weak, nonatomic) IBOutlet UITableView *varietyTableView;


@end

@implementation VarietyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"综艺";
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    
    [self varietyTableView];
    [self initView];
}
#pragma mark - initView
-(void)initView{
    self.mutableArry = nil;
    
    
    
    
}
#pragma mark  - Private Methods
-(void)search{
    
}
-(void)addobjectToMutableArry{  
    
}
#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mutableArry.count/3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    return cell;
    
}

#pragma mark -UITableViewDelegate


#pragma mark - setters getters

-(NSMutableArray *)mutableArry{
    if (!_mutableArry) {
        _mutableArry = [NSMutableArray array];
    }
    return _mutableArry;
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
