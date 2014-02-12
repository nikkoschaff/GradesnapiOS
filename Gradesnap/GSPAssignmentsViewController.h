//
//  GSPAssignmentsViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/7/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "Student.h"
#import "Assignment.h"

#import "GSPNewAssignmentViewController.h"

@interface GSPAssignmentsViewController : UITableViewController
@property Course *course;
@property NSMutableArray *assignments;
@end
