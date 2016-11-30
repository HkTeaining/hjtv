//
//  Config.h
//  
//
//  Created by  on 15/11/6.
//  Copyright (c) 2016年 . All rights reserved.
//

#ifndef hjtv_Config_h
#define hjtv_Config_h

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);
typedef void (^ReturnValueKuBlock) (id returnValue1,id returnValue2);

#define DDLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif
