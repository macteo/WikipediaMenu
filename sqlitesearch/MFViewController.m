//
//  MFViewController.m
//  sqlitesearch
//
//  Created by Matteo Gavagnin on 24/04/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFViewController.h"
#import "MFBrowserViewController.h"

@interface MFViewController () {
    NSString *sentence;
}

@end

@implementation MFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentWikiViewWithSentence:(NSString *)selectedText{
    sentence = selectedText;
    [self performSegueWithIdentifier:@"presentWikiBrowser" sender:self];
}

//- (void)textViewDidChangeSelection:(UITextView *)textView{
//    NSString * selectedText = [textView.text substringWithRange:[textView selectedRange]];
//    
//    // TODO: when we will have the new database
//    // [selectedText lowercaseString];
//    BOOL found = [self findWord:selectedText];
//    
//    if(found){
//        // Present modal view with wikipedia formatted entry.
//        NSLog(@"Word found");
//        sentence = selectedText;
//        [self performSegueWithIdentifier:@"presentWikiBrowser" sender:self];
//    }
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"presentWikiBrowser"])
    {
        MFBrowserViewController *vc = [segue destinationViewController];
        [vc setSentence:sentence];
    }
}
-(IBAction)returnedFromWiki:(UIStoryboardSegue *)segue{
    
}

@end
