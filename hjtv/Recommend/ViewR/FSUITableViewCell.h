//
//  FSUITableViewCell.h
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSUITableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>

//@property (strong, nonatomic) IBOutlet UITableView *myTb1;
@property(nonatomic,strong)UITableView *tabcell;

@end
