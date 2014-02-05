//
//  Assignment.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Assignment : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSData * answers;
@property (nonatomic, retain) Course *course;
@property (nonatomic, retain) NSSet *assignmentStudents;
@end

@interface Assignment (CoreDataGeneratedAccessors)

- (void)addAssignmentStudentObject:(NSManagedObject *)value;
- (void)removeAssignmentStudentObject:(NSManagedObject *)value;
- (void)addAssignmentStudent:(NSSet *)values;
- (void)removeAssignmentStudent:(NSSet *)values;

@end
