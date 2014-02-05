//
//  GSPDetailViewController.h
//  Gradesnap
//
//  Created by Nikko Schaff on 2/5/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
