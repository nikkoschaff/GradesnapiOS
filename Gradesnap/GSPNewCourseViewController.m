//
//  GSPNewCourseViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPNewCourseViewController.h"

@interface GSPNewCourseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation GSPNewCourseViewController

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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    
    if (self.textField.text.length > 0) {
        
        NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] performSelector:@selector(managedObjectContext)];
        
        Course *course = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Course"
                          inManagedObjectContext:context];
        course.name = self.textField.text;
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }

        self.course = course;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
