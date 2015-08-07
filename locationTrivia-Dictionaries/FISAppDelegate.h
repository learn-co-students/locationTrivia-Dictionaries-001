//
//  FISAppDelegate.h
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//
//shortenedNameOfLocation:toLength: that takes two arguments, an NSDictionary called location and an NSInteger called length; and returns an NSString.
-(NSString *)shortenedNameOfLocation:(NSDictionary *)location toLength:(NSInteger)length;
//
//dictionaryForLocationWithName:latitude:longitude: that takes three arguments, an NSString called name, and two NSNumbers called latitude and longitude; and returns an NSDictionary.
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;
//
//namesOfLocations: that takes one NSArray argument called locations and returns an NSArray.
- (NSArray *)namesOfLocations:(NSArray *)locations;

//dictionaryHasValidLocation: that takes one NSDictionary argument and returns a BOOL.
-(BOOL)dictionaryHasValidLocation:(NSDictionary *)dictionary;
//
//retrieveLocationByName:inLocations: that takes two arguments, an NSString called name and an NSArray called locations; and returns an NSDictionary.
-(NSDictionary *)retrieveLocationByName:(NSString *)name inLocations:(NSArray *)locations;

@end
