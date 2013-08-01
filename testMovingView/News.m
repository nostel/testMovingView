//
//  NewsModel.m
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "News.h"

@implementation News
- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[News class]]) {
        return NO;
    }
    News *object_ = (News*)object;
    return [self.title isEqualToString:object_.title];
}
@end
