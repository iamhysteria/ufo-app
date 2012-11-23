//
//  TableViewController.h
//  XMLParseProgress
//
//  Created by 達郎 植田 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UIProgressView  *_progressView;
    id              _JSON;
    NSInteger       _numOfJsonData;
    NSString * tempUrl;
    NSString * tempTitle;
}

@property (strong) NSArray *itemsArray;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (NSURL *)ogImageURLWithURL:(NSURL *)url;
- (NSString *)encodedStringWithContentsOfURL:(NSURL *)url;
@property (weak, nonatomic) NSString *urlToFetch;
@property (weak, nonatomic) NSString *aTitle;
@end
