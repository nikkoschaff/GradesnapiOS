//
//  GSPAnswerKeyViewController.m
//  Gradesnap
//
//  Created by Nikko Schaff on 2/12/14.
//  Copyright (c) 2014 Gradesnap. All rights reserved.
//

#import "GSPNewAnswerKeyViewController.h"

@interface GSPNewAnswerKeyViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation GSPNewAnswerKeyViewController

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
    
    // TODO set up sections

    self.answerCells = [NSMutableArray new];
    
    [self.collectionView setAllowsSelection:YES];
    
    for (int i = 0; i < 2; i++)
    {
        [self addQuestion:nil];
    }
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    return ((self.answerCells.count == 0) ? 0 : self.answerCells.count/5);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GSPAnswerKeyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AnswerKeyCell" forIndexPath:indexPath];
    [[cell letter] setText:[self.answerCells objectAtIndex:(indexPath.section*5+indexPath.row)]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    GSPSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                        withReuseIdentifier:@"AnswerKeyHeaderView"
                                                            forIndexPath:indexPath];
    
    headerView.questionNumberLabel.text = [[NSString alloc]initWithFormat:@"%li", indexPath.section + 1];
    return headerView;
}

#pragma mark UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO Get selection working properly
    NSLog(@"Item selected at %@ (%li => %li)",indexPath.description,(long)indexPath.section,(long)indexPath.row);
    [[self.collectionView cellForItemAtIndexPath:indexPath] setSelected:![self.collectionView cellForItemAtIndexPath:indexPath].selected];
}


#pragma mark Answer Key Control

-(IBAction)addQuestion:(id)sender
{
    [self.answerCells addObject:@"A"];
    [self.answerCells addObject:@"B"];
    [self.answerCells addObject:@"C"];
    [self.answerCells addObject:@"D"];
    [self.answerCells addObject:@"E"];
    [self.collectionView reloadData];
}

# pragma mark - Navigation

-(IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // TODO turn answers from collection to string

    NSMutableString *answersToReturn = [NSMutableString new];
    for (int i = 0; i < self.answerCells.count; i++)
    {
        for (int n = 0; n < 6; n++)
        {
            
        }
        [answersToReturn appendString:@","];
    }
    
    [answersToReturn deleteCharactersInRange:NSMakeRange(answersToReturn.length-1,0)];
    NSLog(@"Answers being set: %@",answersToReturn);
    self.answers = (NSString*)answersToReturn;
    
}

@end
