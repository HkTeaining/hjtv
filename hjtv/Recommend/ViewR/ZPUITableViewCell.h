//
//  ZPUITableViewCell.h
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPUITableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *myCol1;

@end
