//
//  ViewController.m
//  instaEmail
//
//  Created by Sami Bajwa on 2/6/23.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *emailPicker;
@property (weak, nonatomic) IBOutlet UITextField *notesField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    activities_ = [[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working", @"thinking", @"crying" @"begging", @"leaving", @"shopping", @"hello worlding", nil];
    feelings_ = [[NSArray alloc] initWithObjects:@"awesome", @"sad", @"happy", @"ambivalent", @"naseous", @"psyched", @"confused", @"hopeful", @"anxious", @"confused", nil];
}

# pragma mark - PickerDatasource Protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [activities_ count];
    }
    else {
        return [feelings_ count];
    }
}


#pragma mark - PickerDelegate Protocol
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [activities_ objectAtIndex:row];
    }
    else {
        return [feelings_ objectAtIndex:row];
    }
    return nil;
}
- (IBAction)sendPressed:(id)sender {
    NSString *activity = [activities_ objectAtIndex: [_emailPicker selectedRowInComponent:0]];
    NSString *feeling = [feelings_ objectAtIndex: [_emailPicker selectedRowInComponent:1]];
    
    NSString* notes = [_notesField text];
    
    NSString* theMessage = [NSString stringWithFormat:@"I'm %@ and I'm feeling %@ about it! %@", activity, feeling, notes];
    NSLog(@"%@", theMessage);
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setToRecipients:[[NSArray alloc] initWithObjects:@"bajwasami309@gmail.com", nil]];
        [mc setSubject:@"Hello from instaEmail"];
        [mc setMessageBody:theMessage isHTML:NO];
        
        [self presentViewController:mc animated:YES completion:nil];
    }
    else {
        NSLog(@"Sorry you need to set up mail first");
    }
}

- (IBAction)doneEditing:(id)sender {
    
}


#pragma mark - MailComposer delegate method

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Dealloc is unnecessary here
//- (void)dealloc {
//    [activities_ release];
//    [feelings_ release];
//    [super dealloc];
//}

@end
