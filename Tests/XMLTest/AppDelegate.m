//
//  AppDelegate.m
//  XMLTest
//
//  Created by Nick Lockwood on 28/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "XMLDictionary.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSURL *URL = [[NSURL alloc] initWithString:@"http://www.ibiblio.org/xml/examples/shakespeare/all_well.xml"];
    NSURL *URL = [[NSURL alloc] initWithString:@"http://d.pr/f/eRWD+"];
    NSString *string = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"string:\n%@", string);
    
    [XMLDictionaryParser sharedInstance].includeRootNodeToDictionary = YES;
    [XMLDictionaryParser sharedInstance].collapseTextNodes = NO;
    [XMLDictionaryParser sharedInstance].stripEmptyNodes = NO;
    [XMLDictionaryParser sharedInstance].attributesMode = XMLDictionaryAttributesModePrefixed;
    [XMLDictionaryParser sharedInstance].nodeNameMode = XMLDictionaryNodeNameModeNever;
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:string];
    NSLog(@"dictionary:\n%@", xmlDoc);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
