//
//  GSPNewCourseViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPNewCourseViewController.h"

@interface GSPNewCourseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation GSPNewCourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    
    if (self.textField.text.length > 0) {
        self.course = [Course new];
        self.course.name = self.textField.text;
        
        // TODO save to DB
//        NSManagedObjectContext *context = [self managedObjectContext];
//        FailedBankInfo *failedBankInfo = [NSEntityDescription
//                                          insertNewObjectForEntityForName:@"FailedBankInfo"
//                                          inManagedObjectContext:context];
//        failedBankInfo.name = @"Test Bank";
//        failedBankInfo.city = @"Testville";
//        failedBankInfo.state = @"Testland";
//        FailedBankDetails *failedBankDetails = [NSEntityDescription
//                                                insertNewObjectForEntityForName:@"FailedBankDetails"
//                                                inManagedObjectContext:context];
//        failedBankDetails.closeDate = [NSDate date];
//        failedBankDetails.updateDate = [NSDate date];
//        failedBankDetails.zip = [NSNumber numberWithInt:12345];
//        failedBankDetails.info = failedBankInfo;
//        failedBankInfo.details = failedBankDetails;
//        NSError *error;
//        if (![context save:&error]) {
//            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//        }
//        
//        
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription
//                                       entityForName:@"FailedBankInfo" inManagedObjectContext:context];
//        [fetchRequest setEntity:entity];
//        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//        for (FailedBankInfo *info in fetchedObjects) {
//            NSLog(@"Name: %@",info.name);
//            FailedBankDetails *details = info.details;
//            NSLog(@"Zip: %@", details.zip);
//        }

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
