//
//  GSPMasterViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPMasterViewController.h"

#import "GSPNewCourseViewController.h"

#import "Course.h"


@interface GSPMasterViewController ()

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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.courses = (NSMutableArray*)[context executeFetchRequest:fetchRequest error:&error];
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
    return [courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCourseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Course *course = [courses objectAtIndex:indexPath.row];
    cell.textLabel.text = course.name;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

 

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    GSPNewCourseViewController *source = [segue sourceViewController];
    Course *newCourse = source.course;
    
    if (newCourse != nil)
    {
        NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
        NSFetchRequest *fetchRequest = [NSFetchRequest new];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSError *error;
        self.courses = (NSMutableArray*)[context executeFetchRequest:fetchRequest error:&error];
        [self.tableView reloadData];
    }
}



@end
