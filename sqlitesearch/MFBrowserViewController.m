//
//  MFBrowserViewController.m
//  sqlitesearch
//
//  Created by Matteo Gavagnin on 24/04/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFBrowserViewController.h"

@interface MFBrowserViewController ()

@end

@implementation MFBrowserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if(self.sentence){
        self.titleLabel.title = self.sentence;
        [self.browser loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://it.m.wikipedia.org/wiki/%@", [self.sentence stringByReplacingOccurrencesOfString:@" " withString:@"_"]]]]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
