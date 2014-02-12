//
//  GSPAssignmentsViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/7/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPAssignmentsViewController.h"

@interface GSPAssignmentsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

@end

@implementation GSPAssignmentsViewController

@synthesize course;
@synthesize assignments;

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

    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(course == %@)",self.course];
    [fetchRequest setPredicate:predicate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Assignment" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.assignments = [NSMutableArray arrayWithArray:[context executeFetchRequest:fetchRequest error:&error]];
    
    if (![context save:&error]) {
        NSLog(@"Error loading Assignments: %@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.assignments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListAssignmentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Assignment *assignment = [self.assignments objectAtIndex:indexPath.row];
    cell.textLabel.text = assignment.name;
    // TODO format date description
    cell.detailTextLabel.text = assignment.date.description;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
        [context deleteObject:[self.assignments objectAtIndex:[indexPath indexAtPosition:1]]];
        [context save:nil];
        
        [self.assignments removeObjectAtIndex:[indexPath indexAtPosition:1]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.addButton)
    {
        [(GSPNewAssignmentViewController*)[segue destinationViewController] setCourse:self.course];
    }
//    else if ([segue.identifier isEqual:@"AssignmentSegue"])
//    {
//        [(GSPStudentViewController*)[segue destinationViewController] setCourse:self.course];
//        UITableViewCell *cell = (UITableViewCell*)sender;
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//        [(GSPStudentViewController*)[segue destinationViewController] setStudent:[self.students objectAtIndex:[indexPath indexAtPosition:1]]];
//    }
}



- (IBAction)unwindToAssignments:(UIStoryboardSegue *)segue
{
    GSPNewAssignmentViewController *source = [segue sourceViewController];
    Assignment *newAssignment = source.assignment;
    
    if (newAssignment != nil && [segue.identifier isEqualToString:@"NewAssignmentSegue"])
    {
        [self.assignments addObject:newAssignment];
        [self.tableView reloadData];
    }
}

@end
