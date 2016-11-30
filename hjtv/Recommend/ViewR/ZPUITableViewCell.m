//
//  ZPUITableViewCell.m
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "ZPUITableViewCell.h"

@implementation ZPUITableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        _myCol1.delegate=self;
        _myCol1.dataSource=self;
        [_myCol1 reloadData];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[[UICollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    return cell;
}
@end
