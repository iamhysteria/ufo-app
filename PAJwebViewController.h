//
//  PAJwebViewController.h
//  Bilkoll
//
//  Created by peder jonsson on 2012-10-18.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXLBannerView.h"

@interface PAJwebViewController : UIViewController<UIWebViewDelegate>
{
    AXLBannerView *banner;
    BOOL showingAd;
}
@property (strong, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *myWebview;
@property (weak, nonatomic) NSString *aTitle;
@end
