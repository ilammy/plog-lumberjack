//
//  main.m
//  plog-lumberjack
//
//  Created by ilammy on 2018-03-30.
//  Copyright © 2018 ilammy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

#include "cpp-code.hpp"

static const DDLogLevel ddLogLevel = DDLogLevelDebug;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];

        DDLogInfo(@"Hello, world!");

        cpp_code_main();
    }
    return 0;
}
