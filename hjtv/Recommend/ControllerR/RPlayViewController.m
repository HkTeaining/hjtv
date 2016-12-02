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
#import "Url.h"

@interface RPlayViewController ()
@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@property(nonatomic,strong)NSURL *movieUrl;
@end

@implementation RPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  shouldAutorotate];
    [self supportedInterfaceOrientations];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSArray *Lan=[NSMutableArray arrayWithObjects:@"http://player.api.hanjutv.com/open/open.api.php?vid=CODUyNzQzMg==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODUyNzQ0MA==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODQ2NDg1Ng==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODUwNDU3Ng==&type=mp4",nil];
    NSArray *Zhu=[NSMutableArray arrayWithObjects:@"http://player.api.hanjutv.com/open/open.api.php?vid=CODIyNjEwMA==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODIyNjEwNA==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODIyNjA5Ng==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODIyNjExMg==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODI1ODU2OA==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODI1ODEzMg==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODI1ODEzMg==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODEyMTc4NA==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODM3NzM0MA==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODQyNjA3Mg==&type=mp4",@"http://player.api.hanjutv.com/open/open.api.php?vid=CODY3MzM3Mg==&type=mp4",nil];
    if([self.Jurl isEqualToString:@"蓝色大海的传说"])
    {
    self.movieUrl=[NSURL URLWithString:Lan[self.Jcount]];
        
    }else if([self.Jurl isEqualToString:@"住在我家的男人"])
    {
    self.movieUrl=[NSURL URLWithString:Zhu[self.Jcount]];
        
    }else
    {
        NSLog(@"%@",self.Jurl);   
        self.movieUrl=[NSURL URLWithString:@"http://202.119.25.35/162/43/14/acloud/151672/letv.v.yinyuetai.com/hd.yinyuetai.com/uploads/videos/common/9617014EBF3448E6F82DD617F983B1D7.flv?crypt=63aa7f2e98550&b=1314&nlh=4096&nlt=60&bf=6000&p2p=1&video_type=flv&termid=0&tss=no&platid=0&splatid=0&its=0&qos=5&fcheck=0&proxy=467484310&uid=3725754137.rp&keyitem=GOw_33YJAAbXYE-cnQwpfLlv_b2zAkYctFVqe5bsXQpaGNn3T1-vhw..&ntm=1480531200&nkey=134e86327a60970dc7c9f1c90c4636b5&nkey2=58c9e70279512018c6fc5f0a8d298999&geo=CN-23-323-7&sc=77305458c8cfc94e&errc=0&gn=136&vrtmcd=109&buss=106551&cips=222.18.127.25&lersrc=MTI1Ljg5Ljc0LjE3MQ==&tag=yinyuetai&cuhost=letv.v.yinyuetai.com&cuid=151672&fext=.flv"];
    }
//    NSURL *movieUrl=[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"mp4"];
    self.tabBarController.tabBar.hidden=YES;
    self.navigationItem.leftBarButtonItem.title=@"";
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
    self.navigationController.navigationBar.backgroundColor=[UIColor blackColor];
    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
    //    NSURL *movieUrl=[NSURL URLWithString:@"http://117.139.19.79/sohu/v1/TmkiTmwd0EI2PFy7eE14M86XNAeFqL8bWVCRgTAF5m47fFoGRMNiNw.mp4?k=aCoUTp&p=XZxIWhoBoJ2svm1BqVPcNmsdytP&r=TmI20LscWOo70Sc2ZD6Sqt8IS3eslDbJkDbtZ5Nak7gaUDQEwah0whesaOGECBfjvJAt6ODOfoIWFe4vmXAyBj&q=OpCAhW7IRYodRDvswmfCyY2sWhyHfhWt5GN45GAOvmbcWJbtfGNOWBeSqD24RhoUZDJ&cip=117.136.64.93"];
    self.moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:self.movieUrl];
    self.moviePlayer.controlStyle=MPMovieControlStyleEmbedded;
    self.moviePlayer.scalingMode=MPMovieScalingModeFill;
    self.moviePlayer.view.transform=CGAffineTransformConcat(self.moviePlayer.view.transform, CGAffineTransformMakeRotation(0));
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer.view setFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.moviePlayer.view];
    NSLog(@"%@",self.url);
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerNowPlayingMovieDidChangeNotification object:self.moviePlayer];
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        back.backgroundColor=[UIColor clearColor];
    [back  setBackgroundImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside ];
        [self.view addSubview:back];
}
-(void)back
{
    [self  dismissViewControllerAnimated:YES completion:nil];
    [self.moviePlayer stop];
}
//-(void)movieFinishedCallback:(NSNotification *)ni
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
//   
//}
-(BOOL)shouldAutorotate
{
    return  YES;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}
@end
