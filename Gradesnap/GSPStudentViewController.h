//
//  GSPStudentViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/7/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Course.h"

@interface GSPStudentViewController : UIViewController
@property Student *student;
@property Course *course;
@end
