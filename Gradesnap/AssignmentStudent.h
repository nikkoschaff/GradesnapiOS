//
//  AssignmentStudent.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Assignment, Student;

@interface AssignmentStudent : NSManagedObject

@property (nonatomic, retain) NSNumber * grade;
@property (nonatomic, retain) NSString * answers;
@property (nonatomic, retain) Assignment *assignment;
@property (nonatomic, retain) Student *student;

@end
