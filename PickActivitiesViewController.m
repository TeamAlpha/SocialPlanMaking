//
//  PickActivitiesViewController.m
//  SocialPlanMaking
//
//  Created by Omar Thanawalla on 1/24/14.
//  Copyright (c) 2014 Omar Thanawalla. All rights reserved.
//

#import "PickActivitiesViewController.h"
#import "Activities.h"
#import "CalendarContainerVC.h"

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



-(IBAction)hideKeyBoard
{
    NSLog(@"hideKeyBoard method");
    [self.activeTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"textFieldShouldClear");
    
    switch (textField.tag) {
        case 0:
            self.Loc1.text = @"";
            break;
        case 1:
            self.Loc2.text = @"";
            break;
        case 2:
            self.Loc3.text = @"";
            break;
        default:
            break;
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self setUpAccessViewForKeyBoard:textField];
}

-(void)setUpAccessViewForKeyBoard:(UITextField *)textField
{
    //create toolbar and hide button
    UIToolbar * myTlbr = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem * hideBtn = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleBordered target:self action:@selector(hideKeyBoard)];
    self.activeTextField = textField;
    [hideBtn setTitle:@"Close"];
    //set up flexibleSpacing
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //add items to toolbar
    [myTlbr setItems:[NSArray arrayWithObjects: flexibleSpace,hideBtn, nil]];
    //Add UIToolbar to keyboard
    [textField setInputAccessoryView:myTlbr];
}

- (IBAction)next:(id)sender {
    if ([self.Act1.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Alert" message: @"Please select an activity" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [self performSegueWithIdentifier:@"gotoCal" sender:nil];
    }
}

- (IBAction)Cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

    /* Delegate method from Activities Suggestion */
-(void)childViewController:(Activities *)tableViewController didSendString:(NSString *)value
{
    NSLog(@"This is the string I see: %@",value);
    NSArray *suggestionsArray = [value componentsSeparatedByString:@"@"];
    
    [self StripSuggestionWhitespace:suggestionsArray];
}

-(void)StripSuggestionWhitespace:(NSArray *) suggestionsArray
{
    //Strip beginning and ending white space
    NSString * act = suggestionsArray[0];
    NSString * loc = suggestionsArray[1];
    
    NSString * trimmedAct = [act stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * trimmedLoc = [loc stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray * suggestionsArrayNoWhiteSpace = @[trimmedAct, trimmedLoc];
    
    [self fillInRowWithSuggestion: suggestionsArrayNoWhiteSpace];
}

-(void)fillInRowWithSuggestion: (NSArray *)suggestion
{
    //if act1 has text dont do antyhing
    
    if ([self.Act1.text isEqualToString:@""]) {
        self.Act1.text = [suggestion objectAtIndex:0];
        self.Loc1.text = [suggestion objectAtIndex:1];
    }else if ([self.Act2.text isEqualToString:@""])
    {
        self.Act2.text = [suggestion objectAtIndex:0];
        self.Loc2.text = [suggestion objectAtIndex:1];
    }else if([self.Act3.text isEqualToString:@""])
    {
        self.Act3.text = [suggestion objectAtIndex:0];
        self.Loc3.text = [suggestion objectAtIndex:1];
    }
    else{
        //do nothing, everyone is full
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowSuggestions"])
    {
        self.myActivityController = segue.destinationViewController;
        self.myActivityController.delegate = self;
    }
    if([segue.identifier isEqualToString:@"gotoCal"])
    {
        //create the representation of the data
        [self transformActivityToArray];
        CalendarContainerVC * destVC = segue.destinationViewController;
        assert(self.activities != nil);
        destVC.activities = self.activities;
        
    }
}

-(void)transformActivityToArray
{
    NSLog(@"transformActivityToArray");
    NSMutableArray * activities = [NSMutableArray array];
    
    //Construct Activity1 Dictionary
    NSMutableDictionary * act1 = [[NSMutableDictionary alloc] init];
    act1[@"activity"] = self.Act1.text;
    if (![self.Loc1.text isEqualToString:@""]) {
        act1[@"location"] = self.Loc1.text;
    }else
    {
        act1[@"location"] = NULL;
    }
    [activities addObject:act1];
    
    //Construct Activity 2 Dictionary
    if (![self.Act2.text isEqualToString:@""])
    {
        NSMutableDictionary * act2 = [[NSMutableDictionary alloc] init];
        act2[@"activity"] = self.Act2.text;
        if (![self.Loc2.text isEqualToString:@""]) {
            act2[@"location"] = self.Loc2.text;
        }else
        {
            act2[@"location"] = NULL;
        }
        [activities addObject:act2];
    }
    
    //Construct Activity 3 Dictionary
    if (![self.Act3.text isEqualToString:@""])
    {
        NSMutableDictionary * act3 = [[NSMutableDictionary alloc] init];
        act3[@"activity"] = self.Act3.text;
        if (![self.Loc3.text isEqualToString:@""]) {
            act3[@"location"] = self.Loc3.text;
        }else
        {
            act3[@"location"] = NULL;
        }
        [activities addObject:act3];
    }
    self.activities = activities;
}

@end


/*
 //Text Manipulation Code
 
 -(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 {
 NSLog(@"text field is changing");
 return YES;
 }
 

 
 */
