//
//  ELTViewController.h
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELTViewController : UIViewController {
    BOOL userEnteringArgument;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *argumentDisplay;


- (IBAction)numberButtonPressed:(id)sender;
- (IBAction)enterPressed;
- (IBAction)clearPressed;

- (IBAction)functionButtonPressed:(id)sender;

@end
