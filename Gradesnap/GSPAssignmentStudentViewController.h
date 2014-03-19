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

#import <MobileCoreServices/MobileCoreServices.h>

@interface GSPAssignmentStudentViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property AssignmentStudent *assignmentStudent;
@property BOOL newMedia;
- (IBAction)useCamera:(id)sender;
//- (IBAction)useCameraRoll:(id)sender;
-(IBAction)gradeButtonPressed:(id)sender;
@end
