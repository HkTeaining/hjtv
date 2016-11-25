//
//  NetRequestClass+Recommend.h
//  hjtv
//
//  Created by mac on 16/11/24.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "NetRequestClass.h"

@interface NetRequestClass (Recommend)
+(void)getHjVideoListForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block;
+(void)getStarVideoListForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block;
+(void)getStarDyVideoListForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueBlock) block;
+(void)getHjVideoInfoForRequestUrl:(NSString *)url WithParameter:(NSDictionary *)parameter  WithReturnValeuBlock: (ReturnValueKuBlock) block;
@end
