//
//  ZPUITableViewCell.m
//  hjtv
//
//  Created by mac on 16/11/29.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "ZPUITableViewCell.h"
#import "RCollectionViewCell.h"

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

        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake(([UIScreen mainScreen].bounds.size.width-40)/3.0, 180);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        self.tabcell2=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1800/2.5) collectionViewLayout:flowLayout];
        self.tabcell2.backgroundColor=[UIColor whiteColor];
        self.tabcell2.delegate=self;
        self.tabcell2.dataSource=self;
        [self.contentView addSubview:self.tabcell2];
//         [self.tabcell2 registerNib:[UINib nibWithNibName:@"RCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"cellId"];
                self.tabcell2.scrollEnabled=NO;
        [self.tabcell2 registerNib:[UINib nibWithNibName:@"ZpSCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellId"];
//        _myCol1.delegate=self;
//        _myCol1.dataSource=self;
//        [_myCol1 reloadData];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    RCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}
@end
