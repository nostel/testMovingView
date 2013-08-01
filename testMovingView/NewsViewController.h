//
//  NewsViewController.h
//  testMovingView
//
//  Created by Le Tuan Son on 8/1/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsViewController : UIViewController

@property (nonatomic,strong) News *content;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil content:(News*)content;

@end
