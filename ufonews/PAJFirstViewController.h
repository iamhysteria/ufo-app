//
//  PAJFirstViewController.h
//  Bilkoll
//
//  Created by peder jonsson on 2012-10-03.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXLBannerView.h"


@interface PAJFirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
   
    NSMutableArray *listOfUrls;
    NSMutableArray * listOfTitles;
    NSMutableArray * listOfSubTitles;
    
    NSMutableArray *listOfUrlsEn;
    NSMutableArray * listOfTitlesEn;
    NSMutableArray * listOfSubTitlesEn;
    
    AXLBannerView *banner;
    BOOL showingAd;
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, copy) NSArray *animationImages;



@end
