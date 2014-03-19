//
//  GSPNewAssignmentViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPNewAssignmentViewController.h"

@interface GSPNewAssignmentViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation GSPNewAssignmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.textField setDelegate:self];
    [self.textField setReturnKeyType:UIReturnKeyDone];
    
    if (self.answers == nil)
    {
        [self.doneButton setEnabled:NO];
    }
    else
    {
        [self.doneButton setEnabled:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)unwindToNewAssignment:(UIStoryboardSegue *)segue
{
    GSPNewAnswerKeyViewController *source = [segue sourceViewController];
    self.answers = source.answers;
    if (self.answers != nil)
    {
        [self.doneButton setEnabled:YES];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;

    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
    NSError *error;
    
    Assignment *assignment = [NSEntityDescription insertNewObjectForEntityForName:@"Assignment" inManagedObjectContext:context];
    assignment.name = self.textField.text;
    assignment.date = self.datePicker.date;
    assignment.course = self.course;
    assignment.answers = self.answers;
    self.assignment = assignment;
    
    Course *course = (Course*)[context existingObjectWithID:self.course.objectID error:&error];
    NSMutableSet *currentAssignments = (NSMutableSet*)course.assignments;
    [currentAssignments addObject:assignment];
    course.assignments = (NSSet*)currentAssignments;
    
    // Set up AssignmentStudents
    NSMutableSet *assignmentStudents = [NSMutableSet new];
    for (Student *student in self.course.students)
    {
        AssignmentStudent *newAssignmentStudent = [NSEntityDescription
                                                   insertNewObjectForEntityForName:@"AssignmentStudent"
                                                   inManagedObjectContext:context];
        newAssignmentStudent.assignment = assignment;
        newAssignmentStudent.student = student;
        newAssignmentStudent.grade = [NSNumber numberWithInt:-1];
        [assignmentStudents addObject:newAssignmentStudent];
    }
    
    NSSet *finalAssignmentStudents = [NSSet setWithSet:assignmentStudents];
    self.assignment.assignmentStudents = finalAssignmentStudents;
    
    if (![context save:&error])
    {
        NSLog(@"Error saving new Assignment: %@", [error localizedDescription]);
    }
    self.course = course;
}

@end
