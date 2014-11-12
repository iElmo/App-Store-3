//
//  APIControllerDataHandling.m
//  AppStore
//
//  Created by Dan Mac Hale on 12/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "APIControllerDataHandling.h"
#import "NSString+Utilities.h"

@implementation APIControllerDataHandling

+(instancetype)sharedInstance {
    static dispatch_once_t once;
    static id shareInstance;
    
    dispatch_once(&once, ^
                  {
                      shareInstance = [self new];
                  });
    return  shareInstance;
}

-(APAppItemObject *)appItemForDictionary:(NSDictionary *)itemDictionary {
    APAppItemObject *itemObject = [[APAppItemObject alloc] init];
    itemObject.name = [itemDictionary valueForKeyPath:@"im:name.label"];
    itemObject.kind = [itemDictionary valueForKeyPath:@"category.attributes.label"];
    itemObject.price = [[itemDictionary valueForKeyPath:@"im:price.attributes.amount"] floatValue];
    itemObject.currencySymbol = [[itemDictionary valueForKeyPath:@"im:price.attributes.currency"] fetchCurrencySymbol];
    NSArray *itemImages = [itemDictionary valueForKeyPath:@"im:image"];
    NSString *imageUrlString = [[itemImages lastObject] objectForKey:@"label"];
    itemObject.imageUrl = [NSURL URLWithString:imageUrlString];
    return itemObject;
}

@end
