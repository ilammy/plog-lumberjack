//
//  main.m
//  plog-lumberjack
//
//  Created by ilammy on 2018-03-30.
//  Copyright © 2018 ilammy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];

        DDLogInfo(@"Hello, world!");
    }
    return 0;
}
