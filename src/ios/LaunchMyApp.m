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
   
    NSString* jsString = [NSString stringWithFormat:@"document.addEventListener('deviceready',function(){ if(typeof handleOpenURL === 'function'){ handleOpenURL(\"%@\"); }else{ window.openURL=\"%@\";}});", url, url];
    [self.webView stringByEvaluatingJavaScriptFromString:jsString];    
}

@end