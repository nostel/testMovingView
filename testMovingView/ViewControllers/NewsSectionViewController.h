//
//  NewsHorizontalListViewController.h
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ANIMATE_DURATION 0.4

@class News,NewsSection;
typedef void (^ CompletionBlock)();
@protocol NewsSectionViewControllerDelegate
- (BOOL)shouldAnimateShowNews:(News*)news inView:(UIView*)inView completionHandler:(CompletionBlock)completion;
- (void)didFinishedAnimateShowNews;
@end

@interface NewsSectionViewController : UIViewController
@property (weak) id<NewsSectionViewControllerDelegate> newsSectionViewControllerDelegate;
@property (nonatomic,strong) NewsSection *newsSection;

- (id)initWithNewsSection:(NewsSection*)newsSection;

@end
