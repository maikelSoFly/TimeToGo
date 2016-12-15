//
//  Car.m
//  TimeToGo
//
//  Created by Mikołaj Stępniewski on 09.12.2016.
//  Copyright © 2016 Mikołaj Stępniewski. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)goGoGo{
    NSLog(@"auto to %@ %i", _name, 888);
}

-(id)initWithName:(NSString*)name andMilage:(int)przebieg {
    self.name = name;
    return self;
}

@end
