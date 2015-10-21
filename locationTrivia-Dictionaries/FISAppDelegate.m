//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)empireState toLength:(NSUInteger)length {

    NSString *name = empireState[@"name"];
    
    if ([name length] < length) {
        return name;
    }
    
    return [name substringToIndex:length];
}
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSDictionary *location = @{ @"name": name,
                                 @"longitude": @(longitude),
                                @"latitude": @(latitude) };
    
    return location;
}
-(NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for (NSDictionary *aLocation in locations) {
        [names addObject:aLocation[@"name"]];
    }
    
    return names;
}
-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    NSArray *allKeys = [dictionary allKeys];
    
    return ([allKeys containsObject:@"name"] && [allKeys containsObject:@"longitude"]
              && [allKeys containsObject:@"latitude"] && [allKeys count] == 3);
}
-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    NSPredicate *filterByName = [NSPredicate predicateWithFormat:@"name LIKE %@", name ];
    NSArray *filteredList = [locations filteredArrayUsingPredicate:filterByName];
    
    if (!filteredList || [filteredList count] == 0) {
        return nil;
    }
    
    return filteredList[0];
}


@end
