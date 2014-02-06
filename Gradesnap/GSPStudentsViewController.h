//
//  GSPStudentsViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "Student.h"

@interface GSPStudentsViewController : UITableViewController
@property Course *course;
@property NSMutableArray *students;
@end
