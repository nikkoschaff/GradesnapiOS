//
//  GSPNewAssignmentViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assignment.h"
#import "Course.h"

@interface GSPNewAssignmentViewController : UIViewController
@property Course *course;
@property Assignment *assignment;
@end
