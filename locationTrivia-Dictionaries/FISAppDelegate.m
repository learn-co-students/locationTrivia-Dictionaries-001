//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *) shortenedNameOfLocation:(NSDictionary*)location
                             toLength:(NSInteger)length{
    
    if (length < 0){
        NSString * str = location[@"name"];
        return str;
    }
    NSString * str = [location[@"name"] substringToIndex: length];

    
    return str;
}

-(NSDictionary*)dictionaryForLocationWithName:(NSString*)name
                                     latitude:(NSNumber *)latitude
                                    longitude:(NSNumber *)longitude{
    NSDictionary *dic = [[NSDictionary alloc]init];
    
    dic = @{@"name":name,
            @"latitude":latitude,
            @"longitude":longitude};
    
    return dic;
}

-(NSArray *)namesOfLocations:(NSArray*)locations{

    NSMutableArray * arr = [[NSMutableArray alloc] init];
    
    for (NSDictionary *key in locations){
        [arr addObject:key[@"name"]];
    }
    return arr;
}

-(BOOL)dictionaryHasValidLocation:(NSDictionary *)dic{
    NSArray * arr = [dic allKeys];

    
    BOOL a =[arr containsObject:@"name"];
    BOOL b =[arr containsObject:@"latitude"];
    BOOL c =[arr containsObject:@"longitude"];
    if (a && b && c){
        if([arr count] <= 3){
        return YES;
        }
    }
    return NO;
}

-(NSDictionary*)retrieveLocationByName:(NSString*)name
                           inLocations:(NSArray*)locations{
    NSDictionary * arr = [[NSDictionary alloc] init];
    
    for (NSDictionary *key in locations){
        if ([key[@"name"] isEqualToString:name]){
            arr = key;
            return arr;
        }
    }
    return nil;
}

@end
