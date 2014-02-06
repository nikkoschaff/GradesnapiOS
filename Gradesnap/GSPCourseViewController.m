//
//  GSPCourseViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPCourseViewController.h"

@interface GSPCourseViewController ()

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
    
}

-(IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // TODO set course for studentsViewController
}

@end
