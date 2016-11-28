//
//  StarDetailViewController.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "StarDetailViewController.h"
#import "HeadViewController.h"

@interface StarDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTabStarView;

@end

@implementation StarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.title=@"李宗硕";
//    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:234 green:212 blue:185 alpha:1];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    HeadViewController *head=[[HeadViewController alloc]init];
    head.view.frame=CGRectMake(0, 0, 320, 130);
    [self addChildViewController:head];
    self.myTabStarView.tableHeaderView=head.view;
//        NSArray *ay=[[NSBundle mainBundle]loadNibNamed:@"HeadViewController" owner:self options:nil];
//        UIView *vi=ay[0];
//        self.myTabStarView.tableHeaderView=vi;
//        vi.frame=CGRectMake(0, 0, 320, 130);
//        NSLog(@"%@",vi);
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor=[UIColor redColor];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btnxi=[[UIButton alloc]initWithFrame:CGRectMake(30,10,80, 20)];
    [btnxi setTitle:@"最新动态" forState:UIControlStateNormal];
    [btnxi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [btnxi setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
    [btnxi addTarget:self action:@selector(zx:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btnzp=[[UIButton alloc]initWithFrame:CGRectMake(120,10,80, 20)];
    [btnzp setTitle:@"作品集" forState:UIControlStateNormal];
    [btnzp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [btnzp setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
    [btnzp addTarget:self action:@selector(zp:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btnfs=[[UIButton alloc]initWithFrame:CGRectMake(210,10,80, 20)];
    [btnfs setTitle:@"粉丝区" forState:UIControlStateNormal];
    [btnfs addTarget:self action:@selector(fs:) forControlEvents:UIControlEventTouchUpInside];
    [btnfs setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [btnfs setTitleColor:[UIColor redColor] forState: UIControlStateSelected ];
    UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    [vi addSubview:btnxi];
    [vi addSubview:btnzp];
    [vi addSubview:btnfs];
    return vi;
}
-(void)zx:(UIButton *)btn
{
    
}
-(void)zp:(UIButton *)btn
{
    
}
-(void)fs:(UIButton *)btn
{
    
}

@end
