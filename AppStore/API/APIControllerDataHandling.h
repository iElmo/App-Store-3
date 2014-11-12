//
//  APIControllerDataHandling.h
//  AppStore
//
//  Created by Dan Mac Hale on 12/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APAppItemObject.h"

@interface APIControllerDataHandling : NSObject
+(instancetype)sharedInstance;
-(APAppItemObject *)appItemForDictionary:(NSDictionary *)itemDictionary;
@end
