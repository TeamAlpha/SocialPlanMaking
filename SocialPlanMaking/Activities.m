//
//  Activities.m
//  SocialPlanMaking
//
//  Created by Omar Thanawalla on 1/22/14.
//  Copyright (c) 2014 Omar Thanawalla. All rights reserved.
//

#import "Activities.h"

@interface Activities ()
@property (nonatomic, strong) NSArray * temp2;

@end

@implementation Activities

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"Activities: ViewDidLoad");
    self.title = @"Create Activities";
    self.temp2 = @[@"Swim @ Barton Springs", @"Eat @ Trudy's Restaurant", @"Biking @ Zilker Park", @"Climbing @ Gregory", @"Boating @ Lake Travis",@"Tailgating @ McCombs Plaza", @"Surfing @ Corpus Christie",@"Swim @ Barton Springs", @"Eat @ Trudy's Restaurant", @"Biking @ Zilker Park", @"Climbing @ Gregory", @"Boating @ Lake Travis",@"Tailgating @ McCombs Plaza", @"Surfing @ Corpus Christie"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.temp2 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Ferrari";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    cell.textLabel.text = self.temp2[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * value = [self.temp2 objectAtIndex:indexPath.row];
    [self.delegate childViewController:self didSendString:value];
}



@end
