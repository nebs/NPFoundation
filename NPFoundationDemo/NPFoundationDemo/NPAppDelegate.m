//
//  NPAppDelegate.m
//  NPFoundationDemo
//
//  Created by Nebojsa Petrovic on 6/9/13.
//
//

#import "NPAppDelegate.h"
#import "NPLinkedList.h"

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
