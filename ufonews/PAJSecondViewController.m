//
//  PAJSecondViewController.m
//  ufonews
//
//  Created by peder jonsson on 2012-10-29.
//  Copyright (c) 2012 peder jonsson. All rights reserved.
//

#import "PAJSecondViewController.h"
#import "TableViewController.h"

@interface PAJSecondViewController ()

@end

@implementation PAJSecondViewController
@synthesize tableView = _tableView;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
  
    
    
    
    
    
    

    
   
    
    listOfTitles = [[NSMutableArray alloc] initWithObjects: @"The Open Networks",
                    @"csetiweb",
                    @"SpectrumRadioNetwork",@"UFOXposed",@"UFOTVstudios",@"NASAflix",@"AnonymousFO",@"Lou20764",@"DISCL0SUR3",@"DDSDTV",@"JDQuantum",@"Danlooooo",@"ultradimensional7",@"EcetiStargate",@"GlobalUFOs",@"thirdphaseofmoon",@"ProjectUFOs",@"spaceshipidentified",nil];
    listOfSubTitles = [[NSMutableArray alloc] initWithObjects: @"youtube channel",@"youtube channel",@"Welcome to what we hope will become one of the most diverse radio shows and web sites on the Internet!This is the place for you if you are interested in the following;·alternative energy,·alternative medicine and homeopathy, secret societies, U.F...",@"Youtube channel",@"Now featuring rare, vintage and hard-to-find feature films and TV Shows, exclusively from UFOTV®",@"Now featuring rare, vintage and hard-to-find feature films and TV Shows Exploring Space at NASAFLIX®, a UFOTV® Company.",@" Welcome to the official AnonymousFO YouTube channel. If your looking to be updated on the most groundbreaking UFO videos from around the world (and beyond) you've come to the right place.",@"I really do try to capture authentic 'unknown' objects. I am my own worst critic before posting. Folks!...I just upload what I record. You judge it for yourself.",@"As Always...You Decide!",@"Faith is the confident belief or trust in the truth or trustworthiness of a person, idea, or thing. The word 'faith' can refer to a religion itself or to religion in general. As with 'trust', faith involves a concept of future events or outcomes, ...",@"UFOs, UFO, UFO News, UFO Channel, Alien, Disclosure, E.T., Evidence, Extraterrestrial Life, Astronomy, Paranormal News, Strange Phenomena, Unknown, Anomalous News, Unexplained, Unsolved Mysteries, OVNI, UFO Videos",@"UFOs-, Aliens-, Docu- Channel",@"UFOs-, docs, conference, evidence",@"evidence of contact",@"UFO´s global collection",@"Rated Top Best UFO and Paranormal Video On YOUTUBE",@"Exclusive UFO Footage from UFO Investigator for over 10 years will post his UFO evidence footage here on ProjectUFOs!",@"Real Alien Truth",@"I have videos of presidents, air force officers, generals & astronauts all admitting aliens & their space crafts are here.Also 30 new 2010-12 videos from the History Ch that shows solid evidence the aliens were here thousands of years in the past....",nil];
    listOfUrls = [[NSMutableArray alloc] initWithObjects: @"http://gdata.youtube.com/feeds/api/users/theopennetworks/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/csetiweb/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/SpectrumRadioNetwork/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/UFOXposed/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/UFOTVstudios/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/NASAflix/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/AnonymousFO/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/Lou20764/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/DISCL0SUR3/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/DDSDTV/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/JDQuantum/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/Danlooooo/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/ultradimensional7/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/EcetiStargate/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/globalufos/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/thirdphaseofmoon/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/ProjectUFOs/uploads?alt=json",@"http://gdata.youtube.com/feeds/api/users/spaceshipidentified/uploads?alt=json", nil];
      
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier2";
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
    NSLog(@"arr count %d indexpath %d", [listOfUrls count],self.tableView.indexPathForSelectedRow.row);
    NSLog(@"ska seguea");
    // shoFlow *aBarber = [myBarbers objectAtIndex:self.myTableView.indexPathForSelectedRow.row];
    //  del.isBackFromDetail = YES;
    TableViewController *controller = (TableViewController*)[segue destinationViewController];
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