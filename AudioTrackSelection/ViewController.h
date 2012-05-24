//
//  ViewController.h
//  AudioTrackSelection
//
//  Created by Richard Fliam on 5/24/12.
//  Copyright (c) 2012 Comcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic, retain) AVPlayerItem *playerItem;
@property (strong, nonatomic, retain) AVPlayer *player;
@property (strong, nonatomic) PlayerView* playerView;

@end
