//
//  NewsPanelViewController.m
//  testMovingView
//
//  Created by Le Tuan Son on 8/1/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "NewsPanelViewController.h"
#import "NewsViewController.h"
#import "News.h"

@interface NewsPanelViewController ()
@property (weak, nonatomic) IBOutlet UIView *newsSlot1;
@property (weak, nonatomic) IBOutlet UIView *newsSlot2;
@property (weak, nonatomic) IBOutlet UIView *newsSlot3;
@property (weak, nonatomic) IBOutlet UIView *newsSlot4;
@property (weak, nonatomic) IBOutlet UIView *newsSlot5;

@end

@implementation NewsPanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNewsList:(NSArray *)newsList
{
    self = [super init];
    if (self) {
        _newsList = newsList;
        _newsViewCtrlArray = [[NSMutableArray alloc] init];
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self addNewsSlot:0];
}

- (void)addNewsSlot:(int)currentNewsSlot
{
    NSArray *newsSLots = @[_newsSlot1,_newsSlot2,_newsSlot3,_newsSlot4,_newsSlot5];

    News *news = self.newsList[currentNewsSlot];
    
    UIView *slot = newsSLots[currentNewsSlot];
    NewsViewController *newsViewCtrl = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil content:news];
    
    newsViewCtrl.view.frame = slot.bounds;
    
    [newsViewCtrl viewWillAppear:YES];
    [slot addSubview:newsViewCtrl.view];
    [newsViewCtrl viewDidAppear:YES];
    
    [_newsViewCtrlArray addObject:newsViewCtrl];
    [self addChildViewController:newsViewCtrl];
    
    currentNewsSlot++;
    
    // currently there's only 5 news slot
    if (currentNewsSlot >= newsSLots.count) {
        return;
    }
    else{
        [self addNewsSlot:currentNewsSlot];
    }
    
}
@end
