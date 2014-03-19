//
//  GSPAssignmentViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPAssignmentViewController.h"

@interface GSPAssignmentViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *classAverageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;
@end

@implementation GSPAssignmentViewController

@synthesize assignment;
@synthesize course;
@synthesize assignmentStudents;

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
    self.assignmentStudents = (NSMutableArray*)[self.assignment.assignmentStudents allObjects];
    
    self.classAverageLabel.text = [NSString stringWithFormat:@"Class Average: %f%%",[self.assignment classAverage]];
    self.navTitle.title = self.assignment.name;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    self.dateLabel.text = [dateFormatter stringFromDate:self.assignment.date];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AssignmentToAssignmentStudent"])
    {
        // TODO get assignmentstudent from sender
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [(GSPAssignmentStudentViewController*)[segue destinationViewController] setAssignmentStudent:[self.assignmentStudents objectAtIndex:[indexPath indexAtPosition:1]]];

    }
}


- (IBAction)unwindToAssignmentFromAssignmentStudent:(UIStoryboardSegue *)segue
{
    // TODO
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.assignment.assignmentStudents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AssignmentStudentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    AssignmentStudent *assignmentStudent = [self.assignmentStudents objectAtIndex:indexPath.row];
    
    NSString *gradeDetails = nil;
    if ((int)assignmentStudent.grade == -1)
    {
        gradeDetails = @"(Ungraded)";
    } else
    {
        gradeDetails = [NSString stringWithFormat:@"%@",assignmentStudent.grade];
    }
    NSString *cellText = [NSString stringWithFormat:@"%@ - %@",assignmentStudent.student.name,gradeDetails];
    cell.textLabel.text = cellText;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
