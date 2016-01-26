//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation: (NSDictionary *)location toLength: (NSUInteger )length {
    
    NSString *final = @"";
    
    for (NSString *item in location) {
        if ([item isEqualToString:@"name"]) {
        final = [final stringByAppendingString:[location[item] substringToIndex: MIN(length, 21)]];
        }
    }
    
    NSLog(@"%@", final);
    
    return final;
}

- (NSDictionary *)dictionaryForLocationWithName: (NSString *)name latitude: (CGFloat)latitude longitude:(CGFloat)longitude{
    
    NSNumber *nLatitude = @(latitude);
    NSNumber *nLongitude = @(longitude);
    
    NSDictionary *final = @{ @"name":name,
               @"latitude":nLatitude,
               @"longitude":nLongitude};
    
    return final;
}

- (NSArray *)namesOfLocations: (NSArray *)locations{

    NSMutableArray *final = [[NSMutableArray alloc]init];
    
    for (NSDictionary *place in locations) {
        for (NSString *location in place){
            if([location isEqualToString:@"name"]) {
                [final addObject:place[location]];
            }
        }
    }
    return final;
}

- (BOOL)dictionaryIsValidLocation: (NSDictionary *)dictionary{
    
    NSMutableArray *test = [[NSMutableArray alloc]init];
    
    NSUInteger one = 0;
    
    for (NSString *place in dictionary) {
        [test addObject:place];
    }
    if ([test containsObject: @"name"] && [test containsObject: @"latitude"] && [test containsObject: @"longitude"] && [test count] == 3) {
        one = 1;
    }
    
    BOOL oneEqualToOne = 1 == one;
    
    return oneEqualToOne;
}

- (NSDictionary *)locationNamed: (NSString *)name inLocations: (NSArray *)locations{
    
    NSMutableDictionary *final = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger i=0; i<[locations count];i++) {
        if ([locations[i] containsObject: name]) {
            [final addEntriesFromDictionary:locations[i]];
        }
    }
                                
                                    
    return final;
}

@end
