//
//  StarVideoDyInfo.h
//  hjtv
//
//  Created by mac on 16/11/24.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarVideoDyInfo : NSObject
@property(nonatomic,assign)NSUInteger vid;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSArray *sources;
@property(nonatomic,strong)NSString *thumb;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,assign)NSUInteger length;
@end
