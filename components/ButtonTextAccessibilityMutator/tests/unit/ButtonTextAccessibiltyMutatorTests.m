/*
 Copyright 2016-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <XCTest/XCTest.h>

#import "MaterialButtonTextAccessibilityMutator.h"
#import "MaterialButtons.h"

// A value greater than the largest value created by combining normal values of UIControlState.
// This is a complete hack, but UIControlState doesn't expose anything useful here.
// This assumes that UIControlState is actually a set of bitfields and ignores application-specific
// values.
static const UIControlState kNumUIControlStates = 2 * UIControlStateSelected - 1;

@interface ButtonTextAccessibilityMutatorTests : XCTestCase
@end

@implementation ButtonTextAccessibilityMutatorTests

- (void)testMutateChangesTextColor {
  for (NSUInteger controlState = 0; controlState < kNumUIControlStates; ++controlState) {
    // Given
    MDCButtonTextAccessibilityMutator *mutator = [[MDCButtonTextAccessibilityMutator alloc] init];
    MDCButton *button = [[MDCButton alloc] init];
    UIColor *color = [UIColor whiteColor];
    // Making the background color the same as the title color.
    [button setBackgroundColor:color forState:(UIControlState)controlState];
    
    XCTAssertEqualObjects([button backgroundColorForState:controlState], color);
    [button setTitleColor:color forState:(UIControlState)controlState];
    XCTAssertEqualObjects([button backgroundColorForState:controlState], color);
    
    // When
    [mutator mutate:button];
    
    // Then
    XCTAssertNotEqualObjects([button titleColorForState:controlState], color, @"for control state:%i ", controlState);
  }
}

@end
