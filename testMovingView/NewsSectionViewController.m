//
//  NewsHorizontalListViewController.m
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "NewsSectionViewController.h"
#import "News.h"
#import "NewsSection.h"
#import "NewsViewController.h"

@interface NewsSectionViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation NewsSectionViewController
{
    int _currentImageIndex;
    NSMutableArray *_newsViewCtrlArray;
}
- (id)initWithNewsSection:(NewsSection*)newsSection
{
    self = [super init];
    if (self) {
        // Custom initialization
        _newsSection = newsSection;
        _newsViewCtrlArray = [[NSMutableArray alloc] init];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self buildNewsViews];
    [self animateShowImage];
}

- (void)buildNewsViews
{
    int topPadding = 1,botomPadding = 1;
    int space = 5;
    int imageWidth;
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
        imageWidth = 300;
    }
    else {
        imageWidth = 150;
    }
    CGFloat usedWidth = 0;
    for (News *news in self.newsSection.newsArray)
    {
        NewsViewController *newsViewCtrl = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil content:news];
        
        CGRect frame = CGRectMake(usedWidth, topPadding, imageWidth, self.scrollView.frame.size.height - topPadding - botomPadding);
        newsViewCtrl.view.frame = frame;
        
        newsViewCtrl.view.alpha = 0;
        
        [self.scrollView addSubview:newsViewCtrl.view];
        [_newsViewCtrlArray addObject:newsViewCtrl];
        
        usedWidth += imageWidth + space;
    }
    
    self.scrollView.contentSize = CGSizeMake(usedWidth, self.scrollView.frame.size.height);
}

- (void)animateShowImage
{
    if (_currentImageIndex < self.newsSection.newsArray.count) {
        News *news = (News*)self.newsSection.newsArray[_currentImageIndex];
        
        if ([self.newsSectionViewControllerDelegate shouldAnimateShowNews:news
                                        inView:self.scrollView.subviews[_currentImageIndex]
             ])
        {
            [self performSelector:@selector(delayedAnimateShowImage) withObject:self afterDelay:ANIMATE_DURATION];
        }
        else
        {
            [UIView animateWithDuration:ANIMATE_DURATION
                              delay:0
                            options:UIViewAnimationOptionTransitionNone
                         animations:^(){
                             ((UIView*)self.scrollView.subviews[_currentImageIndex]).alpha = 1;
                         }
                         completion:^(BOOL finished){
                             _currentImageIndex++;
                             [self animateShowImage];
                         }
             ];
        }
    }
}

- (void)delayedAnimateShowImage
{
    ((UIView*)self.scrollView.subviews[_currentImageIndex]).alpha = 1;
    _currentImageIndex++;
    [self animateShowImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
