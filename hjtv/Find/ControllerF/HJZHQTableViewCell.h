//
//  HJZHQTableViewCell.h
//  hjtv
//
//  Created by mac on 16/11/30.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJZHQTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headPortraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLable;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UIImageView *likeImage;
@property (weak, nonatomic) IBOutlet UILabel *likeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLable;
@property (weak, nonatomic) IBOutlet UIImageView *commentImage;

@end
