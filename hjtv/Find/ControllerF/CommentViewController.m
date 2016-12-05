//
//  CommentViewController.m
//  hjtv
//
//  Created by mac on 16/11/30.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "CommentViewController.h"
NSString const *orderReportContent = @"确认该帖子内容涉及辱骂、广告、色情暴力、反动言论、垃圾信息等不良内容？";
@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)UITextField *editTextField;
@property(nonatomic,strong)UIButton *sendButton;
@property (strong, nonatomic) UIImageView *headPortraitImageView;
@property (strong, nonatomic)  UILabel *nicknameLable;
@property (strong, nonatomic)  UILabel *updateTimeLable;
@property(nonatomic,strong)UIButton *likeButton;
@property(nonatomic,strong)UILabel *likeLable;
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong) UIView *footVi;
@property(nonatomic,strong)UIView *editView;
@property(nonatomic,strong)UIButton *otherSendButton, *cancelSendButton;
@property(nonatomic,strong)UITextField * otherEditTextField;
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"韩剧综合区";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"举报" style:UIBarButtonItemStylePlain target:self action:@selector(report)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(goToBack)];
    UIView *headVi = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3*2)];
    headVi.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = headVi;
   self.footVi = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-40, [UIScreen mainScreen].bounds.size.width, 40)];
    self.footVi.backgroundColor = [UIColor grayColor];
    self.editTextField.delegate = self;
    [self.view addSubview:self.footVi];
    [self contentView];
    [self headPortraitImageView];
    [self nicknameLable];
    [self updateTimeLable];
    [self likeLable];
    [self likeButton];
    [self sendButton];
    [self editTextField];
    [self initView];
    [self loadLikePic];
}
#pragma mark - initView
-(void)initView{
    [self.sendButton setImage:[UIImage imageNamed:@"bbs_submit_icon"] forState:UIControlStateNormal];
    self.sendButton.tintColor = [UIColor redColor];
    [self.sendButton addTarget:self action:@selector(sendToEditView) forControlEvents:UIControlEventTouchUpInside];
    [self.sendButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.footVi).offset(-10);
        make.top.equalTo(self.footVi).offset(5);
        make.width.height.equalTo(30);
    }];
    self.editTextField.placeholder = @"写评论";
    self.editTextField.backgroundColor = [UIColor whiteColor];
    [self.editTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.footVi).offset(10);
        make.top.equalTo(self.footVi).offset(5);
        make.right.equalTo(self.sendButton.left).offset(-10);
        make.height.equalTo(30);
    }];
    self.headPortraitImageView.image = [UIImage imageNamed:@"bbs_detail_like"];
    [self.headPortraitImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableView.tableHeaderView.left).offset(10);
        make.top.equalTo(self.tableView.tableHeaderView.top).offset(10);
        make.width.height.equalTo(40);
    }];
    self.nicknameLable.text = @"qqqq";
    self.nicknameLable.font = [UIFont systemFontOfSize:15];
    [self.nicknameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headPortraitImageView.right).offset(5);
        make.top.equalTo(self.headPortraitImageView.top);
        make.width.equalTo(53);
        make.height.equalTo(17);
    }];
    self.updateTimeLable.text = @"111";
    self.updateTimeLable.font = [UIFont systemFontOfSize:12];
    [self.updateTimeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nicknameLable.left);
        make.bottom.equalTo(self.headPortraitImageView.bottom);
        make.width.height.equalTo(self.nicknameLable);
    }];
    self.likeLable.font = [UIFont systemFontOfSize:18];
    self.likeLable.text = @"喜欢";
    self.likeLable.textAlignment = NSTextAlignmentCenter ;
    self.likeLable.textColor = [UIColor redColor];
    [self.likeLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.tableView.tableHeaderView.bottom).offset(10);
        make.centerX.equalTo(self.tableView.tableHeaderView.centerX);
        make.width.height.equalTo(40);
    }];
    [self.likeButton setImage:[UIImage imageNamed:@"bbs_detail_like"] forState:UIControlStateNormal];
    [self.likeButton addTarget:self action:@selector(like) forControlEvents:UIControlEventTouchUpInside];
    [self.likeButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.likeLable.centerX);
        make.bottom.equalTo(self.likeLable.top).offset(10);
        make.width.height.equalTo(20);
    }];
    self.contentView.backgroundColor = [UIColor yellowColor];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headPortraitImageView.bottom).offset(5);
        make.bottom.equalTo(self.likeButton.top).offset(-5);
        make.left.equalTo(self.tableView.tableHeaderView.left).offset(10);
        make.right.equalTo(self.tableView.tableHeaderView.right).offset(-10);
    }];
    self.editView.backgroundColor = [UIColor grayColor];
    [self.editView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(50);
        make.width.equalTo(self.view.width);
        make.left.equalTo(self.view.left);
        make.bottom.equalTo(self.view.bottom).offset(-270);
    }];
    [self.cancelSendButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelSendButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.cancelSendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cancelSendButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelSendButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.editView.left).offset(5);
        make.top.equalTo(self.editView.top).offset(5);
        make.width.equalTo(30);
        make.height.equalTo(10);
    }];
    [self.otherSendButton setTitle:@"发送" forState:UIControlStateNormal];
    self.otherSendButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.otherSendButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.otherSendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    [self.otherSendButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.equalTo(self.cancelSendButton);
        make.right.equalTo(self.editView.right).offset(-5);
    }];
    self.otherEditTextField.placeholder = @"我来评论 (140字以内)";
    self.otherEditTextField.font = [UIFont systemFontOfSize:13];
    self.otherEditTextField.delegate = self;
    [self.otherEditTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cancelSendButton);
        make.right.equalTo(self.otherSendButton);
        make.top.equalTo(self.editView.top).offset(5);
        make.bottom.equalTo(self.editView.bottom).offset(-5);
    }];
}
#pragma mark - setters getters
-(UIView *)editView{
    if (!_editView) {
        _editView = [[UIView alloc]init];
        [self.view addSubview:_editView];
    }
    return _editView;
}
-(UITextField *)otherEditTextField{
    if (!_otherEditTextField) {
        _otherEditTextField = [[UITextField alloc]init];
        [self.editView addSubview:_otherEditTextField];
    }
    return _otherEditTextField;
}
-(UIButton *)otherSendButton{
    if (!_otherSendButton) {
        _otherSendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editView addSubview:_otherSendButton];
    }
    return _otherSendButton;
}
-(UIButton *)cancelSendButton{
    if (!_cancelSendButton) {
        _cancelSendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editView addSubview:_cancelSendButton];
        
    }
    return _cancelSendButton;
}
-(UITextField *)editTextField{
    if (!_editTextField) {
        _editTextField = [[UITextField alloc]init];
        [self.footVi addSubview:_editTextField];
    }
    return _editTextField;
}
-(UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.footVi addSubview:_sendButton];
    }
    return _sendButton;
}
-(UIImageView *)headPortraitImageView{
    if (!_headPortraitImageView) {
        _headPortraitImageView = [[UIImageView alloc]init];
        [self.tableView.tableHeaderView addSubview:_headPortraitImageView];
    }
    return _headPortraitImageView;
}
-(UIButton *)likeButton{
    if (!_likeButton) {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.tableView.tableHeaderView addSubview:_likeButton];
    }
    return _likeButton;
}
-(UILabel *)likeLable{
    if (!_likeLable) {
        _likeLable = [[UILabel alloc]init];
        [self.tableView.tableHeaderView addSubview:_likeLable];
        
    }
    return _likeLable;
}
-(UILabel *)nicknameLable{
    if (!_nicknameLable) {
        _nicknameLable = [[UILabel alloc]init];
        [self.tableView.tableHeaderView addSubview:_nicknameLable];
    }
    return _nicknameLable;
}
-(UILabel *)updateTimeLable{
    if (!_updateTimeLable) {
        _updateTimeLable = [[UILabel alloc]init];
        [self.tableView.tableHeaderView addSubview:_updateTimeLable];
    }
    return _updateTimeLable;
}
-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        [self.tableView.tableHeaderView addSubview:_contentView];
    }
    return _contentView;
}
#pragma mark - Private Methods
-(void)report{
    [self setReportAlert];
}
-(void)goToBack{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)sendToEditView{
    
}
-(void)send{
    
}
-(void)loadLikePic
{
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"flag"] isEqualToString:@"1"]) {
    [self.likeButton setImage:[UIImage imageNamed:@"bbs_detail_like_highlight"] forState:UIControlStateNormal];
    }else
    {
    [self.likeButton setImage:[UIImage imageNamed:@"bbs_detail_like"] forState:UIControlStateNormal];
    }
}
-(void)like{
    if ( [[[NSUserDefaults standardUserDefaults] objectForKey:@"flag"] isEqualToString:@"0"]) {
         [self.likeButton setImage:[UIImage imageNamed:@"bbs_detail_like_highlight"] forState:UIControlStateNormal];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"flag"];
    }
    else{
       [self setLikeAlert];
    }

    
}
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    return cell;
    
}
-(void)setLikeAlert{
    UIAlertView *likeAlertView = [[UIAlertView alloc]initWithTitle:nil message:@"你已经喜欢过了哟~" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    likeAlertView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4,[UIScreen mainScreen].bounds.size.height/2 , [UIScreen mainScreen].bounds.size.width/3, 20);
    [self.view addSubview:likeAlertView];
    [likeAlertView show];
}
-(void)setReportAlert{
    UIAlertView *reportAlertView = [[UIAlertView alloc]initWithTitle:nil message:(NSString *)orderReportContent delegate:self cancelButtonTitle:@"取消举报" otherButtonTitles:@"确认举报", nil];
    reportAlertView.frame = CGRectMake(20, [UIScreen mainScreen].bounds.size.height/3, [UIScreen mainScreen].bounds.size.width-40, [UIScreen mainScreen].bounds.size.height/4);
    reportAlertView.delegate = self;
    [reportAlertView show];
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==1) {
        UIAlertView *reportSuccessAlertView = [[UIAlertView alloc]initWithTitle:nil message:@"举报成功" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [reportSuccessAlertView show];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (range.location>=140)
    {
        return  NO;
    }
    else
    {
        return YES;
    }
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
