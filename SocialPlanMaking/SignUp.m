//
//  SignUp.m
//  SocialPlanMaking
//
//  Created by Omar Thanawalla on 2/1/14.
//  Copyright (c) 2014 Omar Thanawalla. All rights reserved.
//

#import "SignUp.h"
#import "FindFriends.h"

@interface SignUp ()

@end

@implementation SignUp

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)register:(id)sender {
    NSLog(@"Register Btn pushed");
    
    
    //Networking Code
    /*
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"Fullname": self.Fullname.text,
                                 @"EmailAddress": self.EmailAddress.text,
                                 @"Password" : self.Password.text
                                 };
    
    [manager POST:@"http://example.com/resources.json" parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self performSegueWithIdentifier:@"findFriends" sender:nil];
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
              
    }];
    */
    

    [self performSegueWithIdentifier:@"findFriends" sender:nil];
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//     if ([[segue identifier] isEqualToString:@"findFriends"]) {
//          FindFriends * destVC = [segue destinationViewController];
//     }
//}
@end
