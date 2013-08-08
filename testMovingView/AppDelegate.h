//
//  AppDelegate.h
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,retain) UINavigationController *navigationController;
@property(nonatomic,retain) RootViewController *rootViewController;

@end
