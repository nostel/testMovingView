//
//  NewsModel.h
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imageName;
@property BOOL isExisted;
@end
