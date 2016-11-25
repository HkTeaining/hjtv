//
//  VarietyTableViewCell.m
//  hjtv
//
//  Created by mac on 16/11/25.
//  Copyright © 2016年 AFNetworking Tet. All rights reserved.
//

#import "VarietyTableViewCell.h"

@implementation VarietyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - initView
-(void)initView{
    [self.buttonOne addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonTwo addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonThree addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    self.lableOne.text = nil;
    self.lableTwo.text = nil;
    self.lableThree.text = nil;
    
}
#pragma mark - Private Methods
-(void)buttonPress{
    
}

@end
