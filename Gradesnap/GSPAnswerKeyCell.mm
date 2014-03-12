//
//  GSPAnswerKeyCell.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPAnswerKeyCell.h"

@implementation GSPAnswerKeyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected)
    {
//        NSLog(@"Selected->Unselected");
        [self setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
//        NSLog(@"Unelected->Selected");
        [self setBackgroundColor:[UIColor blueColor]];

    }
}

@end
