//
//  GSPMasterViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface GSPMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
