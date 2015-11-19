//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                     toLength:(NSUInteger)length {
        
    NSString *locationName = [location objectForKey:@"name"];
    
    NSString *truncatedString = @"";
    
    NSInteger stringLength = [locationName length];
    
    if (length <= stringLength) {
        truncatedString = [locationName substringToIndex:length];
    } else {
        truncatedString = locationName;
    }
    
    
    return truncatedString;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(CGFloat)latitude
                                     longitude:(CGFloat)longitude {
    
    NSMutableDictionary *locationsDictionary = [[NSMutableDictionary alloc]init];
    
    NSNumber *latitudeValue = @(latitude);
    NSNumber *longitudeValue = @(longitude);
    
    [locationsDictionary setObject:name forKey:@"name"];
    [locationsDictionary setObject:latitudeValue forKey:@"latitude"];
    [locationsDictionary setObject:longitudeValue forKey:@"longitude"];
    
    return locationsDictionary;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *locationNames = [[NSMutableArray alloc]init];
    
    NSInteger locationsLength = [locations count];
    
    for (NSUInteger i = 0; i < locationsLength; i++) {
        [locationNames addObject:locations[i][@"name"]];
    }
    
    return locationNames;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    BOOL validLocation = NO;
    
    NSInteger dictionaryEntries = [dictionary count];
    
    for (NSUInteger i = 0; i < dictionaryEntries; i++) {
        
        if (dictionaryEntries == 3) {
            if ([[dictionary allKeys] containsObject:@"name"] && [[dictionary allKeys] containsObject:@"latitude"] && [[dictionary allKeys] containsObject:@"longitude"]) {
                validLocation = YES;
            } else {
                validLocation = NO;
            }
        } else {
            validLocation = NO;
        }
    }
    
    return validLocation;
}

-(NSDictionary *)locationNamed:(NSString *)name
                   inLocations:(NSArray *)locations {
    
    
    for (NSDictionary *location in locations) {
        NSString *locationName = location[@"name"];
        if ([locationName isEqualToString:name]) {
            return location;
        }
    }
    
    return nil;

}

@end
