//
//  NewsHorizontalListViewController.h
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ANIMATE_DURATION 0.5

@class News,NewsSection;
typedef void (^ CompletionBlock)();
@protocol movingImageDelegate
- (void)moveNews:(News*)news toView:(UIView*)toView completionHandler:(CompletionBlock)completion;
@end

@interface NewsSectionViewController : UIViewController
@property (weak) id<movingImageDelegate> movingImageDelegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil newsList:(NewsSection*)newsSection;
@end
