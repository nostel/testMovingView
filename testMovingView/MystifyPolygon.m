//
//  MystifyPolygon.m
//  testMovingView
//
//  Created by Son le on 8/7/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//
CGPoint CGPointAdd(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

#import "MystifyPolygon.h"
#import "MystifyPoint.h"
@interface MystifyPolygon()
@property (strong, nonatomic) NSMutableArray *points;
@property int lineNumber;
@end

@implementation MystifyPolygon

- (id)initWithPoints:(NSArray *)points numberOfLines:(int)number
{
    self = [super init];
    if (self) {
        _points = [[NSMutableArray alloc] init];
        [_points addObject:points];
        _lineNumber = number;
    }
    return self;
}

- (void)updatePosition
{
    NSMutableArray *currentPoint = [[NSMutableArray alloc] initWithArray:_points[_points.count-1] copyItems:YES];
    for (MystifyPoint *point in currentPoint)
    {
        point.currentPosition = CGPointAdd(point.currentPosition, point.directionVector);
        if (point.currentPosition.x <= 0 || point.currentPosition.x >= 1) {
            point.directionVector = CGPointMake(-point.directionVector.x, point.directionVector.y);
        }
        
        if (point.currentPosition.y <= 0 || point.currentPosition.y >= 1) {
            point.directionVector = CGPointMake(point.directionVector.x, -point.directionVector.y);
        }
    }

    [_points addObject:currentPoint];
    if (_points.count > _lineNumber) {
        [_points removeObjectAtIndex:0];
    }
    
}

- (void)draw:(CGContextRef)context rect:(CGRect)frame
{
    if (_points.count == 0) {
        return;
    }
    
    CGContextSaveGState(context);
    
    for (NSArray * points in _points)
    {
        CGMutablePathRef path = CGPathCreateMutable();
        MystifyPoint *firstPoint = points[0];
        CGPathMoveToPoint(path, NULL, firstPoint.currentPosition.x*frame.size.width, firstPoint.currentPosition.y*frame.size.height);
        for (int i = 1; i < points.count; i++) {
            MystifyPoint *point = points[i];
            CGPathAddLineToPoint(path, NULL, point.currentPosition.x*frame.size.width, point.currentPosition.y*frame.size.height);
        }
        CGPathAddLineToPoint(path, NULL, firstPoint.currentPosition.x*frame.size.width, firstPoint.currentPosition.y*frame.size.height);
        
        CGContextAddPath(context, path);
        CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextStrokePath(context);
        CGPathRelease(path);
    }
    CGContextRestoreGState(context);
}
@end
