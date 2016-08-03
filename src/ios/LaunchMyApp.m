/*
 Customized version of CDVHandleOpenURL
 */

#import "LaunchMyApp.h"

@implementation LaunchMyApp

- (void)pluginInitialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationLaunchedWithUrl:) name:CDVPluginHandleOpenURLNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationPageDidLoad:) name:CDVPageDidLoadNotification object:nil];
}

- (void)applicationLaunchedWithUrl:(NSNotification*)notification
{
    NSURL *url = [notification object];
    self.url = url;
    
    // warm-start handler
    if (self.pageLoaded) {
        [self processOpenUrl:self.url pageLoaded:YES];
        self.url = nil;
    }
}

- (void)applicationPageDidLoad:(NSNotification*)notification
{
    // cold-start handler
    
    self.pageLoaded = YES;

    if (self.url) {
        [self processOpenUrl:self.url pageLoaded:YES];
        self.url = nil;
    }
}

- (void)processOpenUrl:(NSURL*)url pageLoaded:(BOOL)pageLoaded
{
    if(url && pageLoaded){
        NSString* jsString = [NSString stringWithFormat:@"window.openURL=\"%@\";", url];
        if ([self.webView respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
            // Cordova-iOS pre-4
            [self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:jsString waitUntilDone:NO];
        } else {
            // Cordova-iOS 4+
            [self.webView performSelectorOnMainThread:@selector(evaluateJavaScript:completionHandler:) withObject:jsString waitUntilDone:NO];
        }
    }
}

@end