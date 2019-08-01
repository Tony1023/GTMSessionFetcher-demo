//
//  AppDelegate.m
//  fetcher
//
//  Created by Tony Lu on 7/28/19.
//  Copyright © 2019 Tony Lu. All rights reserved.
//

#import "AppDelegate.h"
#import "GTMSessionFetcher.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application
      handleEventsForBackgroundURLSession:(NSString *)identifier
      completionHandler:(void (^)(void))completionHandler {
  // Application was re-launched on completing an out-of-process download.

  // Pass the URLSession info related to this re-launch to the fetcher class.
  [GTMSessionFetcher application:application
      handleEventsForBackgroundURLSession:identifier
                        completionHandler:completionHandler];

  // Get a fetcher related to this re-launch and re-hook up a completionHandler to it.
  GTMSessionFetcher *fetcher = [GTMSessionFetcher fetcherWithSessionIdentifier:identifier];
  NSURL *destinationFileURL = fetcher.destinationFileURL;
  fetcher.completionHandler = ^(NSData *data, NSError *error) {
    [self downloadCompletedToFile:destinationFileURL error:error];
  };
}

- (void)downloadCompletedToFile:(NSURL *)destinationFileURL error:(NSError *)error {
  NSLog(@"%@", destinationFileURL);
}

@end
