//
//  ELTCalculatorBrain.h
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
  unknownMode   = -99,
  addMode       = 100,
  subtractMode  = 101,
  multiplyMode  = 102,
  divideMode    = 103
} CalcMode;

@interface ELTCalculatorBrain : NSObject

-(void) pushArgument:(double)argument;
-(double) popArgument;
-(NSMutableArray *) currentArguments;
-(void) clear;

//-(double) add;
//-(double) subtract;
//-(double) multiply;
//-(double) divide;

- (double)performCalcWithMode:(CalcMode)calcMode;
@end
