//
//  ViewController.m
//  AudioTrackSelection
//
//  Created by Richard Fliam on 5/24/12.
//  Copyright (c) 2012 Comcast. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize playerItem;
@synthesize player;
@synthesize playerView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/resources/http-streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"];
    self.playerItem = [AVPlayerItem playerItemWithURL:url];
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
	self.player = [AVPlayer playerWithPlayerItem:playerItem];
    self.playerView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
    [self.view addSubview:playerView];
    [playerView setPlayer:player];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        NSArray* tracks = [playerItem tracks];        
        for (AVPlayerItemTrack *track in tracks) {
            NSLog(@"Track Lang: %@", [track.assetTrack languageCode]);
        }
        NSLog(@"Lang?: %@", playerItem.accessLog);
        player.closedCaptionDisplayEnabled = YES;
        [player play];
    }
}
@end
