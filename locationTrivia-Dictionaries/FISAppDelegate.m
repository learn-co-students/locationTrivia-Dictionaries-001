//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *shortenLocationName = @"";
    if ([location[@"name"] length]<length) {
        shortenLocationName = location[@"name"];
    }
    else {
        shortenLocationName = [[location valueForKey:@"name"] substringToIndex:length];
    }
    return shortenLocationName;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *dictionaryWithNameLatLong
    = @{@"name":name,
        @"latitude":@(latitude),
        @"longitude":@(longitude)};
    return dictionaryWithNameLatLong;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *arrayOfLocations = [[NSMutableArray alloc]init];
    for (NSDictionary *dictionaryOfLocations in locations) {
        [arrayOfLocations addObject:dictionaryOfLocations[@"name"]];
    }
    return arrayOfLocations;
}

- (BOOL) dictionaryIsValidLocation:(NSDictionary *)location {
    if (!([location allKeys].count ==3)){
        return NO;
    }
    for (NSString *key in location) {
        if (![key isEqualToString: @"name"]&&![key isEqualToString: @"latitude"]&&![key isEqualToString: @"longitude"]) {
            return NO;
        }
    }
    return YES;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSDictionary *matchingNameDic = @{};
    for (NSDictionary *locationInfo in locations) {
        if ([locationInfo[@"name"] isEqualToString:name]) {
            matchingNameDic=locationInfo;
        }
    }
    return matchingNameDic;
}

/** 
 
 *  Write your method implementations here.
 
 */

@end
