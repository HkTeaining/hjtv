//
//  VideoInfo.h
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HjVideoInfo : NSObject
@property(nonatomic,strong)NSString *sid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger rank;
@property(nonatomic,assign)BOOL isFinished;
@property(nonatomic,assign)NSInteger publishTime;
@property(nonatomic,assign)NSInteger updateTime;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *thumb;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,assign)NSInteger category;
@property(nonatomic,assign)NSInteger living;
@end
