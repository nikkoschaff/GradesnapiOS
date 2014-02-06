//
//  GSPCourseViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Course.h"

@interface GSPCourseViewController : UIViewController
@property (nonatomic) Course *course;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;


@end
