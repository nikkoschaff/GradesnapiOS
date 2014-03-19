//
//  GSPAssignmentViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPAssignmentViewController.h"

@interface GSPAssignmentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *classAverageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;
@property (weak, nonatomic) IBOutlet UIImageView *sampleImageView;
@end

@implementation GSPAssignmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark Inherited

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.classAverageLabel.text = [NSString stringWithFormat:@"Class Average: %f",[self.assignment classAverage]];
    self.navTitle.title = self.assignment.name;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    self.dateLabel.text = [dateFormatter stringFromDate:self.assignment.date];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // TODO

    
}

- (IBAction)unwindToAssignmentFromAssignmentStudent:(UIStoryboardSegue *)segue
{
    // TODO
}

@end
