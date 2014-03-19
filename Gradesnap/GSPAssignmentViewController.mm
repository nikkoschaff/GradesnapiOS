//
//  GSPAssignmentViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPAssignmentViewController.h"

@interface GSPAssignmentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *classAverageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;
@end

@implementation GSPAssignmentViewController

@synthesize assignment;
@synthesize course;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark Inherited

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.classAverageLabel.text = [NSString stringWithFormat:@"Class Average: %f%%",[self.assignment classAverage]];
    self.navTitle.title = self.assignment.name;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    self.dateLabel.text = [dateFormatter stringFromDate:self.assignment.date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // TODO
    NSLog(@"preparing for segue");
    
}

- (IBAction)unwindToAssignmentFromAssignmentStudent:(UIStoryboardSegue *)segue
{
    // TODO
    NSLog(@"Unwinding from assignment student");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.course.students count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AssignmentStudentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

        // TODO
//    Student *student = [self.course.students objectAtIndex:indexPath.row];
//    cell.textLabel.text = course.name;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
