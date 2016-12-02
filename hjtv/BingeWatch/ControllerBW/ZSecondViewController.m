//
//  ZSecondViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "ZSecondViewController.h"
#import "HcTableViewCell.h"

@interface ZSecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tabHc;
@end

@implementation ZSecondViewController
int flaghc=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabHc registerNib:[UINib nibWithNibName:@"HcTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIk"];
    if(flaghc==0)
    {
        NSLog(@"没有任何东西");
    }else
    {
        self.tabHc=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        self.tabHc.delegate=self;
        self.tabHc.dataSource=self;
        [self.view addSubview:self.tabHc];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text=@"大海的天空在传说";
//    return cell;
//    HcTableViewCell *cell=[tableView  dequeueReusableCellWithIdentifier:@"cellIk"];
//    return cell;
    static NSString *CellTableIdentifer = @"CellTableIdentifer";
    static BOOL nibsRegistered = NO;
    if(!nibsRegistered)
    {
        UINib *nib = [UINib nibWithNibName:@"HcTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifer];
        nibsRegistered = YES;
    }
   HcTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifer];
    return cell;
    
}
@end
