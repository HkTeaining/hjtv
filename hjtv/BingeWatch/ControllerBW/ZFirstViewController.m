//
//  ZFirstViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "ZFirstViewController.h"
#import "ZjTableViewCell.h"

@interface ZFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tab;

@end
int flagTab=0;
@implementation ZFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tab registerNib:[UINib nibWithNibName:@"ZjTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
  if(flagTab==0)
  {
      NSLog(@"没有任何东西");
  }else
  {
      //注意滑动冲突尺寸修改(x)  约束cell适用大多场景(x)(x)  非约束cell适用大多场景(x)(x)   x   x   x
      self.tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
      self.tab.delegate=self;
      self.tab.dataSource=self;
      [self.view addSubview:self.tab];
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
//    ZjTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
//    return cell;
    static NSString *CellTableIdentifer1 = @"CellTableIdentifer1";
    static BOOL nibsRegistered = NO;
    if(!nibsRegistered)
    {
        UINib *nib = [UINib nibWithNibName:@"ZjTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifer1];
        nibsRegistered = YES;
    }
    ZjTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifer1];
    return cell;

}
@end
