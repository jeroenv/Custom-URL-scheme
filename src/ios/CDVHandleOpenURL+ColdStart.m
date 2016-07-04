
#import "CDVHandleOpenURL+ColdStart.h"

@implementation CDVHandleOpenURL (ColdStart)

- (void)processOpenUrl:(NSURL*)url pageLoaded:(BOOL)pageLoaded
{
    /*if (!pageLoaded) {
        // query the webview for readystate
        NSString* readyState = [self.webView stringByEvaluatingJavaScriptFromString:@"document.readyState"];
        pageLoaded = [readyState isEqualToString:@"loaded"] || [readyState isEqualToString:@"complete"];
    }*/


    
    if (pageLoaded) {
        // calls into javascript global function 'handleOpenURL'
        NSString* jsString = [NSString stringWithFormat:@"if (typeof handleOpenURL === 'function') { handleOpenURL(\"%@\");} else { window._savedOpenURL = \"%@\"; }", url, url];
        [self.webView stringByEvaluatingJavaScriptFromString:jsString];
        
    } else {
    	NSString* jsString = [NSString stringWithFormat:@"window._savedOpenURL = \"%@\";", url];
        [self.webView stringByEvaluatingJavaScriptFromString:jsString];

        // save for when page has loaded
        self.url = url;
    }
}


@end