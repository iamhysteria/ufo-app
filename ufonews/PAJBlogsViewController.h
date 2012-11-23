//
//  PAJBlogsViewController.h
//  ufonews
//
//  Created by peder jonsson on 2012-10-31.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAJBlogsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    NSMutableArray *listOfUrls;
    NSMutableArray * listOfTitles;
    NSMutableArray * listOfSubTitles;
    
    
    
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;





@end
