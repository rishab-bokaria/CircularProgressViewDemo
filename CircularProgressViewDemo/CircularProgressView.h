//
//  CircularProgressView.h
//
//  Created by Rishab on 17/02/15.
//  Copyright (c) 2015 Rishab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircularProgressView : UIView

/**
 * The progress of the view.
 **/
@property (nonatomic, assign) CGFloat progress;

/**
 * The width of the line used to draw the progress.
 **/
@property (nonatomic, assign) CGFloat lineWidth;

/**
 * The color of the progress.
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 * The color of the progress track.
 */
@property (nonatomic, strong) UIColor *trackColor;

@end
