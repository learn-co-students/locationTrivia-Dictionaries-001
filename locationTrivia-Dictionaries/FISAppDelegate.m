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

- (NSString *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    return nil;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    return nil;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    return nil;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    return nil;
}

@end
