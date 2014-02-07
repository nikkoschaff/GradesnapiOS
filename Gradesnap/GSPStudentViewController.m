//
//  GSPStudentViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/7/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPStudentViewController.h"

@interface GSPStudentViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;

@end

@implementation GSPStudentViewController

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
    self.navTitle.title = self.student.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
