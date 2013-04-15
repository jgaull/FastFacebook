//
//  ViewController.m
//  FastTweet
//
//  Created by Jonathan Gaull on 4/14/13.
//  Copyright (c) 2013 OneHeadedLlama. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self showTweetView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showTweetView {
    //NSLog(@"Presented view controller: %@", self.presentedViewController.class);
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
            [self dismissTweetView];
        };
    }
    
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

- (void)dismissTweetView {
    [self showTweetView];
}

- (void)regainFocus {
    [self showTweetView];
}

@end
