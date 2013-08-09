//
//  MystifyViewController.m
//  testMovingView
//
//  Created by Son le on 8/7/13.
//  Copyright (c) 2013 Le Tuan Son. All rights reserved.
//

#import "MystifyViewController.h"
#import "MystifyView.h"
#import <QuartzCore/QuartzCore.h>

@interface MystifyViewController ()
@property (weak, nonatomic) IBOutlet UIView *mystifyViewContainer;
@property (strong, nonatomic) MystifyView *mystifyView;
- (IBAction)startButtonTapped:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;

@end

@implementation MystifyViewController

+ (NSString *)friendlyName
{
    return @"Mystify";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _mystifyView = [[MystifyView alloc] initWithFrame:_mystifyViewContainer.bounds];
    _mystifyView.autoresizingMask   = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _mystifyView.layer.borderWidth  = 1;
    _mystifyView.layer.cornerRadius = 5;
    
    _mystifyView.backgroundColor = [UIColor grayColor];
    [_mystifyViewContainer addSubview:_mystifyView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonTapped:(id)sender {
    [_mystifyView startAnimating];
}

- (IBAction)stopButtonTapped:(id)sender {
    [_mystifyView stopAnimating];
}
@end
