//
//  ZXUITableViewCell.h
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXUITableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UITableView *myTb2;
@property(nonatomic,strong)UITableView *tabcell3;
@property(nonatomic,retain)NSMutableArray *orArray;
@property(nonatomic,retain)NSMutableArray *rArray;
@property(nonatomic,assign)NSInteger kj;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier sendArrar:(NSMutableArray *)ay  sendIndex:(NSInteger)kj;
@end
