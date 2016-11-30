//
//  ZXUITableViewCell.h
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXUITableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTb2;

@end
