//
//  MFTextView.m
//  sqlitesearch
//
//  Created by Matteo Gavagnin on 24/04/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFTextView.h"
#import <sqlite3.h>

@implementation MFTextView

- (id)init {
    self = [super init];
    if (self) {
        [self initHelper];
    }
    return self;
}

- (id)initWithFrame:(CGRect)theFrame {
    self = [super initWithFrame:theFrame];
    if (self) {
        [self initHelper];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        [self initHelper];
    }
    return self;
}

- (void)initHelper{
    UIMenuItem *wikiMenuItem = [[UIMenuItem alloc] initWithTitle:@"Wikipedia" action:@selector(wikiMenu:)];
    [UIMenuController sharedMenuController].menuItems = [NSArray arrayWithObject:wikiMenuItem];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(wikiMenu:)) {
        // Return YES only if it's possible to perform the action at this time
        NSString * selectedText = [self.text substringWithRange:[self selectedRange]];
        return [self findWord:[[selectedText lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@"_"]];
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)wikiMenu:(id)sender{
    [self.delegate performSelector:@selector(presentWikiViewWithSentence:) withObject:[self.text substringWithRange:[self selectedRange]]];
}

- (BOOL)findWord:(NSString *)word;
{
    sqlite3 *wikiDB;

    NSString *_databasePath = [[NSBundle mainBundle] pathForResource:@"wiki_it" ofType:@"rdb"];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &wikiDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT title FROM titles WHERE title=\"%@\"",
                              word];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(wikiDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                return YES;
            } else {
                return NO;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(wikiDB);
    }
    return NO;
}


@end
