//
//  APAPIController.m
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "APAPIController.h"
#import "AFNetworking.h"
#import "APAppItemObject.h"
#import "APIControllerDataHandling.h"

@implementation APAPIController

+ (void)executeRssQuery:(NSString *)query withCompletionBlock:(NSArrayNSErrorCompletionBlock)completionBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [manager GET:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *itemDictionary = [responseObject valueForKeyPath:@"feed.entry"];
        for (NSDictionary *item in itemDictionary) {
            APAppItemObject *itemObject = [[APIControllerDataHandling sharedInstance] appItemForDictionary:item];
            [items addObject:itemObject];
        }
        if (completionBlock) {
            completionBlock(items, 0);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            NSString *errorMessage = @"Web services error";
            error = [NSError errorWithDomain:@"com.AppStore" code:1 userInfo:[NSDictionary dictionaryWithObject:errorMessage forKey:@"RSS"]];
        }
        if (completionBlock) {
            completionBlock(0, error);
        }
    }];
}
@end
