//
//  FSUITableViewCell.m
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "FSUITableViewCell.h"
#import "FsSTableViewCell.h"

@implementation FSUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
       self.tabcell =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1400) style:UITableViewStylePlain];
        self.tabcell.delegate=self;
        self.tabcell.dataSource=self;
        [self.tabcell reloadData];
        self.tabcell.scrollEnabled=NO;
        [self.contentView addSubview:self.tabcell];
        [self.tabcell registerNib:[UINib nibWithNibName:@"FsSTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
//        _myTb1.delegate=self;
//        _myTb1.dataSource=self;
//        _myTb1.tag=20;
//        [_myTb1 reloadData];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text=@"123";
//    cell.backgroundColor=[UIColor redColor];
//    return cell;
    FsSTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
@end
