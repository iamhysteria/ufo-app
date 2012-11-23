//
//  TableViewController.m
//  XMLParseProgress
//
//  Created by 達郎 植田 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "UIImageView+AFNetworking.h"
#import "UIImage+GIF.h"
#import "AFJSONRequestOperation.h"
#import "AsyncImageView.h"
#import "PAJwebViewController.h"


NSString *kStrJsonURL;

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize itemsArray = _itemsArray;
@synthesize tableView;


- (id)initWithStyle:(UITableViewStyle)style
{
    //self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    kStrJsonURL = self.urlToFetch;
     self.title = self.aTitle;
    NSURL *url = [NSURL URLWithString:kStrJsonURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id getJSON) {
        _JSON = getJSON;
        //NSLog(@"%@", _JSON);
        [self.tableView reloadData];
    } failure:nil];
    [operation start];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// リストテーブルのアイテム数を返すメソッド
// 「UITableViewDataSource」プロトコルの必須メソッド
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_JSON valueForKeyPath:@"feed"] count];
}

// リストテーブルに表示するセルを返すメソッド
// 「UITableViewDataSource」プロトコルの必須メソッド
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier2";
    UITableViewCell *cell;
    //NSLog(@"mediaplayer %@",[_JSON valueForKeyPath:@"feed.entry.link.href"]);
    //NSLog(@"mediaplayer %@",[[_JSON valueForKeyPath:@"feed.entry.media$description"]objectAtIndex:indexPath.row]);
    // 範囲チェックを行う
   
    //NSDictionary *dict = [_JSON valueForKeyPath:@"feed.entry"];
    //NSLog(@"mediaplayer %@",[dict valueForKey:@"media$group"]);
      
    
    
    if (cell == nil) {
        //cell = [[UITableViewCell alloc]
        //initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
        cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
       
        if (indexPath.row < [[_JSON valueForKeyPath:@"feed.entry"] count])
           {
            
            // セルを作成する
            cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
            // cell.textLabel.text = @"sdfdsf";
            UILabel *title = (UILabel *)[cell viewWithTag:11];
            UILabel *ingressLabel = (UILabel *)[cell viewWithTag:12];
            title.text =
            [[_JSON valueForKeyPath:@"feed.entry.title.$t"] objectAtIndex:indexPath.row];
            
            
            //NSArray *mediaplayerarray = [[_JSON valueForKeyPath:@"feed.entry.media$group.media$player"] objectAtIndex:indexPath.row];
            // NSLog(@"arrayen: %@", mediaplayerarray);
            //ingressLabel.text = [[mediaplayerarray objectAtIndex:0] valueForKey:@"url"];
               NSString *str = [[_JSON valueForKeyPath:@"feed.entry.published.$t"] objectAtIndex:indexPath.row];
               NSString *newStr = [str substringWithRange:NSMakeRange(0, [str length]-([str length]-10))];
               ingressLabel.text = newStr;
               
               UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
               av.backgroundColor = [UIColor clearColor];
               av.opaque = NO;
               av.image = [UIImage imageNamed:@"videoCell.png"];
               cell.backgroundView = av;
            }

        }
    else
        {
            AsyncImageView *oldImage = (AsyncImageView*)[cell.contentView viewWithTag:999];
            [oldImage removeFromSuperview];
        }
    
    AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 5, 90, 70)];
    imageView.tag = 999;
    NSArray *mediathumbnailarray = [[_JSON valueForKeyPath:@"feed.entry.media$group.media$thumbnail"] objectAtIndex:indexPath.row];
    NSString *theurl = [[mediathumbnailarray objectAtIndex:1] valueForKey:@"url"];
    
    [imageView loadImageFromURL:[NSURL URLWithString:theurl]];
    
    [cell.contentView addSubview:imageView];
     
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic
    NSLog(@"hörde klick");
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    
    NSArray *mediaplayerarray = [[_JSON valueForKeyPath:@"feed.entry.media$group.media$player"] objectAtIndex:storyIndex];
    // NSLog(@"arrayen: %@", mediaplayerarray);
    NSString * storyLink = [[mediaplayerarray objectAtIndex:0] valueForKey:@"url"];
    
   // NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
    tempTitle = [[_JSON valueForKeyPath:@"feed.entry.title.$t"] objectAtIndex:storyIndex];
    //[[stories objectAtIndex: storyIndex] objectForKey: @"title"];
    
    
    // clean up the link - get rid of spaces, returns, and tabs...
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
    tempUrl = storyLink;
    
    //NSLog(@"första url: %@", tempUrl);
    // open in Safari
	// [[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
    [self performSegueWithIdentifier:@"hejweb" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     NSLog(@"är i prepare");
    //NSLog(@"andra url: %@", tempUrl);
    //tempUrl = [linkArray objectAtIndex:self.newsTable.indexPathForSelectedRow.row];
    //RootViewController *controller = (RootViewController*)[segue destinationViewController];
    PAJwebViewController *controller = (PAJwebViewController*)[segue destinationViewController];
    controller.url = tempUrl;
    controller.aTitle = tempTitle;
    // [self.navigationController pushViewController:controller animated:YES];
}


/*
- (IBAction)refresh:(id)sender {
    NSURL *url = [NSURL URLWithString:kStrJsonURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id getJSON) {
        _JSON = getJSON;
        //NSLog(@"%@", _JSON);
        [self.tableView reloadData];
    } failure:nil];
    [operation start];
}
*/
@end
