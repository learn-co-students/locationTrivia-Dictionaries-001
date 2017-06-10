//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *) stringByTruncatingNameOfLocation: (NSDictionary *)location toLength: (NSUInteger )length {
    NSString *nameOfPlace = location[@"name"];
    NSUInteger lenOfString = nameOfPlace.length;
    
    if (lenOfString >= length) {
        return [nameOfPlace substringToIndex:length];
    }
    else {
        return nameOfPlace;
    }
    
}

- (NSDictionary *) dictionaryForLocationWithName: (NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    //NSNumber *lat = [NSNumber numberWithFloat:latitude];
    //NSNumber *lon = [NSNumber numberWithFloat:longitude];
    
    //NSDictionary *newDict = @{@"latitude":lat,@"longitude":lon,@"name":name};
    //NSLog(@"%@", newDict);
    //return newDict;
    
    CGFloat empireStateLat  = 23.432;
    CGFloat empireStateLng  = -34.34;
    
    
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    //[mDict setObject:name forKey:@"name"];
    //[mDict setObject:lon forKey:@"longitude"];
    //[mDict setObject:lat forKey:@"latitude"];
    
    
    
    
    
    mDict[@"name"] = name;
    mDict[@"longitude"] = @(empireStateLng);
    mDict[@"latitude"] = @(empireStateLat);
    
    NSDictionary *newDict = [mDict mutableCopy];
    NSLog(@"%@", newDict);
    return newDict;
    
}

- (NSArray *) namesOfLocations:(NSArray *)locations {
    //NSLog(@"%@", locations);
    //NSLog(@"%@", locations[0][@"name"]);
    NSMutableArray *mArrayOfLocations = [[NSMutableArray alloc] init];
    NSUInteger numLocations = locations.count;
    for (NSUInteger i = 0; i < numLocations; i++) {
        [mArrayOfLocations addObject:locations[i][@"name"]];
    }
    
    NSArray *arrayofLocations = [mArrayOfLocations mutableCopy];
    return arrayofLocations;
    
    
}

- (BOOL ) dictionaryIsValidLocation: (NSDictionary *)dictionary {
    BOOL isCorrect = NO;
    
    NSArray *allKeys = [dictionary allKeys];
    NSUInteger arrayLength = allKeys.count;
    
    if (arrayLength == 3 &&[allKeys containsObject:@"name"] && [allKeys containsObject:@"latitude"] && [allKeys containsObject:@"longitude"]) {
        isCorrect = YES;
    }
    
    return isCorrect;
    
}

- (NSDictionary *) locationNamed: (NSString *)name inLocations: (NSArray *)locations {
    //NSLog(@"%@", locations);
    //NSLog(@"%@", locations[0]);
    //NSLog(@"%@", locations[0][@"name"]);
    
    //NSLog(@"%@", name);
    
    NSUInteger lenarray = locations.count;
    
    for (NSUInteger i= 0; i < lenarray; i++) {
        if ([name isEqualToString:locations[i][@"name"]]) {
            return locations[i];
        }
    }
    
    return nil;
}

@end
