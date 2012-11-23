//
//  PAJSecondViewController.h
//  ufonews
//
//  Created by peder jonsson on 2012-10-29.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PAJSecondViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    NSMutableArray *listOfUrls;
    NSMutableArray * listOfTitles;
    NSMutableArray * listOfSubTitles;
    
    NSMutableArray *listOfUrlsEn;
    NSMutableArray * listOfTitlesEn;
    NSMutableArray * listOfSubTitlesEn;
    
    
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, copy) NSArray *animationImages;



@end
