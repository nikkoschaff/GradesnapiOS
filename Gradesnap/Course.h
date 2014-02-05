//
//  Course.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) NSSet *assignments;
@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addStudentObject:(NSManagedObject *)value;
- (void)removeStudentObject:(NSManagedObject *)value;
- (void)addStudent:(NSSet *)values;
- (void)removeStudent:(NSSet *)values;

- (void)addAssignmentObject:(NSManagedObject *)value;
- (void)removeAssignmentObject:(NSManagedObject *)value;
- (void)addAssignment:(NSSet *)values;
- (void)removeAssignment:(NSSet *)values;

@end
