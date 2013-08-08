//
//  MystifyPolygon.h
//  testMovingView
//
//  Created by Son le on 8/7/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MystifyPolygon : NSObject
- (id)initWithPoints:(NSArray*)points numberOfLines:(int)number;

- (void)updatePosition;

- (void)draw:(CGContextRef)context rect:(CGRect)frame;

@end
