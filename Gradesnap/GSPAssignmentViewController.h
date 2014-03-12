//
//  GSPAssignmentViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assignment.h"
#import "Course.h"
#import "ELCImagePickerController.h"


@interface GSPAssignmentViewController : UIViewController <ELCImagePickerControllerDelegate>
@property Assignment *assignment;
@property Course *course;

@property (weak, nonatomic) IBOutlet UIButton *gradeExamsButton;

-(IBAction)gradeExamsButtonPressed:(id)sender;

@end
