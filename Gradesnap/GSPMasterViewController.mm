//
//  GSPMasterViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPMasterViewController.h"

#import "GSPNewCourseViewController.h"
#import "GSPCourseViewController.h"

#import "Course.h"


@interface GSPMasterViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@end

@implementation GSPMasterViewController

@synthesize managedObjectContext;
@synthesize courses;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
    
    // TODO handle + bug
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.courses = [NSMutableArray arrayWithArray:[self.managedObjectContext executeFetchRequest:fetchRequest error:&error]];
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error loading courses: %@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCourseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Course *course = [courses objectAtIndex:indexPath.row];
    cell.textLabel.text = course.name;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.managedObjectContext deleteObject:[self.courses objectAtIndex:[indexPath indexAtPosition:1]]];
        [self.managedObjectContext save:nil];
        
        [self.courses removeObjectAtIndex:[indexPath indexAtPosition:1]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    if (sender != self.addButton)
    {
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [(GSPCourseViewController*)[segue destinationViewController] setCourse:[self.courses objectAtIndex:[indexPath indexAtPosition:1]]];
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    GSPNewCourseViewController *source = [segue sourceViewController];
    Course *newCourse = source.course;
    
    if (newCourse != nil && [segue.identifier isEqualToString:@"NewCourseSegueDone"])
    {
        [self.courses addObject:newCourse];
        [self.tableView reloadData];
    }
}



@end
