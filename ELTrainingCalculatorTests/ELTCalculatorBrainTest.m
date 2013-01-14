//
//  ELTCalculatorBrainTest.m
//  ELTrainingCalculator
//
//  Created by Mark Menard on 1/11/13.
//  Copyright (c) 2013 Mark Menard. All rights reserved.
//

#import "ELTCalculatorBrainTest.h"
#import "ELTCalculatorBrain.h"

@implementation ELTCalculatorBrainTest

-(void) setUp {
    brain = [[ELTCalculatorBrain alloc]init];
}

-(void) tearDown {
    brain = nil;
}

-(void) testPushPopArgument {
    [brain pushArgument:1.1];
    STAssertEquals([brain popArgument], 1.1, @"Wrong argument returned.");
}

-(void) testResultPusheOntoArgumentStack {
    [brain pushArgument:1.0];
    [brain pushArgument:2.0];
//    [brain add];
  [brain performCalcWithMode:addMode];
    STAssertEquals([brain popArgument], 3.0, @"Result should be pushed onto the argument stack.");
}

-(void) testAddition {
    [brain pushArgument:1.1];
    [brain pushArgument:2.0];
//    STAssertEquals([brain add], 3.1, @"1.1 + 2.0 should equal 3.1");
      STAssertEquals([brain performCalcWithMode:addMode], 3.1, @"1.1 + 2.0 should equal 3.1");
}

-(void) testSubtraction {
    [brain pushArgument:2.0];
    [brain pushArgument:1.0];
//    STAssertEquals([brain subtract], 1.0, @"2.0 - 1.0 should equal 1.0");
    STAssertEquals([brain performCalcWithMode:subtractMode], 1.0, @"2.0 - 1.0 should equal 1.0");
}

-(void) testMultiplication {
    [brain pushArgument:2.0];
    [brain pushArgument:3.0];
//    STAssertEquals([brain multiply], 6.0, @"2.0 x 3.0 should equal 6.0");
    STAssertEquals([brain performCalcWithMode:multiplyMode], 6.0, @"2.0 x 3.0 should equal 6.0");
}

-(void) testDivision {
    [brain pushArgument:6.0];
    [brain pushArgument:2.0];
//    STAssertEquals([brain divide], 3.0, @"6.0 / 2.0 should equal 3.0");
    STAssertEquals([brain performCalcWithMode:divideMode], 3.0, @"6.0 / 2.0 should equal 3.0");
}

-(void) testClear {
    [brain pushArgument:6.0];
    [brain pushArgument:2.0];
    [brain clear];
    STAssertTrue([[brain currentArguments] count] == 0, @"After a clear there should be no arguments on the stack.");
}


@end
