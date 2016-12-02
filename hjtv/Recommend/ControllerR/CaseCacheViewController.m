//
//  CaseCacheViewController.m
//  hjtv
//
//  Created by mac on 16/11/30.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "CaseCacheViewController.h"
#import "CacheViewController.h"
#import "ListTableViewCell.h"

@interface CaseCacheViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TabView;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property(nonatomic,strong)UIView *selView;

@end

@implementation CaseCacheViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
int Atcount=0;
- (IBAction)change:(id)sender {
    if(Atcount==0){
    [self.TabView setEditing:YES animated:YES];
        [self.rightBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.selView.frame=CGRectMake(0,[UIScreen mainScreen].bounds.size.height-64-25+55+30-45,[UIScreen mainScreen].bounds.size.width, 50);
    Atcount=1;
    }
    else
    {
    [self.TabView setEditing:NO animated:YES];
    [self.rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    self.selView.frame=CGRectMake(0,[UIScreen mainScreen].bounds.size.height-64-25+55+30,[UIScreen mainScreen].bounds.size.width, 50);
    Atcount=0;
    for(int i=0;i<self.indexCount;i++)
    {
    NSIndexPath *path=[NSIndexPath indexPathForRow:i inSection:0];
    UITableViewCell *cell=(UITableViewCell *)[self.TabView cellForRowAtIndexPath:path];
    cell.selected=NO;
    [self.aArrar addObject:path];
    }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)setSlView
{
    self.selView=[[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-64-25+55+30,[UIScreen mainScreen].bounds.size.width, 50)];
    self.selView.backgroundColor=[UIColor darkGrayColor];
    UIButton *btnAll=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width/2.0-20, 50)];
    [btnAll setTitle:@"全选" forState:UIControlStateNormal];
    [btnAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnAll setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btnAll addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btnSc=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0+20, 0,[UIScreen mainScreen].bounds.size.width/2.0-20, 50)];
    [btnSc setTitle:@"删除" forState:UIControlStateNormal];
    [btnSc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnSc setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btnSc addTarget:self action:@selector(schu:) forControlEvents:UIControlEventTouchUpInside];
    [self.selView addSubview:btnAll];
    [self.selView addSubview:btnSc];
    [self.view addSubview:self.selView];
}
-(void)select:(id)sender
{
    for(int i=0;i<self.indexCount;i++)
    {
        NSIndexPath *path=[NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell=(UITableViewCell *)[self.TabView cellForRowAtIndexPath:path];
        cell.selected=YES;
        [self.aArrar addObject:path];
    }
    NSLog(@"23");
}
-(void)schu:(id)sender
{    
[self.TabView deleteRowsAtIndexPaths:self.aArrar withRowAnimation:UITableViewRowAnimationMiddle];
    NSLog(@"123");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSlView];
    [self.TabView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.indexCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    UILabel *la=(UILabel *)[cell viewWithTag:100];
    la.text=[NSString stringWithFormat:@"第%ld集",(long)indexPath.row+1];
    return cell;
}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s---%ld",__func__,indexPath.row);
    [self.aArrar addObject:indexPath];
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s---%ld",__func__,indexPath.row);
    [self.aArrar removeObject:indexPath];
}
@end
