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
    // Do any additional setup after loading the view from its nib.
//    RSFirstViewController *first=[RSFirstViewController new];
//    first.sendBlock=^(id sendValue){
//        self.navigationController.navigationBar.hidden=NO;
        NSURL *movieUrl=[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"mp4"];
//        NSURL *movieUrl=[NSURL URLWithString:sendValue];
//        self.moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:movieUrl];
//        self.moviePlayer.controlStyle=MPMovieControlStyleEmbedded;
//        self.moviePlayer.scalingMode=MPMovieScalingModeAspectFit;
//        [self.moviePlayer prepareToPlay];
//        [self.moviePlayer.view setFrame:CGRectMake(0, 0, 320, 480)];
//        [self.view addSubview:self.moviePlayer.view];
//    };
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    self.navigationItem.leftBarButtonItem.title=@"";
    self.navigationController.navigationBar.hidden=YES;
//    NSURL *movieUrl=[NSURL URLWithString:@"http://117.139.19.79/sohu/v1/TmkiTmwd0EI2PFy7eE14M86XNAeFqL8bWVCRgTAF5m47fFoGRMNiNw.mp4?k=aCoUTp&p=XZxIWhoBoJ2svm1BqVPcNmsdytP&r=TmI20LscWOo70Sc2ZD6Sqt8IS3eslDbJkDbtZ5Nak7gaUDQEwah0whesaOGECBfjvJAt6ODOfoIWFe4vmXAyBj&q=OpCAhW7IRYodRDvswmfCyY2sWhyHfhWt5GN45GAOvmbcWJbtfGNOWBeSqD24RhoUZDJ&cip=117.136.64.93"];
    self.moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:movieUrl];
    self.moviePlayer.controlStyle=MPMovieControlStyleEmbedded;
    self.moviePlayer.scalingMode=MPMovieScalingModeFill;
    self.moviePlayer.view.transform=CGAffineTransformConcat(self.moviePlayer.view.transform, CGAffineTransformMakeRotation(0));
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, 480, 320)];
    [self.view addSubview:self.moviePlayer.view];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerNowPlayingMovieDidChangeNotification object:self.moviePlayer];
    NSLog(@"%@",self.url);
}
-(void)movieFinishedCallback:(NSNotification *)ni
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    [self dismissMoviePlayerViewControllerAnimated];
}
-(BOOL)shouldAutorotate
{
    return  YES;
}
-(int)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}
@end
