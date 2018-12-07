//
//  ViewController.m
//  Examen1
//
//  Created by Josue on 12/7/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) NSString*name;//@"value"
@property(nonatomic,strong) NSString*day;//@value
@property(nonatomic,strong) NSString*address;
@property(nonatomic,strong) NSString*startTime;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RequestListTicket];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)RequestListTicket{
    NSURL*urlTicket = [NSURL URLWithString:@"https://api.myjson.com/bins/tp1am"];
    NSMutableURLRequest*request = [NSMutableURLRequest requestWithURL:urlTicket
                                                          cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *postdataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
    
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (error==nil){
            if([httpResponse statusCode] == 200){
                
                NSDictionary*dictFromData=[NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingAllowFragments error:&error];
                NSLog(@"Z");
                
            }
        }
    
    }];
    [postdataTask resume];
    
}


@end
