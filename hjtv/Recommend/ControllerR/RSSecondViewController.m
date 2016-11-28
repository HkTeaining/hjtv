//
//  RSSecondViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RSSecondViewController.h"
#import "NetRequestClass+Recommend.h"
#import "HjInfoSeries.h"


@interface RSSecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTab;
@property(nonatomic,strong)NSMutableArray *seriesArray;
@end

@implementation RSSecondViewController
//1 1 x x 
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myTab registerNib:[UINib nibWithNibName:@"XqTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellR"];
//      [self getModelData];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//     [self setBtn];
//////}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}
-(void)getModelData
{
    [NetRequestClass getHjVideoInfoForRequestUrl:[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/series/detailV3?&sid=%@",[self.recivceThreeArray[self.selectThreeRow] objectForKey:@"sid"]] WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
        self.seriesArray=returnValue2;
         HjInfoSeries *ins=(HjInfoSeries *)self.seriesArray[0];
        UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 330)];
        UIScrollView *sc=[web.subviews objectAtIndex:0];
        if (sc) {
            sc.bounces=NO;
            sc.alwaysBounceVertical=NO;
            sc.alwaysBounceHorizontal=NO;
            sc.showsVerticalScrollIndicator=NO;
            sc.showsHorizontalScrollIndicator=NO;
        }
        [web loadHTMLString:ins.intro baseURL:nil];
        self.myTab.tableHeaderView=web;
        self.myTab.delegate=self;
        self.myTab.dataSource=self;
    }];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    UIView *leftlineView=[[UIView alloc]initWithFrame:CGRectMake(0, 15, 140, 2)];
    leftlineView.backgroundColor=[UIColor grayColor];
    UIView *rightlineView=[[UIView alloc]initWithFrame:CGRectMake(175, 15, 140, 2)];
    rightlineView.backgroundColor=[UIColor grayColor];
    UILabel *la=[[UILabel alloc]initWithFrame:CGRectMake(140, 0, 40, 30)];
    la.text=@"短评";
    [headView addSubview:leftlineView];
    [headView addSubview:rightlineView];
    [headView addSubview:la];
    headView.backgroundColor=[UIColor whiteColor];
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 43;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.imageView.image=nil;
        cell.detailTextLabel.text=@"这部电影拍得很好";
        cell.textLabel.text=@"小明";
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self getModelData];
    return 1;
}
@end
