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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    
    if (self.textField.text.length > 0) {
        NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
        NSError *error;

        Assignment *assignment = [NSEntityDescription insertNewObjectForEntityForName:@"Assignment" inManagedObjectContext:context];
        assignment.name = self.textField.text;
        assignment.date = self.datePicker.date;
        
        Course *course = (Course*)[context existingObjectWithID:self.course.objectID error:&error];
        NSMutableSet *currentAssignments = (NSMutableSet*)course.assignments;
        [currentAssignments addObject:assignment];
        course.assignments = (NSSet*)currentAssignments;
        
        if (![context save:&error]) {
            NSLog(@"Error saving new Assignment: %@", [error localizedDescription]);
        }
        self.assignment = assignment;
    }
}




@end
