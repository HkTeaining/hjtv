//
//  RSFirstViewController.h
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSFirstViewController : UIViewController
typedef void (^SendValueBlock)(NSString *);
@property(nonatomic,copy)SendValueBlock sendBlock;
@end
