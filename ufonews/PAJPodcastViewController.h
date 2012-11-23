//
//  PAJPodcastViewController.h
//  ufonews
//
//  Created by peder jonsson on 2012-10-31.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface NSString (stripHtml)

-(NSString *) stringByStrippingHTML;

@end
@interface PAJPodcastViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
	
	
	
    
	UIActivityIndicatorView * activityIndicator;
	
	CGSize cellSize;
	NSMutableArray *linkArray;
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
    NSString * tempUrl;
    NSString * tempTitle;
	NSURL * currentMp3UrlToPlay;
    BOOL haveappeared;
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
   
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink, * mp3link;
}

@property (weak, nonatomic) IBOutlet UITableView *newsTable;
@property (weak, nonatomic) NSString *urlToFetch;

@property (weak, nonatomic) NSString *aTitle;




@end