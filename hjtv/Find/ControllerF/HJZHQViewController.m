//
//  HJZHQViewController.m
//  hjtv
//
//  Created by mac on 16/11/27.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "HJZHQViewController.h"
#import "CommentViewController.h"
#import "PublishViewController.h"
@interface HJZHQViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *HJZHQTableView;
@property(nonatomic,strong)UIButton *editButton;
@property(nonatomic,strong)NSMutableArray *mutableArry;
@property(nonatomic,strong)UIImageView *topicImageView;
@property(nonatomic,strong)UILabel *topicLable,*topicNumberLable;
@end

@implementation HJZHQViewController
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.title = @"讨论区";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,80)];
    vi.backgroundColor=[UIColor redColor];
    self.HJZHQTableView.tableHeaderView=vi;
    [self setHeadViewImage];
    [self setHeadLable];
    [self topicImageView];
    [self topicLable];
    [self topicNumberLable];
    [self editButton];
    [self initView];
    
       
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - initView
-(void)initView{
    [self.editButton setImage:[UIImage imageNamed:@"bbs_topic_create_btn"] forState:UIControlStateNormal];
    [self.editButton addTarget:self action:@selector(goToEdit) forControlEvents:UIControlEventTouchUpInside];
    [self.editButton makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.view).offset(10);
//        make.bottom.equalTo(self.view.bottom).offset(30);
//        make.height.width.equalTo(30);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view.bottom).offset(-30);
        make.height.width.equalTo(50);
    }];
    self.topicImageView.image = [UIImage imageNamed:@"bbs_topic_icon"];
    [self.topicImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.frame.size.width/3);
        make.top.equalTo(self.HJZHQTableView.tableHeaderView.frame.size.height/2);
        make.height.width.equalTo(15);
    }];
    self.topicLable.text = @"话题数：";
    self.topicLable.font = [UIFont systemFontOfSize:10];
    [self.topicLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topicImageView);
        make.left.equalTo(self.topicImageView.right).offset(2);
        make.width.equalTo(40);
        make.height.equalTo(8);
    }];
    self.topicNumberLable.text = @"741";
    self.topicNumberLable.font = [UIFont systemFontOfSize:10];
    [self.topicNumberLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicLable);
        make.left.equalTo(self.topicLable.right).offset(2);
        make.width.equalTo(35);
        make.height.equalTo(8);
    }];

}
#pragma mark - setters getters
-(UIButton *)editButton{
    if (!_editButton) {
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_editButton];
    }
    return _editButton;
}
-(UIImageView *)topicImageView{
    if (!_topicImageView) {
        _topicImageView = [[UIImageView alloc]init];
        [self.HJZHQTableView.tableHeaderView addSubview:_topicImageView];
    }
    return _topicImageView;
}
-(UILabel *)topicLable{
    if (!_topicLable) {
        _topicLable = [[UILabel alloc]init];
        [self.HJZHQTableView.tableHeaderView addSubview:_topicLable];
    }
    return _topicLable;
}
-(UILabel *)topicNumberLable{
    if (!_topicNumberLable) {
        _topicNumberLable = [[UILabel alloc]init];
        [self.HJZHQTableView.tableHeaderView addSubview:_topicNumberLable];
    }
    return _topicNumberLable;
}
#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return self.mutableArry.count;
    return 10;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"CommentViewController" bundle:nil];
    CommentViewController *commentVC = [sb instantiateViewControllerWithIdentifier:@"CommentViewController"];
    [self.navigationController pushViewController:commentVC animated:YES];
}

#pragma mark - Private Methods
-(void)goToEdit{
    PublishViewController *publishVC = [PublishViewController new];
    [self.navigationController pushViewController:publishVC animated:NO];
}
-(void)setHeadViewImage{
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    image.image = [UIImage imageNamed:@"tv_live"];
    [self.HJZHQTableView.tableHeaderView addSubview:image];
}
-(void)setHeadLable{
    UILabel *headLable = [[UILabel alloc]init];
    [self.HJZHQTableView.tableHeaderView addSubview:headLable];
    headLable.text = @"韩剧综合区";
    headLable.frame = CGRectMake(self.view.frame.size.width/3, 10, self.view.bounds.size.width/3, 20);
    headLable.font = [UIFont systemFontOfSize:18];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
