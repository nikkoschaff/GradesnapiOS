//
//  GSPAnswerKeyViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GSPAnswerKeyCell.h"
#import "Course.h"
#import "Assignment.h"
#import "GSPSectionHeaderView.h"

@interface GSPNewAnswerKeyViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, SectionHeaderViewDelegate>
@property NSString *answers;
@property UIViewController *sourceController;
@property NSMutableArray *answerCells;
-(IBAction)addQuestion:(id)sender;
@end
