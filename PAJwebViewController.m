//
//  PAJwebViewController.m
//  Bilkoll
//
//  Created by peder jonsson on 2012-10-18.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import "PAJwebViewController.h"

@interface PAJwebViewController ()

@end

@implementation PAJwebViewController {
    UIActivityIndicatorView *activity;
}

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
    self.myWebview.hidden = YES;
    activity =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.hidesWhenStopped = YES;
    activity.center = self.view.center;
    [activity startAnimating];
    [self.view addSubview:activity];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = self.aTitle;
    NSString *urlAddress = self.url;
    NSLog(@"link: %@", urlAddress);
    //Create a URL object.
    NSURL *urlToOpen = [NSURL URLWithString:urlAddress];
     NSLog(@"urlToOpen: %@", urlToOpen);
    //URL Request Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:urlToOpen];
    
    
    //Load the request in the UIWebView.
    [self.myWebview loadRequest:requestObj];
    //[self.myWebview loadHTMLString:<#(NSString *)#> baseURL:<#(NSURL *)#>];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activity stopAnimating];
    NSLog(@"error %@",error);
}
-(void)webViewDidStartLoad:(UIWebView *)webView {
    [activity stopAnimating];
    self.myWebview.hidden = NO;
NSLog(@"börjat ladda");
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //[activity stopAnimating];
    //self.myWebview.hidden = NO;
    if(banner == nil && showingAd == NO)
    {
        
        banner = [[AXLBannerView alloc] initWithAnimationUp:YES delay:12.0f exeption:@"UFO Media Collector" andRect:CGRectMake(0, 0, 320, 50)];
        
        CGRect frame = banner.frame;
        frame.origin.y = self.myWebview.frame.size.height-6;
        banner.frame = frame;
        [self.view addSubview:banner];
        showingAd = YES;
    }
    NSLog(@"klart");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMyWebview:nil];
    [super viewDidUnload];
}
@end
