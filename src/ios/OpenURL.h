#import "CDVPlugin.h"

@interface OpenURL : CDVPlugin

@property (nonatomic, strong) NSURL* url;
@property (nonatomic, assign) BOOL pageLoaded;

@end

