#import <Cordova/CDVPlugin.h>

@interface LaunchMyApp : CDVPlugin

@property (nonatomic, strong) NSURL* url;
@property (nonatomic, assign) BOOL pageLoaded;

@end

