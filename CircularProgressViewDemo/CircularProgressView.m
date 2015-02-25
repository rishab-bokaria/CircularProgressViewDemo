//
//  CircularProgressView.m
//
//  Created by Rishab on 17/02/15.
//  Copyright (c) 2015 Rishab. All rights reserved.
//

#import "CircularProgressView.h"
#import <QuartzCore/QuartzCore.h>

@interface CircularProgressView ()
{
    CAShapeLayer *_progressTrackCircleLayer, *_progressTintCircleLayer;
}
@end

@implementation CircularProgressView

#pragma mark CUSTOMIZE INITIALIZATION

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    _progress = 0.0;
    _lineWidth = 2.0f;
    _tintColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    _trackColor = [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1.0];
}

#pragma mark CUSTOMIZE APPEARANCE

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    if (_progress < 0.0){
        _progress = 0.0;
    }
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    if (_lineWidth < 2.0f) {
        _lineWidth = 2.0f;
    }
    [self setNeedsDisplay];
}

- (void)setTintColor:(UIColor *)tintColor{
    _tintColor = tintColor;
    if (!_tintColor) {
        _tintColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    }
    [self setNeedsDisplay];
}

- (void)setTrackColor:(UIColor *)trackColor{
    _trackColor = trackColor;
    if (!_trackColor) {
        _trackColor = [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1.0];
    }
    [self setNeedsDisplay];
}

#pragma mark DRAWING CIRCULAR PROGRESS

- (void)drawRect:(CGRect)rect {
    /*Remove layers before drawing new layers.*/
    [_progressTintCircleLayer removeFromSuperlayer];
    [_progressTrackCircleLayer removeFromSuperlayer];
    
    [super drawRect:rect];
    
    /*Take center point as half of width & height*/
    CGPoint centerPoint = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    
    /*Take radius as 83% of half of width || height*/
    CGFloat circleRadius = rect.size.width / 2 * 0.83;
    
    /*Draw bezier path using this center & radius.*/
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:circleRadius startAngle:(-0.5 * M_PI) endAngle:(1.5 * M_PI) clockwise:YES];
    
    /*Draw progress track layer(i.e, complete circle)!*/
    _progressTrackCircleLayer = [CAShapeLayer layer];
    _progressTrackCircleLayer.path = circlePath.CGPath;
    _progressTrackCircleLayer.strokeColor = _trackColor.CGColor;
    _progressTrackCircleLayer.fillColor = UIColor.clearColor.CGColor;
    _progressTrackCircleLayer.lineWidth = _lineWidth;
    _progressTrackCircleLayer.strokeStart = 0.0f;
    _progressTrackCircleLayer.strokeEnd = 1.0f;
    [self.layer addSublayer:_progressTrackCircleLayer];
    
    if (_progress > 0.0) {
        /*Draw progress tint layer(i.e, partial circle)!*/
        _progressTintCircleLayer = [CAShapeLayer layer];
        _progressTintCircleLayer.path = circlePath.CGPath;
        _progressTintCircleLayer.strokeColor = _tintColor.CGColor;
        _progressTintCircleLayer.fillColor = UIColor.clearColor.CGColor;
        _progressTintCircleLayer.lineWidth = _lineWidth * 1.5;
        _progressTintCircleLayer.strokeStart = 0.0f;
        _progressTintCircleLayer.strokeEnd = _progress;
        
        [self.layer addSublayer:_progressTintCircleLayer];
    }
}


@end
