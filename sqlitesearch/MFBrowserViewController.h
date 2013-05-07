//
//  MFBrowserViewController.h
//  sqlitesearch
//
//  Created by Matteo Gavagnin on 24/04/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFBrowserViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;

@property NSString *sentence;

@end
