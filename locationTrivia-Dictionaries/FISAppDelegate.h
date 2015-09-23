//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length;

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)lattitude longitude:(CGFloat)longitude;

- (NSArray *)namesOfLocations:(NSArray *)locations;

- (bool)dictionaryIsValidLocation:(NSDictionary *)arguement;

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations;

@end
