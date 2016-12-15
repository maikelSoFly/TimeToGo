//
//  Car.h
//  TimeToGo
//
//  Created by Mikołaj Stępniewski on 09.12.2016.
//  Copyright © 2016 Mikołaj Stępniewski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
    
}

@property (nonatomic, strong) NSString* name;
-(void)goGoGo;
-(id)initWithName:(NSString*)name andMilage:(int)przebieg;

@end

