//
//  PybVlcStreamPlayerHelper.m
//  
//
//  Created by Yanbing Peng on 10/02/16.
//
//
#import "PybVlcStreamPlayerHelper.h"
#import "PybVlcStreamPlayerViewController.h"

@interface PybVlcStreamPlayerHelper()
@end

@implementation PybVlcStreamPlayerHelper
-(void) openPlayerForStreamURL:(CDVInvokedUrlCommand *)command{
    CDVPluginResult *pluginResult = nil;

	// load the view
    self.overlay = [[PybVlcStreamPlayerViewController alloc] initWithNibName:@"PybVlcStreamPlayerViewController" bundle:nil];
    self.overlay.origem = self;


    NSString *urlString  = [command.arguments objectAtIndex:0];
    
    if(urlString != nil){
        PybVlcStreamPlayerViewController *vlcStreamPlayerViewController = [[PybVlcStreamPlayerViewController alloc] init];
        vlcStreamPlayerViewController.urlString = urlString;
        [self.viewController presentViewController:self.overlay animated:YES completion:nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Done"];
    }
    else
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
	    

}
@end