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
#import "AssignmentStudent.h"
#import "Student.h"
#import "GSPAssignmentStudentViewController.h"


@interface GSPAssignmentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property Assignment *assignment;
@property Course *course;
@property NSMutableArray *assignmentStudents;
@end
