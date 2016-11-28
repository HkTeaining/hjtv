//
//  NetRequestClass+Recommend.m
//  hjtv
//
//  Created by mac on 16/11/24.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "NetRequestClass+Recommend.h"
#import "NetRequestClass.h"
#import "HjVideoInfo.h"
#import "HjVideoList.h"
#import "StarVideoInfo.h"
#import "StarVideoList.h"
#import "StarVideoDy.h"
#import "StarVideoDyInfo.h"
#import "HjInfoSeries.h"
#import "HjInfo.h"
#import "HjInfoPlayInfo.h"
@implementation NetRequestClass (Recommend)
+(void)getHjVideoListForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block
{
  [self NetRequestGETWithRequestURL:url WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
      NSMutableArray *listAy=[NSMutableArray new];
      HjVideoList *list=[HjVideoList objectWithKeyValues:returnValue];
      for (HjVideoInfo *info in list.seriesList) {
          [listAy addObject:info];
      }
      block(listAy);
  } WithErrorCodeBlock:^(id errorCode) {
      NSLog(@"%@",errorCode);
  } WithFailureBlock:^{
      NSLog(@"失败");
  }];
}
+(void)getHjVideoInfoForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueKuBlock) block
{
    [self NetRequestGETWithRequestURL:url WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        NSMutableArray *listAy=[NSMutableArray new];
        NSMutableArray *listSeries=[NSMutableArray new];
        HjInfo *list=[HjInfo objectWithKeyValues:returnValue];
        for (HjInfoPlayInfo *info in list.playItems) {
            [listAy addObject:info];
        }
        [listSeries addObject:list.series];
        block(listAy,listSeries);
    } WithErrorCodeBlock:^(id errorCode) {
        NSLog(@"%@",errorCode);
    } WithFailureBlock:^{
        NSLog(@"失败");
    }];
}
+(void)getStarVideoListForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block
{
    [self NetRequestGETWithRequestURL:url WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        NSMutableArray *listAy=[NSMutableArray new];
        StarVideoList *list=[StarVideoList objectWithKeyValues:returnValue];
        for (StarVideoInfo *info in list.hotStars) {
            [listAy addObject:info];
        }
        block(listAy);
    } WithErrorCodeBlock:^(id errorCode) {
        NSLog(@"%@",errorCode);
    } WithFailureBlock:^{
        NSLog(@"失败");
    }];
}
+(void)getStarDyVideoListForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block
{
    [self NetRequestGETWithRequestURL:url WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        NSMutableArray *listAy=[NSMutableArray new];
        StarVideoDy *list=[StarVideoDy objectWithKeyValues:returnValue];
        for (StarVideoDyInfo *info in list.videos) {
            [listAy addObject:info];
        }
        block(listAy);
    } WithErrorCodeBlock:^(id errorCode) {
        NSLog(@"%@",errorCode);
    } WithFailureBlock:^{
        NSLog(@"失败");
    }];
}
+(void)getStarDetailInfoForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block
{
    [self NetRequestGETWithRequestURL:url WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        NSMutableArray *listAy=[NSMutableArray new];
        StarVideoDy *list=[StarVideoDy objectWithKeyValues:returnValue];
        for (StarVideoDyInfo *info in list.videos) {
            [listAy addObject:info];
        }
        block(listAy);
    } WithErrorCodeBlock:^(id errorCode) {
        NSLog(@"%@",errorCode);
    } WithFailureBlock:^{
        NSLog(@"失败");
    }];
}
+(void)getMoreInfoForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block
{
    [self NetRequestGETWithRequestURL:url WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        NSMutableArray *listAy=[NSMutableArray new];
        StarVideoList *list=[StarVideoList objectWithKeyValues:returnValue];
        for (StarVideoInfo *info in list.hotStars) {
            [listAy addObject:info];
        }
        block(listAy);
    } WithErrorCodeBlock:^(id errorCode) {
        NSLog(@"%@",errorCode);
    } WithFailureBlock:^{
        NSLog(@"失败");
    }];
}

@end
