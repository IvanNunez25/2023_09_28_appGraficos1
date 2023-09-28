//
//  _023_09_30_appGraficos1UITestsLaunchTests.m
//  2023_09_30_appGraficos1UITests
//
//  Created by Ivanovicx Nuñez on 28/09/23.
//

#import <XCTest/XCTest.h>

@interface _023_09_30_appGraficos1UITestsLaunchTests : XCTestCase

@end

@implementation _023_09_30_appGraficos1UITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
