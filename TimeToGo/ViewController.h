//
//  ViewController.h
//  TimeToGo
//
//  Created by Mikołaj Stępniewski on 09.12.2016.
//  Copyright © 2016 Mikołaj Stępniewski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
}

- (IBAction)valueChangedElo:(id)sender;
- (IBAction)travelTimeChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblFinalTime;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeRemaining;
@property NSDate *finalTime;
@property NSDate *timeRemaining;
@property NSDate *currentTime;
@property NSDate *leaveTime;
@property (strong, nonatomic) IBOutlet UIDatePicker *dpDeadline;
@property (strong, nonatomic) IBOutlet UIDatePicker *dpTravelTime;
@end

