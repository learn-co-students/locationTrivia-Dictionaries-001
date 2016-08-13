//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *name = location[@"name"];
    if ([name length] < length) {
        return name;
    } else {
        NSString *shortName = [name substringToIndex:length];
        return shortName;
    }
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude {

    NSDictionary *location = @{ @"name" : name,
                                @"latitude" : @(latitude),
                                @"longitude" : @(longitude)
                                };
    return location;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [locations count]; i++) {
        [locationNames addObject:locations[i][@"name"]];
    }
    return locationNames;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *locationKeys = [dictionary allKeys];
    if ([locationKeys count] == 3 && [locationKeys containsObject:@"name"] && [locationKeys containsObject:@"latitude"] && [locationKeys containsObject:@"longitude"]){
        return YES;
    } else {
        return NO;
    }
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < [locations count]; i++) {
        if ([locations[i][@"name"] isEqualToString:name]) {
            location = locations[i];
        }
    }
    if ([[location allKeys] count] > 0) {
        return location;
    } else {
        return nil;
    }
}

@end
