//
//  PAJPodRss.m
//  ufonews
//
//  Created by peder jonsson on 2012-10-31.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import "PAJPodRss.h"
#import "PAJPodcastViewController.h"


@interface PAJPodRss ()
{
    
    
    
}

@end

@implementation PAJPodRss
@synthesize tableView = _tableView;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    listOfTitles = [[NSMutableArray alloc] initWithObjects: @"Openminds.tv",@"UFO Digest",@"UFO Magazine (US)",@"UK UFO Sightings",@"UFO stalker",@"National UFO Examiner",@"Paranormal Old Pueblo",@"thenightshirt.com",nil];
    listOfSubTitles = [[NSMutableArray alloc] initWithObjects:@"media company focused on UFOs. They operate a website, a magazine, a radio show and a television show.",@"by Dirk Vander Ploeg, offers UFO and Paranormal news from around the world",@"by Bill and Nancy Birnes",@"by Andy Mannion, posts UFO sighting reports as submitted by the public in Britain",@"UFO Stalker automatically posts UFO reports submitted via MUFON Case Management System (MUFON CMS), and plots them onto GoogleMaps (note: MUFON is the largest civilian UFO group in North America)",@"Roger Marsh's feed",@"by Cherlyn Gardner Strong from Tucson Arizona USA",@"by Eric Wargo from Washington, DC USA.",nil];
    listOfUrls = [[NSMutableArray alloc] initWithObjects: @"http://www.openminds.tv/feed/",@"http://www.ufodigest.com/rss.xml",@"http://ufomagazine.squarespace.com/ufo-magazine/rss.xml",@"http://www.uk-ufo.co.uk/feed/",@"http://feeds2.feedburner.com/ufostalker",@"http://www.examiner.com/user/1565231/1872696/feed",@"http://paranormaloldpueblo.com/feed/",@"http://thenightshirt.com/?feed=rss2", nil];
    
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier4";
    UITableViewCell *cell;
	
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
        cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        // Set up the cell
        int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
		//cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        UILabel *title = (UILabel *)[cell viewWithTag:12];
        UILabel *ingressLabel = (UILabel *)[cell viewWithTag:13];
        //      NSLog(@"searching");
        
        title.text =[listOfTitles objectAtIndex: storyIndex];
        ingressLabel.text =[listOfSubTitles objectAtIndex: storyIndex];
        
        
        // [cell setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
	}
	
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"ska seguea");
    // shoFlow *aBarber = [myBarbers objectAtIndex:self.myTableView.indexPathForSelectedRow.row];
    //  del.isBackFromDetail = YES;
    PAJPodcastViewController *controller = (PAJPodcastViewController*)[segue destinationViewController];
    NSString *url;
    NSString *titleToSend;
    
    url = [listOfUrls objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    titleToSend = [listOfTitles objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    
    controller.aTitle = titleToSend;
    controller.urlToFetch = url;
    controller.isBlog = NO;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [listOfTitles count];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    
    [super viewDidUnload];
}

@end
