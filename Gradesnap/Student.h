//
//  Student.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *courses;
@property (nonatomic, retain) NSSet *assignmentStudents;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addCourseObject:(Course *)value;
- (void)removeCourseObject:(Course *)value;
- (void)addCourse:(NSSet *)values;
- (void)removeCourse:(NSSet *)values;

- (void)addAssignmentStudentObject:(NSManagedObject *)value;
- (void)removeAssignmentStudentObject:(NSManagedObject *)value;
- (void)addAssignmentStudent:(NSSet *)values;
- (void)removeAssignmentStudent:(NSSet *)values;

@end
