#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber >= 1 && monthNumber <= 12) {
        NSDateFormatter *formatter = [NSDateFormatter new];
        NSArray *monthNames = [formatter standaloneMonthSymbols];
        NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
        return monthName;
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSDate *dateNew = [formatter dateFromString:date];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:dateNew];
    NSInteger day = [components day];
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"RU"];
    [formatter setDateFormat:@"EE"];
    NSString *weekDay = [formatter stringFromDate:date];
    
    return weekDay;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *startDate = nil;
    NSTimeInterval interval = 0.0;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate: &startDate interval: &interval forDate: [NSDate date]];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitSecond value: (NSInteger)interval toDate: startDate options:NSCalendarMatchNextTime];
    return [date compare:startDate] == NSOrderedDescending && [date compare:endDate] == NSOrderedAscending;
}

@end
