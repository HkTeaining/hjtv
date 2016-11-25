//
//  RSFirstViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//

#import "RSFirstViewController.h"
#import "NetRequestClass+Recommend.h"
#import "RPlayViewController.h"

@interface RSFirstViewController ()
@property(nonatomic,strong)NSMutableArray *playArray;
@end

@implementation RSFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getModelData];
   
}
-(void)getModelData
{
    [NetRequestClass getHjVideoInfoForRequestUrl:firstUrlInfo WithParameter:nil WithReturnValeuBlock:^(id returnValue1, id returnValue2) {
        self.playArray=returnValue1;
        [self setBtn];
    }];
}
-(void)setBtn
{
    float col = ([UIScreen mainScreen].bounds.size.width-4*60)/5.0;
    float row = (216-3*30)/4.0;
    for (int i = 0 ; i < self.playArray.count ; i++) {
    UIButton *vi = [[UIButton alloc] initWithFrame:CGRectMake(col+(col+60)*(i%4), row+(row+30)*(i/4), 60, 30)];
        [vi setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [vi addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        vi.tag=i+1;
        vi.backgroundColor=[UIColor grayColor];
        [self.view addSubview:vi];
    }
}
-(void)jump:(UIButton *)btn
{
//    self.sendBlock(self.playArray[btn.tag-1]);
    RPlayViewController *play=[RPlayViewController new];
    play.url=[self.playArray[btn.tag-1] objectForKey:@"srcUrl"];
//    [self presentViewController:play animated:YES completion:nil];
        [self.navigationController pushViewController:play animated:YES];
}
@end
