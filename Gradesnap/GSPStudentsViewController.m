//
//  GSPStudentsViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPStudentsViewController.h"
#import "GSPNewStudentViewController.h"

@interface GSPStudentsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;
@end

@implementation GSPStudentsViewController

@synthesize course;
@synthesize students;

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
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(course == %@)",self.course];
    [fetchRequest setPredicate:predicate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.students = [NSMutableArray arrayWithArray:[context executeFetchRequest:fetchRequest error:&error]];
    
    if (![context save:&error]) {
        NSLog(@"Error loading Students: %@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    
    [super viewDidLoad];
    self.navTitle.title = @"Students";
    self.navTitle.leftBarButtonItem.title = [NSString stringWithFormat:@"<%@",self.course.name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.students count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListStudentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Student *student = [self.students objectAtIndex:indexPath.row];
    cell.textLabel.text = student.name;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
 
/*
 // TODO implement
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
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.addButton)
    {
        [(GSPNewStudentViewController*)[segue destinationViewController] setCourse:self.course];
    }
}


-(IBAction)unwindToStudents:(UIStoryboardSegue *)segue
{
    // tODO
    
    GSPNewStudentViewController *source = [segue sourceViewController];
    Student *newStudent = source.student;
    
    if (newStudent != nil && [segue.identifier isEqualToString:@"NewStudentSegue"])
    {
        [self.students addObject:newStudent];
        [self.tableView reloadData];
    }
}


@end
