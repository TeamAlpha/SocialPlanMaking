//
//  PickActivitiesViewController.m
//  SocialPlanMaking
//
//  Created by Omar Thanawalla on 1/24/14.
//  Copyright (c) 2014 Omar Thanawalla. All rights reserved.
//

#import "PickActivitiesViewController.h"
#import "Activities.h"

@interface PickActivitiesViewController ()
@property (nonatomic, strong) Activities * myActivities;
@end

@implementation PickActivitiesViewController

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
	// Do any additional setup after loading the view.
    NSLog(@"PickActivitiesVC loaded");
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end