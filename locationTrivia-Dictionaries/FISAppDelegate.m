//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *) location toLength:(NSUInteger)length {
    NSUInteger maxLength = [location[@"name"] length];
    if (length > maxLength) {length = maxLength;}
    NSString *truncatedName = [location[@"name"] substringToIndex:length];
    return truncatedName;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)lattitude longitude:(CGFloat)longitude { 
    NSDictionary *locationDict = @{@"name"      : name          ,
                                   @"latitude"  : @(lattitude)  ,
                                   @"longitude" : @(longitude)
                                   };
    NSLog(@"%@",locationDict);

    
 return locationDict;
 }
 
- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationsMutable = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<locations.count; i++){
        [locationsMutable addObject:[locations[i] objectForKey:@"name"]];
    }
    NSArray *locationNames = [NSArray arrayWithArray:locationsMutable];
 return locationNames   ;
 }

- (bool)dictionaryIsValidLocation:(NSDictionary *)arguement {
    
    NSArray *testing = [arguement allKeys];
    bool isItGood = ([testing containsObject:@"name"] &&
                     [testing containsObject:@"longitude"] &&
                     [testing containsObject:@"latitude"] &&
                     (testing.count == 3)
    );
    NSLog(@"%u",isItGood);
    
 return isItGood;
 }


- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
//    NSDictionary *theResult = @{@"":@""};
    NSInteger rememberInteger = 100;
    for (NSInteger i=0; i<locations.count; i++){
        if([locations[i] objectForKey:@"name"] == name){
            rememberInteger = i;
            //[theResult dictionaryWithDictionary:locations[i]];
        }
    }
    NSDictionary *testingGG = @{@"":@""};
    NSMutableDictionary *blankDict = [[NSMutableDictionary alloc] init];
    if(rememberInteger == 100) {
        testingGG = blankDict;
        return nil;
    } else {
        testingGG = [NSDictionary dictionaryWithDictionary:locations[rememberInteger]];
    }
 return testingGG;
}

@end
