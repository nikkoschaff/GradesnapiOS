//
//  GSPCourseViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPCourseViewController.h"

@interface GSPCourseViewController ()
@property (weak, nonatomic) IBOutlet UIButton *assignmentButton;
@property (weak, nonatomic) IBOutlet UIButton *studentsButton;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;
@end

@implementation GSPCourseViewController

@synthesize course;

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
    self.navTitle.title = self.course.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindToCourse:(UIStoryboardSegue *)segue
{
    // Nothing for now
}

-(IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.studentsButton)
    {
        [(GSPStudentsViewController*)[(UINavigationController*)[segue destinationViewController] topViewController] setCourse:self.course];
    }
    if (sender == self.assignmentButton)
    {
       [(GSPAssignmentsViewController*)[(UINavigationController*)[segue destinationViewController] topViewController] setCourse:self.course];
    }
}

@end
