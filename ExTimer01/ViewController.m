//
//  ViewController.m
//  ExTimer01
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController {
	NSTimer *timer;
	BOOL timerWorking;
}

- (void)tickDown:(NSTimer *)timer {
	self.datePicker.countDownDuration = self.datePicker.countDownDuration - 60;
	
	if(self.datePicker.countDownDuration <= 60) {
		NSLog(@"Done!");
		[self stopTimer];
	}
}

- (void)stopTimer {
	[self->timer invalidate];
	timer = nil;
	timerWorking = NO;
}

- (void)startTimer {
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tickDown:) userInfo:nil repeats:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)toggleTimer:(id)sender {
	NSString *title = timerWorking?@"start":@"stop";
	[sender setTitle:title forState:UIControlStateNormal];
	
	timerWorking = !timerWorking;
	
	if(timerWorking) {
		[self startTimer];
	} else {
		[self stopTimer];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





















