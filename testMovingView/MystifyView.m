//
//  MystifyView.m
//  testMovingView
//
//  Created by Son le on 8/7/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "MystifyView.h"
#import <QuartzCore/QuartzCore.h>
#import "MystifyPolygon.h"
#import "MystifyPoint.h"
#define REFRESH_INTERVAL 0.02

@implementation MystifyView
{
//    CADisplayLink *_displayLink;
    NSTimer *_refreshTimer;
    NSMutableArray *_myPolygon;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _myPolygon = [[NSMutableArray alloc] init];
        NSMutableArray *points = [[NSMutableArray alloc] init];
        for (int i= 0; i < 3; i++) {
            MystifyPoint *point = [[MystifyPoint alloc] init];
            [points addObject:point];
        }
        
        MystifyPolygon *polygon = [[MystifyPolygon alloc] initWithPoints:points numberOfLines:3];
        [_myPolygon addObject:polygon];
        
        
        points = [[NSMutableArray alloc] init];
        for (int i= 0; i < 4; i++) {
            MystifyPoint *point = [[MystifyPoint alloc] init];
            [points addObject:point];
        }
        polygon = [[MystifyPolygon alloc] initWithPoints:points numberOfLines:5];
        
        [_myPolygon addObject:polygon];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (MystifyPolygon *polygon in _myPolygon)
    {
        [polygon draw:context rect:rect];
    }
}

- (void)startAnimating
{
//    if (!_displayLink)
//    {
//        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(redraw)];
//        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
//    }
    if (!_refreshTimer) {
        _refreshTimer = [NSTimer timerWithTimeInterval:REFRESH_INTERVAL target:self selector:@selector(refresh) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_refreshTimer forMode:NSDefaultRunLoopMode];
        
    }
}

- (void)stopAnimating
{
//    [_displayLink invalidate];
//    _displayLink = nil;
    
    [_refreshTimer invalidate];
    _refreshTimer = nil;
}

- (void)refresh
{
    for (MystifyPolygon *polygon in _myPolygon)
    {
        [polygon updatePosition];
    }
    
    [self performSelectorOnMainThread:@selector(redraw) withObject:nil waitUntilDone:YES];
}

- (void)redraw
{
    [self setNeedsDisplay];
}

- (void)dealloc
{
    [self stopAnimating];
}
@end
