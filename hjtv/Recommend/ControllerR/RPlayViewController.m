//
//  RPlayViewController.m
//  hjtv
//
//  Created by mac on 16/11/23.
//  Copyright (c) 2016年 AFNetworking Tet. All rights reserved.
//
#import "RPlayViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "RSFirstViewController.h"

@interface RPlayViewController ()
@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@end

@implementation RPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *movieUrl=[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"mp4"];
    self.tabBarController.tabBar.hidden=YES;
    self.navigationItem.leftBarButtonItem.title=@"";
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
      self.navigationController.navigationBar.backgroundColor=[UIColor blackColor];
    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
//    NSURL *movieUrl=[NSURL URLWithString:@"http://117.139.19.79/sohu/v1/TmkiTmwd0EI2PFy7eE14M86XNAeFqL8bWVCRgTAF5m47fFoGRMNiNw.mp4?k=aCoUTp&p=XZxIWhoBoJ2svm1BqVPcNmsdytP&r=TmI20LscWOo70Sc2ZD6Sqt8IS3eslDbJkDbtZ5Nak7gaUDQEwah0whesaOGECBfjvJAt6ODOfoIWFe4vmXAyBj&q=OpCAhW7IRYodRDvswmfCyY2sWhyHfhWt5GN45GAOvmbcWJbtfGNOWBeSqD24RhoUZDJ&cip=117.136.64.93"];
    self.moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:movieUrl];
    self.moviePlayer.controlStyle=MPMovieControlStyleEmbedded;
    self.moviePlayer.scalingMode=MPMovieScalingModeFill;
        self.moviePlayer.view.transform=CGAffineTransformConcat(self.moviePlayer.view.transform, CGAffineTransformMakeRotation(0));
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer.view setFrame:CGRectMake(0, 0,320, 480)];
    [self.view addSubview:self.moviePlayer.view];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerNowPlayingMovieDidChangeNotification object:self.moviePlayer];
    NSLog(@"%@",self.url);
    UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    back.backgroundColor=[UIColor blackColor];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:back];
}
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
    [self.moviePlayer stop];
}
//-(void)movieFinishedCallback:(NSNotification *)ni
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
//   
//}
//-(BOOL)shouldAutorotate
//{
//    return  YES;
//}
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//}
@end
