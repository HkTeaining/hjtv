//
//  StarVideoInfo.h
//  hjtv
//
//  Created by mac on 16/11/24.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarVideoInfo : NSObject
@property(nonatomic,assign)NSUInteger sid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *thumb;
@property(nonatomic,strong)NSString *baikeUrl;
@property(nonatomic,assign)NSUInteger fansCount;
@property(nonatomic,assign)NSUInteger rank;
@end
