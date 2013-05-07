//
//  MFViewController.h
//  sqlitesearch
//
//  Created by Matteo Gavagnin on 24/04/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface MFViewController : UIViewController <UITextViewDelegate>

@property (nonatomic) sqlite3 *contactDB;
- (IBAction)returnedFromWiki:(UIStoryboardSegue *)segue;
- (void)presentWikiViewWithSentence:(NSString *)sentence;
@end
