//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
-(NSString *) shortenedNameOfLocation:(NSDictionary*)location
                             toLength:(NSInteger)length;

-(NSDictionary*)dictionaryForLocationWithName:(NSString*)name
                                     latitude:(NSNumber *)latitude
                                    longitude:(NSNumber *)longitude;

-(NSArray *)namesOfLocations:(NSArray*)locations;

-(BOOL)dictionaryHasValidLocation:(NSDictionary *)dic;

-(NSDictionary*)retrieveLocationByName:(NSString*)name
                           inLocations:(NSArray*)locations;







@end
