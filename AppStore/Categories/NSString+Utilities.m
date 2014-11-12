//
//  NSString+Utilities.m
//  AppStore
//
//  Created by Dan Mac Hale on 12/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

-(NSString *)fetchCurrencySymbol {
    NSLocale *locate = [NSLocale currentLocale];
    NSString *currency = [locate displayNameForKey:NSLocaleCurrencySymbol value:self];
    return currency;
}

@end
