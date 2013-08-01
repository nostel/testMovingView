//
//  NewsSectionListViewController.h
//  testMovingView
//
//  Created by Le Tuan Son on 8/1/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsSectionViewController.h"

@interface NewsSectionListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NewsSectionViewControllerDelegate>

@property (nonatomic,strong) NSArray *sectionList;
@property (atomic,strong) NSMutableArray *availableNewsViewCtrlArray;

- (id)initWithSectionList:(NSArray*)sectionList ;
@end
