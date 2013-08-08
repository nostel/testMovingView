//
//  MystifyPoint.m
//  testMovingView
//
//  Created by Son le on 8/7/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "MystifyPoint.h"

@implementation MystifyPoint

- (id)init
{
    self = [super init];
    if (self) {
        _currentPosition = CGPointMake(arc4random()%100/100.0, arc4random()%100/100.0);
        _directionVector = CGPointMake((arc4random()%200/100.0 - 1)/40, (arc4random()%200/100.0 - 1)/40);
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    MystifyPoint *copy = [[MystifyPoint alloc] init];
    copy.currentPosition = self.currentPosition;
    copy.directionVector = self.directionVector;
    return copy;
}
@end
