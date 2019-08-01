//
//  ViewController.m
//  fetcher
//
//  Created by Tony Lu on 7/28/19.
//  Copyright © 2019 Tony Lu. All rights reserved.
//

#import "ViewController.h"
#import "GTMSessionFetcher.h"
#import "GTMSessionFetcherService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)download:(id)sender {
  NSString *destFileName =
      [NSString stringWithFormat:@"testOutOfProcessFetchToFile %@", [NSDate date]];
  NSString *destFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:destFileName];
  NSURL *destFileURL = [NSURL fileURLWithPath:destFilePath];
  GTMSessionFetcher *fetcher = [GTMSessionFetcher fetcherWithURLString:@"https://github.com/google/protobuf/archive/09745575a923640154bcf307fba8aedff47f240a.tar.gz"];
  fetcher.destinationFileURL = destFileURL;
  fetcher.useBackgroundSession = YES;
  [fetcher beginFetchWithCompletionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
    NSLog(@"%@", data);
  }];
  
}


@end
