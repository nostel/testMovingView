//
//  NewsPanelViewController.h
//  testMovingView
//
//  Created by Le Tuan Son on 8/1/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPanelViewController : UIViewController

@property (nonatomic,strong) NSMutableArray *newsViewCtrlArray;
@property (nonatomic,strong) NSArray *newsList;

- (id)initWithNewsList:(NSArray*)newsList;
@end
