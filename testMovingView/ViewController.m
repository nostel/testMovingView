//
//  ViewController.m
//  testMovingView
//
//  Created by Le Tuan Son on 7/31/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "News.h"
#import "NewsSectionViewController.h"
#import "NewsSection.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView1;
@property (weak, nonatomic) IBOutlet UIView *containerView2;
@property (weak, nonatomic) IBOutlet UIView *childView;
- (IBAction)moveToView1:(id)sender;
- (IBAction)moveToView2:(id)sender;


@end

@implementation ViewController
{
    NewsSectionViewController *vc;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveToView1:(id)sender {
    
    // First create a CATransition object to describe the transition
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1;
//    transition.timingFunction = [CAMediaTimingFunction
//                                 functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type =kCATransitionFade;
//    transition.delegate = self;
//    // Next add it to the containerView's layer. This will perform the transition based on how we change its contents.
//    [self.view.layer addAnimation:transition forKey:nil];
    
    
//    [UIView transitionWithView:_childView
//                      duration:5
//                       options:UIViewAnimationOptionTransitionNone
//                    animations:^(){
//                        _childView.hidden = NO;
//                    }
//                    completion:^(BOOL finished){
//                    }
//     ];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelegate:self];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_childView cache:YES];
    _childView.alpha = 1;
    [UIView commitAnimations];
}

- (IBAction)moveToView2:(id)sender {
    NewsSection *section = [[NewsSection alloc] init];
    section.sectionName = @"Section1";
    for (int i = 0; i < 10 ; i++) {
        News *news = [[News alloc] init];
        news.imageName = @"news.jpg";
        news.title = [[NSString alloc] initWithFormat:@"title %i",i];
        news.isExisted = YES;
        [section.newsArray addObject:news];
    }
    
    vc = [[NewsSectionViewController alloc] initWithNibName:@"NewsHorizontalListViewController" bundle:nil newsList:section];
    vc.view.frame = _containerView2.bounds;
    vc.movingImageDelegate = self;
    [_containerView2 addSubview:vc.view];
    
}
- (void)moveNews:(News *)news toView:(UIView *)toView completionHandler:(CompletionBlock)completion
{
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"news.jpg"]];
    imgV.frame = CGRectMake(0, 0, 400, 400);
    [self.view addSubview:imgV];
    
    CGRect endFrame = [self.view convertRect:toView.frame fromView:toView.superview];
    [UIView animateWithDuration:ANIMATE_DURATION
                     animations:^(){
                         imgV.frame = endFrame;
                     }
                     completion:^(BOOL finished){
                         completion();
                         [imgV removeFromSuperview];
                     }
     ];
    
}
@end
