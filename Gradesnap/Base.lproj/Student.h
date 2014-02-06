//
//  Student.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/6/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AssignmentStudent, Course;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *assignmentStudents;
@property (nonatomic, retain) Course *course;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addAssignmentStudentsObject:(AssignmentStudent *)value;
- (void)removeAssignmentStudentsObject:(AssignmentStudent *)value;
- (void)addAssignmentStudents:(NSSet *)values;
- (void)removeAssignmentStudents:(NSSet *)values;

@end
