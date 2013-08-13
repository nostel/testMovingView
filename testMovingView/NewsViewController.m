//
//  NewsViewController.m
//  testMovingView
//
//  Created by Le Tuan Son on 8/1/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil content:(News *)content
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _content = content;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    [self loadContent];
}

- (void)loadContent
{
    self.imageView.image = [UIImage imageNamed:self.content.imageName];
    self.titleLabel.text = self.content.title;
}

- (void)setContent:(News *)content
{
    _content = content;
    [self loadContent];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (animated) {
        [self moveInFromLeftAndReveal];
    }
}

- (void)moveInFromLeftAndReveal
{
    CGRect startFrame,endFrame;
    endFrame    = self.view.frame;
    startFrame  = CGRectMake(CGRectGetMinX(endFrame) + CGRectGetWidth(endFrame), CGRectGetMinY(endFrame), CGRectGetWidth(endFrame), CGRectGetHeight(endFrame));
    
    self.view.frame = startFrame;
    self.view.alpha = 0;
    
    [UIView animateWithDuration:0.5 animations:^(){
        self.view.frame = endFrame;
        self.view.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tap:(UITapGestureRecognizer*)gestureRecognizer
{
    NSLog(@"Tap on News");
}
@end
