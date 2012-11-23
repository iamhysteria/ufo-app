//
//  PAJPodRssNew.m
//  ufonews
//
//  Created by peder jonsson on 2012-10-31.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import "PAJPodRssNew.h"

#import "PAJPodcastViewController.h"

@interface PAJPodRssNew ()
{
    
    
    
}


@end

@implementation PAJPodRssNew
@synthesize tableView = _tableView;



- (void)viewDidLoad
{
    [super viewDidLoad];
    

    listOfTitles = [[NSMutableArray alloc] initWithObjects: @"The UFO Show",@"UFO Buzz Radioshow",@"Are UFO´s Real",@"UFO Think Tank",@"Mysterious Universe",@"Binnall of America",@"The other side of truth",@"we are not alone",@"UFO Paranormal radio network",@"The Kate Valentine UFO show",@"Paranormal Podcast",@"PodcastUFO",@"Hidden Experience",@"SolelyJ´s UFO Podcast",@"The AZ UFO show",@"Australian UFO wave",nil];
    listOfSubTitles = [[NSMutableArray alloc] initWithObjects:@"With Aaron Moriarity",@"Explores the various topics surrounding the existence of UFO´s",@"With T.L Keller",@"Interviews and discussions with UFO researchers",@"blog and podcast with Benjamin Grund, Aaron Wright and Micah Hanks",@"with Tim Binall. Each podcast includes a concise write up of the main points discussed. Tim's guest list includes Ufologists from outside north America",@" film-maker and Ufological pundit Paul Kimball posts audio/video clips from interviews he has conducted with a wide range of people",@"with David Twichell airs monthly on WHFR.FM",@"offers a central repository of shows by several UFO/paranormal show hosts (Karyn Dolan, Dee Andrew, Frank Warren, Angelia Joiner, Joe Montaldo etc)",@"itunes podcast",@"with Jim Harold",@"with Martin Willis",@"with Mike Clelland, deals (mostly) with the UFO abduction phenomenon",@"A bit of UFO talk",@"AKA the Rich Giordano show",@"UFO´s are beeing seen everyday in Australia, some are real, we bring you the proof",nil];
    listOfUrls = [[NSMutableArray alloc] initWithObjects: @"http://www.blogtalkradio.com/aaronsufoshow.rss",@"http://feeds.feedburner.com/UfoBuzzRadio?format=xml",@"http://webtalkradio.net/internet-talk-radio/category/podcasts/science-and-medicine/are-ufos-real/feed/",@"http://www.blogtalkradio.com/rssfeed.aspx?user_url=ufothinktank",@"http://mysteriousuniverse.org/feed/podcast/",@"http://www.binnallofamerica.com/podcast.xml",@"http://tosot.podbean.com/feed/",@"http://whfr.fm/podcast/feed",@"http://paranormalradionetwork.org/rss2.aspx",@"http://www.atlanticcoastufos.com/kvufofeed.xml",@"http://jimharold.com/?feed=jimharoldscampfire",@"http://podcastufo.com/feed/podcast/",@"http://hiddenexperience.podbean.com/feed/",@"http://solelyj.podomatic.com//rss2.xml",@"http://www.blogtalkradio.com/azufoshow.rss",@"http://feeds.feedburner.com/AustralianUfoWave", nil];
   
    
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
        
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 68)];
        av.backgroundColor = [UIColor clearColor];
        av.opaque = NO;
        av.image = [UIImage imageNamed:@"ufonewsCell.png"];
        cell.backgroundView = av;
        
        
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