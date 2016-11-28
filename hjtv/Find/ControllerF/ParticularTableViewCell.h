//
//  ParticularTableViewCell.h
//  hjtv
//
//  Created by mac on 16/11/28.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParticularTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imaView;

@property (weak, nonatomic) IBOutlet UILabel *juMingLable;
@property (weak, nonatomic) IBOutlet UILabel *gradeLable;
@property (weak, nonatomic) IBOutlet UILabel *uoDateLable;
- (IBAction)playButton:(UIButton *)sender;

@end
