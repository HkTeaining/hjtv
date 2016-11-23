//
//  RSecondViewController.m
//  hjtv
//
//  Created by mac on 16/11/22.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RSecondViewController.h"
#import "RCollectionHeaderViewCollectionReusableView.h"
#import "RCollectionViewThreeCell.h"
#import "RCollectionViewTwoCell.h"

@interface RSecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *myColOne;

@end

@implementation RSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.myColOne registerNib:[UINib nibWithNibName:@"RCollectionViewTwoCell" bundle:nil]  forCellWithReuseIdentifier:@"cellIdtwo"];
    [self.myColOne registerNib:[UINib nibWithNibName:@"RCollectionViewThreeCell" bundle:nil]  forCellWithReuseIdentifier:@"cellIdthree"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(60, 70);
    flowLayout.minimumLineSpacing=15;
    flowLayout.minimumInteritemSpacing=15;
    flowLayout.sectionInset=UIEdgeInsetsMake(10,10, 0, 10);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    self.myColOne.collectionViewLayout=flowLayout;
    self.myColOne.backgroundColor=[UIColor whiteColor];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        [collectionView registerNib:[UINib nibWithNibName:@"RCollectionHeaderViewCollectionReusableView" bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
        RCollectionHeaderViewCollectionReusableView *head=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        UILabel *la=(UILabel *)[head viewWithTag:100];
        la.text=@"明星排行榜";
        la.font=[UIFont systemFontOfSize:15];
        la.textColor=[UIColor grayColor];
        UIImageView *imView=(UIImageView *)[head viewWithTag:200];
        imView.image=[UIImage imageNamed:@"star_rank_icon"];
        return head;
    }else
    {
        [collectionView registerNib:[UINib nibWithNibName:@"RCollectionHeaderViewCollectionReusableView" bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
        RCollectionHeaderViewCollectionReusableView *head=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
         UILabel *la=(UILabel *)[head viewWithTag:100];
        la.text=@"明星动态";
        la.font=[UIFont systemFontOfSize:15];
        la.textColor=[UIColor grayColor];
        UIImageView *imView=(UIImageView *)[head viewWithTag:200];
        imView.image=[UIImage imageNamed:@"star_dynamic_icon"];
        return head;
    }
   
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(320, 30);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
       return CGSizeMake(60, 70);
    }else
    {
       return CGSizeMake(140, 130);
    }

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 8;
    }else
    {
        return 56;
    }
}
//1(x) 1(x) 1/1/(x) 1/1/(x) x x x x
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==7) {
            RCollectionViewTwoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdtwo" forIndexPath:indexPath];
            UIImageView *im=(UIImageView *)[cell viewWithTag:100];
            im.image=[UIImage imageNamed:@"star_rank_more"];
            UIImageView *imTwo=(UIImageView *)[cell viewWithTag:300];
              imTwo.image=[UIImage imageNamed:[NSString stringWithFormat:@"star_rank_%d",indexPath.row]];
            UILabel *la=(UILabel *)[cell viewWithTag:200];
            la.text=@"更多";
            la.font=[UIFont systemFontOfSize:15];
            cell.backgroundColor=[UIColor whiteColor];
            return cell;
            
        }
        RCollectionViewTwoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdtwo" forIndexPath:indexPath];
        UIImageView *im=(UIImageView *)[cell viewWithTag:100];
        im.image=[UIImage imageNamed:@"danmu_color_green_highlighted"];
        UIImageView *imTwo=(UIImageView *)[cell viewWithTag:300];
        imTwo.image=[UIImage imageNamed:[NSString stringWithFormat:@"star_rank_%d",indexPath.row+1]];
        UILabel *la=(UILabel *)[cell viewWithTag:200];
            cell.backgroundColor=[UIColor whiteColor];
        la.text=@"余礼秋";
        return cell;
    }else
    {
        RCollectionViewTwoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdthree" forIndexPath:indexPath];
        UIImageView *im=(UIImageView *)[cell viewWithTag:200];
        im.image=[UIImage imageNamed:@"danmu_roll_highlighted"];
        UILabel *la0=(UILabel *)[cell viewWithTag:100];
        la0.text=@"02:44";
        la0.font=[UIFont systemFontOfSize:17];
        UILabel *la1=(UILabel *)[cell viewWithTag:300];
        la1.text=@"蓝色大海的传说拍摄";
        la1.font=[UIFont systemFontOfSize:15];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    
}


@end
