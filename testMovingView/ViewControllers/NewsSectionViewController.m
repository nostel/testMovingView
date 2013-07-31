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

@interface NewsSectionViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) NewsSection *newsSection;
@end

@implementation NewsSectionViewController
{
    int _currentImageIndex;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil newsList:(NewsSection *)newsSection
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _newsSection = newsSection;
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
    
    int topPadding = 1,botomPadding = 1;
    int space = 5;
    int imageWidth = 300;
    CGFloat usedWidth = 0;
    for (News *news in self.newsSection.newsArray)
    {
        UIImage *img = [UIImage imageNamed:news.imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        imageView.frame = CGRectMake(usedWidth, topPadding, imageWidth, self.scrollView.frame.size.height - topPadding - botomPadding);
        usedWidth += imageWidth + space;
        imageView.alpha = 0;
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(usedWidth, self.scrollView.frame.size.height);
    [self animateShowImage];
}

- (void)animateShowImage
{
    if (_currentImageIndex < self.newsSection.newsArray.count) {
        News *news = (News*)self.newsSection.newsArray[_currentImageIndex];
        if (news.isExisted)
        {
            [self.movingImageDelegate moveNews:news
                                        toView:self.scrollView.subviews[_currentImageIndex]
                             completionHandler:^(){
                                 ((UIView*)self.scrollView.subviews[_currentImageIndex]).alpha = 1;
                                 _currentImageIndex++;
                                 [self animateShowImage];
                             }
             ];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
