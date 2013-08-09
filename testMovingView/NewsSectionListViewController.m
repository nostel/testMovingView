//
//  NewsSectionListViewController.m
//  testMovingView
//
//  Created by Le Tuan Son on 8/1/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "NewsSectionListViewController.h"
#import "NewsSectionViewController.h"
#import "NewsSection.h"
#import "NewsViewController.h"

@interface NewsSectionListViewController ()
{
    NSMutableArray *_newsSectionViewCtrlArray;
}
@end

@implementation NewsSectionListViewController

- (id)initWithSectionList:(NSArray *)sectionList
{
    self = [super init];
    if (self) {
        _sectionList = sectionList;
        [self buildNewsSectionViewControllers];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - my method

- (void)buildNewsSectionViewControllers
{
    _newsSectionViewCtrlArray = [[NSMutableArray alloc] init];
    for (NewsSection *newsSection in _sectionList)
    {
        NewsSectionViewController *vc = [[NewsSectionViewController alloc] initWithNewsSection:newsSection];
        vc.newsSectionViewControllerDelegate = self;
        [_newsSectionViewCtrlArray addObject:vc];
    }
}

#pragma mark - UITableView Datasource/Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _newsSectionViewCtrlArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsSectionViewController *vc = _newsSectionViewCtrlArray[indexPath.section];
    return (UITableViewCell *)vc.view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return ((NewsSection*)self.sectionList[section]).sectionName;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

#pragma mark - delegation
- (BOOL)shouldAnimateShowNews:(News*)news inView:(UIView*)inView
{
    for (NewsViewController *vc in self.availableNewsViewCtrlArray)
    {
        if([vc.content isEqual:news])
        {
            CGRect endFrame = [self.view convertRect:inView.frame fromView:inView.superview];
            [UIView animateWithDuration:ANIMATE_DURATION
                             animations:^(){
                                 vc.view.frame = endFrame;
                             }
                             completion:^(BOOL finished){
                                 [vc.view removeFromSuperview];
                                 [self.availableNewsViewCtrlArray removeObject:vc];
                             }
             ];
            return YES;
        }
    }
    
    return NO;
}

- (void)didFinishedAnimateShowNews
{
    
}
@end
