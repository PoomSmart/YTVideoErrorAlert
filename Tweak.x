#import <YouTubeHeader/YTAlertView.h>

%hook YTMainAppVideoPlayerOverlayViewController

- (void)handleError:(NSError *)error {
    %orig;
    YTAlertView *alertView = [%c(YTAlertView) infoDialog];
    alertView.title = @"Error";
    alertView.subtitle = [error debugDescription];
    [alertView show];
}

%end
