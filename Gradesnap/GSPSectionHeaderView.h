//
//  GSPSectionHeaderView.h
//  Gradesnap
//
//  Created by Nikko Schaff on 3/3/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionHeaderViewDelegate <NSObject>
-(IBAction)deleteButtonPressed:(id)sender;
@end

@interface GSPSectionHeaderView : UICollectionReusableView
@property IBOutlet UILabel *questionNumberLabel;
@property IBOutlet UIButton *deleteButton;
@end
