//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    
    NSString *locationName = [location objectForKey:@"name"];
    
    if ([locationName length] < length) {
        return locationName;
    } else {
        locationName = [locationName substringToIndex:length];
        return locationName;
    }
    
    
}
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSMutableDictionary *collectNameLocation = [[NSMutableDictionary alloc] init];
    [collectNameLocation setObject:name forKey:@"name"];
    [collectNameLocation setObject:[NSNumber numberWithDouble:latitude] forKey:@"latitude"];
    [collectNameLocation setObject:[NSNumber numberWithDouble:longitude] forKey:@"longitude"];
    
    NSDictionary *dictionaryOfNameLocation = [collectNameLocation copy];
    
    return dictionaryOfNameLocation;
}
-(NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *collectNames = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < locations.count; i++) {
        NSString *name = [[locations objectAtIndex:i] valueForKey:@"name"];
        [collectNames addObject:name];
    
    }
    
    NSArray *finalListOfNames = [collectNames copy];
    NSLog(@"%@",finalListOfNames);
    NSUInteger aNumber = [finalListOfNames count];
    NSLog(@"%li",aNumber);
    return finalListOfNames;
    
}
-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    BOOL testValidity = NO;
    
    if ([[dictionary allKeys] count] == 3) {
        if (
            [[dictionary allKeys] containsObject:@"name"] &&
            [[dictionary allKeys] containsObject:@"latitude"] &&
            [[dictionary allKeys] containsObject:@"longitude"]
            )
        {
            testValidity = YES;
        }
    }
    
    return testValidity;
}
-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    NSMutableArray *collectLocationNamed = [[NSMutableArray alloc] init];
    NSDictionary *sendLocationNamed;
    BOOL foundTheName = NO;
    
    for (NSUInteger i = 0; i < locations.count; i++) {
        
        if (name == [[locations objectAtIndex:i] valueForKey:@"name"]) {
            collectLocationNamed = [locations objectAtIndex:i];
            foundTheName = YES;
        }
    }
    
    if (foundTheName == YES) {
        
        sendLocationNamed = [collectLocationNamed copy];
    } else {
        sendLocationNamed = nil;
    }
    
    return sendLocationNamed;
    
}

@end
