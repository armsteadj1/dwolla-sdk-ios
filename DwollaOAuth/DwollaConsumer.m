//
//  OAConsumer.m
//  OAuthConsumer
//
//  Created by Jon Crosby on 10/19/07.
//  Copyright 2007 Kaboomerang LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "DwollaConsumer.h"


@implementation DwollaConsumer

@synthesize scope, callback;

#pragma mark init

- (id)initWithKey:(NSString *)aKey 
           secret:(NSString *)aSecret 
            scope:(NSString *)aScope 
         callback:(NSString *)aCallback{
	if ((self = [super init])) {
		self.key = aKey;
		self.secret = aSecret;
        self.scope = aScope;
        self.callback = aCallback;
	}
	return self;
}

- (void)dealloc {
	[key release];
	[secret release];
    [scope release];
    [callback release];
	[super dealloc];
}

- (BOOL)isEqual:(id)object {
	if ([object isKindOfClass:[self class]]) {
		return [self isEqualToConsumer:(OAConsumer*)object];
	}
	return NO;
}

- (BOOL)isEqualToConsumer:(DwollaConsumer *)aConsumer {
	return ([self.key isEqualToString:aConsumer.key] &&
			[self.secret isEqualToString:aConsumer.secret] &&
            [self.scope isEqualToString:aConsumer.scope] &&
            [self.callback isEqualToString:aConsumer.callback]);
}

- (NSString *) strippedCallback 
{
    NSString *tempURL = callback;
    tempURL = [tempURL stringByReplacingOccurrencesOfString:@"/"
                                                 withString:@""];
    tempURL = [tempURL stringByReplacingOccurrencesOfString:@"http:"
                                                 withString:@""];
    return tempURL;
}

@end
