//
//  ViewController.m
//  JPAudioPlayer
//
//  Created by JUMPING on 2017/6/27.
//  Copyright © 2017年 JUMPING. All rights reserved.
//

#import "ViewController.h"
#import "JPRemotePlayer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *loadPV;

@property (nonatomic, weak) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UISlider *playSlider;

@property (weak, nonatomic) IBOutlet UIButton *mutedBtn;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;


@end

@implementation ViewController

- (NSTimer *)timer {
    if (!_timer) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        _timer = timer;
    }
    return _timer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self timer];
}


- (void)update {
    
    //    NSLog(@"--%zd", [JPRemotePlayer shareInstance].state);
    // 68
    // 01:08
    // 设计数据模型的
    // 弱业务逻辑存放位置的问题
    self.playTimeLabel.text =  [JPRemotePlayer shareInstance].currentTimeFormat;
    self.totalTimeLabel.text = [JPRemotePlayer shareInstance].totalTimeFormat;
    
    self.playSlider.value = [JPRemotePlayer shareInstance].progress;
    
    self.volumeSlider.value = [JPRemotePlayer shareInstance].volume;
    
    self.loadPV.progress = [JPRemotePlayer shareInstance].loadDataProgress;
    
    self.mutedBtn.selected = [JPRemotePlayer shareInstance].muted;
    
}


- (IBAction)play:(id)sender {
    
    // http://120.25.226.186:32812/resources/videos/minion_01.mp4
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4"];
    [[JPRemotePlayer shareInstance] playWithURL:url isCache:YES];
    
}
- (IBAction)pause:(id)sender {
    [[JPRemotePlayer shareInstance] pause];
}

- (IBAction)resume:(id)sender {
    [[JPRemotePlayer shareInstance] resume];
}
- (IBAction)kuaijin:(id)sender {
    [[JPRemotePlayer shareInstance] seekWithTimeDiffer:15];
}
- (IBAction)progress:(UISlider *)sender {
    [[JPRemotePlayer shareInstance] seekWithProgress:sender.value];
}
- (IBAction)rate:(id)sender {
    [[JPRemotePlayer shareInstance] setRate:2];
}
- (IBAction)muted:(UIButton *)sender {
    sender.selected = !sender.selected;
    [[JPRemotePlayer shareInstance] setMuted:sender.selected];
}
- (IBAction)volume:(UISlider *)sender {
    [[JPRemotePlayer shareInstance] setVolume:sender.value];
}

@end
