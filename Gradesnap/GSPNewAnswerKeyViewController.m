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

    self.answerCells = [NSMutableArray new];
    for (int i = 0; i < 10; i++)
    {
        [self addQuestion:nil];
    }
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.answerCells count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GSPAnswerKeyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AnswerKeyCell" forIndexPath:indexPath];
    // TODO set details
    return cell;
}


-(IBAction)addQuestion:(id)sender
{
    // TODO add entire row instead of single box
    
    
    NSLog(@"Add question");
    NSMutableArray *answerRow = [NSMutableArray new];
    [answerRow addObject:[NSString stringWithFormat:@"%u",[self.answerCells count]-1]];
    [answerRow addObject:@"A"];
    [answerRow addObject:@"B"];
    [answerRow addObject:@"C"];
    [answerRow addObject:@"D"];
    [answerRow addObject:@"E"];
    [self.answerCells addObject:answerRow];
    [self.collectionView reloadData];
}

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
