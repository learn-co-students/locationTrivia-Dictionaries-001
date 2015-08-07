//
//  FISAppDelegate.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

//shortenedNameOfLocation:toLength: that takes two arguments, an NSDictionary called location and an NSInteger called length; and returns an NSString.
-(NSString *)shortenedNameOfLocation:(NSDictionary *)location toLength:(NSInteger)length{
    
// should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
//Hint: Look up the substringToIndex: method on NSString.
    NSString *locationName = location[@"name"];

    
    
    
    if (length > 0){
        NSString *shortenedName = [locationName substringToIndex:length];
        return shortenedName;
    }
    
        
    return locationName;
}
//
//dictionaryForLocationWithName:latitude:longitude: that takes three arguments, an NSString called name, and two NSNumbers called latitude and longitude; and returns an NSDictionary.
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude{
    
//    dictionaryForLocationWithName:latitude:longitude: should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
    NSMutableDictionary *format = [[NSMutableDictionary alloc] init];
    format[@"name"] = name;
    format[@"latitude"] = latitude;
    format[@"longitude"] = longitude;
    
    NSDictionary *location = [format copy];
    return location;
}
//
//namesOfLocations: that takes one NSArray argument called locations and returns an NSArray.
- (NSArray *)namesOfLocations:(NSArray *)locations{
//    should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.
    NSString *empireStateName = @"Empire State Building";
    NSNumber *empireStateLat  = @23.432;
    NSNumber *empireStateLng  = @-34.34;
    
    NSDictionary *location0 = @{ @"name"      : empireStateName,
                   @"latitude"  : empireStateLat ,
                   @"longitude" : empireStateLng
                   };
    
    NSDictionary *location1 = @{ @"name"      : @"The Flatiron School",
                   @"latitude"  : @34.432 ,
                   @"longitude" : @-23.67
                   };
    
    NSDictionary *location2 = @{ @"name"      : @"Statue Of Liberty",
                   @"latitude"  : @78.34 ,
                   @"longitude" : @92.42
                   };
    NSMutableArray *names = [[NSMutableArray alloc]init];
    [names addObject:location0[@"name"]];
    [names addObject:location1[@"name"]];
    [names addObject:location2[@"name"]];
    
    NSArray *final = [names copy];
    return final;
}

//dictionaryHasValidLocation: that takes one NSDictionary argument and returns a BOOL.
-(BOOL)dictionaryHasValidLocation:(NSDictionary *)dictionary{
//    should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
    
    //count the number of keys in the dictionary
    NSArray *allTheKeys = [dictionary allKeys];
    if ([allTheKeys count] == 3){
        if ([allTheKeys containsObject:@"name"]){
            return YES;
        }
    }

    //if there are at least 3 keys then check if there is a name key and return YES
    //otherwise return NO
    return NO;
}
//
//retrieveLocationByName:inLocations: that takes two arguments, an NSString called name and an NSArray called locations; and returns an NSDictionary.
-(NSDictionary *)retrieveLocationByName:(NSString *)name inLocations:(NSArray *)locations{
    
    for (NSDictionary *location in locations) {
        NSString *locationName = location[@"name"];
        if ([locationName isEqualToString:name]) {
            return location;
        }
    }
    return nil;

}
@end
