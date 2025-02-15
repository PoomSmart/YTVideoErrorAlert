#import <UIKit/UIPasteboard.h>
#import <YouTubeHeader/YTAlertView.h>

static void displayError(NSError *error) {
    NSString *errorDescription = [error debugDescription];
    YTAlertView *alertView = [%c(YTAlertView) confirmationDialogWithAction:^{
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = errorDescription;
    } actionTitle:@"Copy"];
    alertView.title = @"Error";
    alertView.subtitle = errorDescription;
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
