//
//  ViewController.h
//  instaEmail
//
//  Created by Sami Bajwa on 2/6/23.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
    NSArray* activities_;
    NSArray* feelings_;
}

@end

