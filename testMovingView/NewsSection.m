//
//  NewsSection.m
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "NewsSection.h"

@implementation NewsSection
- (id)init
{
    self = [super init];
    if (self) {
        _newsArray = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
