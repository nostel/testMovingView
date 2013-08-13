//
//  ViewController.m
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "ImageTransferViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "News.h"
#import "NewsSection.h"
#import "NewsSectionListViewController.h"
#import "NewsPanelViewController.h"
#import "NewsViewController.h"

typedef enum {
    NewsViewCtrlTypePanel = 0,
    NewsViewCtrlTypeList
} NewsViewCtrlType;

@interface ImageTransferViewController ()
@property NewsViewCtrlType type;
@property (nonatomic,strong) NewsSectionListViewController *newsSectionListViewCtrl;
@property (nonatomic,strong) NewsPanelViewController *newsPanelViewCtrl;

@property (weak, nonatomic) IBOutlet UIView *contentView;

- (IBAction)changeViewsType:(id)sender;

@end

@implementation ImageTransferViewController

+ (NSString *)friendlyName {
    return @"Moving View";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self addNewsPanel];
}

- (void)viewWillAppear:(BOOL)animated
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"change";
    barButton.target = self;
    barButton.action = @selector(changeViewsType:);
    self.navigationItem.rightBarButtonItem = barButton;
}

- (void)addNewsPanel
{
    self.type = NewsViewCtrlTypePanel;
    
    // create dummy data
    NSMutableArray *newsList = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5 ; i++)
    {
        News *news = [[News alloc] init];
        news.imageName = @"news.jpg";
        news.title = [[NSString alloc] initWithFormat:@"title %i",i*10+i];
        [newsList addObject:news];
    }

    // add panel
    self.newsPanelViewCtrl = [[NewsPanelViewController alloc] initWithNewsList:newsList];
    self.newsPanelViewCtrl.view.frame = self.contentView.bounds;
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type =kCATransitionFade;
    [self.contentView.layer addAnimation:transition forKey:nil];
    [self.contentView addSubview:self.newsPanelViewCtrl.view];
}

- (void)addNewsListWithAvailableNewsViewCtrl:(NSMutableArray*)availabeNewsViewCtrls
{
    self.type = NewsViewCtrlTypeList;
    
    // Create dummy data
    NSMutableArray *sectionList = [[NSMutableArray alloc] init];

    for (int i = 0; i < 7 ; i++)
    {
        NewsSection *section = [[NewsSection alloc] init];
        section.sectionName = [NSString stringWithFormat:@"Section %i",i];
        for (int j = 0; j < 10 ; j++) {
            News *news = [[News alloc] init];
            news.imageName = @"news.jpg";
            news.title = [[NSString alloc] initWithFormat:@"title %i",j*10 + i];
            [section.newsArray addObject:news];
        }
        [sectionList addObject:section];
    }
    
    // add section list
    self.newsSectionListViewCtrl = [[NewsSectionListViewController alloc] initWithSectionList:sectionList];
    self.newsSectionListViewCtrl.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.newsSectionListViewCtrl.view];
    
    // prepare view for translating
    if (availabeNewsViewCtrls) {
        for (NewsViewController *vc in availabeNewsViewCtrls)
        {
            CGRect newFrame = [self.newsSectionListViewCtrl.view convertRect:vc.view.frame fromView:vc.view.superview];
            vc.view.frame = newFrame;
            [self.newsSectionListViewCtrl.view addSubview:vc.view];
        }
        self.newsSectionListViewCtrl.availableNewsViewCtrlArray = availabeNewsViewCtrls;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeViewsType:(id)sender {
    
    if (self.type == NewsViewCtrlTypePanel)
    {
        //TODO: Need to determine which newsViewCtrl is keeped
        NSMutableArray *newsVCArray = [[NSMutableArray alloc] init];
        [newsVCArray addObject:self.newsPanelViewCtrl.newsViewCtrlArray[0]];
        [newsVCArray addObject:self.newsPanelViewCtrl.newsViewCtrlArray[1]];

        [self addNewsListWithAvailableNewsViewCtrl:newsVCArray];
        [self.newsPanelViewCtrl.view removeFromSuperview];
        self.newsPanelViewCtrl = nil;
    }
    else
    {
        [self addNewsPanel];
        [self.newsSectionListViewCtrl.view removeFromSuperview];
        self.newsSectionListViewCtrl = nil;
    }
}

@end
