//
//  NSString+Characters.m
//  AddressBook
//
//  Created by y_小易 on 14-6-10.
//  Copyright (c) 2014年 www.lanou3g.com. All rights reserved.
//

#import "NSString+Characters.h"

@implementation NSString (Characters)

//讲汉字转换为拼音
- (NSString *)pinyinOfString
{
    NSMutableString * string = [[[NSMutableString alloc] initWithString:self] autorelease];
    
    CFRange range = CFRangeMake(0, string.length);
    
    // 汉字转换为拼音,并去除音调
    if ( ! CFStringTransform((__bridge CFMutableStringRef) string, &range, kCFStringTransformMandarinLatin, NO) ||
        ! CFStringTransform((__bridge CFMutableStringRef) string, &range, kCFStringTransformStripDiacritics, NO)) {
        return @"";
    }
    
    return string;
}

//汉字转换为拼音后，返回大写的首字母
- (NSString *)firstCharacterOfString
{
    
    NSString * pinyin = [self pinyinOfString];
    
    NSString * result = [pinyin substringToIndex:1];
    
    return result.uppercaseString;
}

@end
