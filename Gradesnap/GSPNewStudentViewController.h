//
//  GSPNewStudentViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface GSPNewStudentViewController : UIViewController
@property (nonatomic) Student *student;
@property (nonatomic) Course *course;
@end
