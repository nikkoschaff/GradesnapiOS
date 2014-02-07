//
//  GSPNewStudentViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPNewStudentViewController.h"

@interface GSPNewStudentViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (nonatomic) IBOutlet UITextField *textField;
@end

@implementation GSPNewStudentViewController

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
    // TODO save student info
    
    if (sender != self.doneButton) return;
    
    if (self.textField.text.length > 0) {
        
        
        NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
        
        Student *student = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Student"
                          inManagedObjectContext:context];
        student.name = self.textField.text;
        student.course = self.course;
        
        // TODO set student/course relationships
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Error saving new course: %@", [error localizedDescription]);
        }
        
        self.student = student;
    }
}

@end
