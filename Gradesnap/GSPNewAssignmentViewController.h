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
#import "GSPNewAnswerKeyViewController.h"

@interface GSPNewAssignmentViewController : UIViewController <UITextFieldDelegate>
@property Course *course;
@property Assignment *assignment;
@property NSString *answers;
@end
