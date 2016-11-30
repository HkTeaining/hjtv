//
//  HjInfo.h
//  hjtv
//
//  Created by mac on 16/11/24.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HjInfoSeries.h"

@interface HjInfo : NSObject
//1
@property(nonatomic,retain)HjInfoSeries *series;
@property(nonatomic,strong)NSMutableArray *playItems;
@property(nonatomic,strong)NSString *forumsg;
//2
@property(nonatomic,strong)NSMutableArray *seriesList;
@end
