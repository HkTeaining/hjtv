//
//  ZXUITableViewCell.m
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "ZXUITableViewCell.h"
#import "ZxSUITableViewCell.h"
#import "NetRequestClass+Recommend.h"
#import "UIImageView+WebCache.h"

@implementation ZXUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier sendArrar:(NSMutableArray *)ay  sendIndex:(NSInteger)kj
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.tabcell3 =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1500) style:UITableViewStylePlain];
        [self.tabcell3 reloadData];
        [self.contentView addSubview:self.tabcell3];
                self.tabcell3.scrollEnabled=NO;
        [self.tabcell3 registerNib:[UINib nibWithNibName:@"ZxSUITableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
        self.rArray=ay;
        self.kj=kj;
        self.tabcell3.delegate=self;
        self.tabcell3.dataSource=self;
//        [self  getModelData];
//        _myTb2.delegate=self;
//        _myTb2.dataSource=self;
//        _myTb2.tag=30;
//        [_myTb2 reloadData];
    }
    return self;
}
//-(void)getModelData
//{
//    //    [NetRequestClass getXjForRequestUrl:[[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/star/videos?sid=%d&sort=t&offset=0&count=20",[[self.rArray[self.kj] objectForKey:@"sid"] intValue]] WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
//    //
//    //    }];
//    [NetRequestClass getXjForRequestUrl:[NSString stringWithFormat:@"http://api.hanju.koudaibaobao.com/api/star/videos?sid=%d&sort=t&offset=0&count=20",[[self.rArray[self.kj] objectForKey:@"sid"] intValue]] WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
//        self.orArray=returnValue;
//        self.tabcell3.delegate=self;
//        self.tabcell3.dataSource=self;
//    }];
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text=@"12543";
//    cell.backgroundColor=[UIColor redColor];
//    return cell;
    ZxSUITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
//    UIImageView *im=(UIImageView *)[cell viewWithTag:100];
//    [im sd_setImageWithURL:[self.orArray[indexPath.row] objectForKey:@"thumb"] placeholderImage:nil];
//    UILabel *la=(UILabel *)[cell viewWithTag:200];
//    la.text=[self.orArray[indexPath.row] objectForKey:@"title"];
//    la.font=[UIFont systemFontOfSize:15];
//    UILabel *la1=(UILabel *)[cell viewWithTag:300];
//    la1.text=[self.orArray[indexPath.row] objectForKey:@"playCount"];
//    la1.font=[UIFont systemFontOfSize:13];
//    UILabel *la2=(UILabel *)[cell viewWithTag:300];
//    la2.text=[self.orArray[indexPath.row] objectForKey:@"danmuCount"];
//    la2.font=[UIFont systemFontOfSize:13];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
@end
