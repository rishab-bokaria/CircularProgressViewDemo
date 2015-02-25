//
//  ViewController.m
//  CircularProgressViewDemo
//
//  Created by Rishab on 17/02/15.
//  Copyright (c) 2015 Rishab. All rights reserved.
//

#import "ViewController.h"
#import "CircularProgressView.h"

@interface ViewController ()
{
    __weak IBOutlet CircularProgressView *_circularProgressView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _circularProgressView.progress = 0.0;
    _circularProgressView.lineWidth = 3.0f;
//    _circularProgressView.trackColor = [UIColor blueColor];
//    _circularProgressView.tintColor = [UIColor whiteColor];
    [self updateProgress];
}


- (void)updateProgress{
    float progress = _circularProgressView.progress * 100;
    progress++;
    
    _circularProgressView.progress = progress * 0.01;
    if (_circularProgressView.progress < 1.0) {
        [self performSelector:@selector(updateProgress) withObject:nil afterDelay:1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
