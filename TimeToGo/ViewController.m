//
//  ViewController.m
//  TimeToGo
//
//  Created by Mikołaj Stępniewski on 09.12.2016.
//  Copyright © 2016 Mikołaj Stępniewski. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_dpDeadline setValue:[UIColor whiteColor] forKey:@"textColor"];
    [_dpTravelTime setValue:[UIColor whiteColor] forKey:@"textColor"];
    [_lblTimeRemaining setText:@""];
   
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setHour:0];
    [components setMinute:1];
    NSDate *date = [calendar dateFromComponents:components];
    
    [_dpTravelTime setDate:date animated:true];
    
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH mm"];
    [self calculateFinalTime];
    [_lblFinalTime setText:[format stringFromDate:_finalTime]];
    
    NSTimer *timerCounter = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimeRemaining) userInfo:nil repeats: YES]; //make repeats YES
    
    [_dpDeadline setMinimumDate:[NSDate date]];
}

-(void)updateTimeRemaining {

    NSTimeInterval diff = [_finalTime timeIntervalSinceDate:[NSDate date]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"ss"];

    diff = diff - [[formatter stringFromDate:_finalTime] integerValue];
    
    NSInteger hours = (long)diff / 3600;
    NSInteger minutes = (long)diff / 60 - hours * 60;
    NSInteger seconds = (long)diff - hours * 3600 - minutes * 60;
    
    NSString *timeRemaining = [NSString stringWithFormat:@"%li h %li min %li sec", hours, minutes, seconds];
    
    [_lblTimeRemaining setText:timeRemaining];
    
    if(diff <= 0) [_lblTimeRemaining setText:@"•"];
    
    if (diff < 180) {
        [_lblTimeRemaining setTextColor:[UIColor redColor]];
        [self animation:_lblTimeRemaining];
    }
    else [_lblTimeRemaining setTextColor:[UIColor whiteColor]];
    
}

- (void)animation:(UILabel*)sender {
    [UIView animateWithDuration:.1
                     animations:^{
                         [sender setAlpha:0.3];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:.1
                                          animations:^{
                                              [sender setAlpha:1.0];
                                          }
                                          completion:^(BOOL finished){}
                                          ];
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChangedElo:(id)sender {
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH mm"];
    [self calculateFinalTime];
    [_lblFinalTime setText:[format stringFromDate:_finalTime]];
}

- (IBAction)travelTimeChanged:(id)sender {
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH mm"];
    [self calculateFinalTime];
    [_lblFinalTime setText:[format stringFromDate:_finalTime]];
}

- (void)calculateFinalTime {
    NSDateFormatter* formatHours = [[NSDateFormatter alloc] init];
    NSDateFormatter* formatMinutes= [[NSDateFormatter alloc] init];
    [formatMinutes setDateFormat:@"mm"];
    [formatHours setDateFormat:@"HH"];
    NSInteger minutes = [[formatMinutes stringFromDate:_dpTravelTime.date] integerValue];
    NSInteger hours = [[formatHours stringFromDate:_dpTravelTime.date] integerValue];
    _finalTime = [_dpDeadline.date dateByAddingTimeInterval:-(3600*hours+60*minutes)];
}

@end
