//
//  NewsSection.h
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsSection : NSObject
@property (copy) NSString *sectionName;
@property (nonatomic,strong) NSMutableArray *newsArray;
@end
