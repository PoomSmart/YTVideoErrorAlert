#import <YouTubeHeader/YTAlertView.h>

static void displayError(NSError *error) {
    YTAlertView *alertView = [%c(YTAlertView) infoDialog];
    alertView.title = @"Error";
    alertView.subtitle = [error debugDescription];
    [alertView show];
}

%hook YTMainAppVideoPlayerOverlayViewController

- (void)handleError:(NSError *)error {
    %orig;
    displayError(error);
}

%end

%hook YTReelErrorLogger

- (void)logClientError:(NSError *)error {
    %orig;
    displayError(error);
}

%end
