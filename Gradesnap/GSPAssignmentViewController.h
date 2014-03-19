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


@interface GSPAssignmentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property Assignment *assignment;
@property Course *course;

@end
