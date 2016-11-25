//
//  RSThreeViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RSThreeViewController.h"
#import "NetRequestClass+Recommend.h"
@interface RSThreeViewController ()
@property(nonatomic,strong)NSMutableArray *playArray;
@end

@implementation RSThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)getModelData
{
    [NetRequestClass getHjVideoInfoForRequestUrl:firstUrlInfo WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
        self.playArray=returnValue1;
    }];
}

@end
