//
//  InfractionsCalculatorTests.m
//  InfractionsCalculatorTests
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleReactor.h"
#import "Event.h"
#import "Server.h"
@interface InfractionsCalculatorTests : XCTestCase

@end

@implementation InfractionsCalculatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    
    Server *s = [[Server alloc] init];
    
    [s getInfractionsList];
    
}

@end
