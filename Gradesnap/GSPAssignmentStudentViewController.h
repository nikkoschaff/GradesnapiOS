//
//  GSPAssignmentStudentViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 3/19/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssignmentStudent.h"
#import "Student.h"

@interface GSPAssignmentStudentViewController : UIViewController
@property AssignmentStudent *assignmentStudent;
-(IBAction)regradeButtonPressed:(id)sender;
@end
