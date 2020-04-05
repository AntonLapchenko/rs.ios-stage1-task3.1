#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    NSMutableString *result = [NSMutableString new];
    NSString *sign = [NSString new];
    NSString *koeffString = [NSString new];
    NSString *degreeString = [NSString new];
    NSString *xDegree = [NSString new];
    NSInteger koeff = 0;
    
    if (numbers.count == 0) {
        return nil;
    } else {
        NSUInteger maxDegree = numbers.count - 1;
        for (NSUInteger i = 0; i < numbers.count; i++) {
            koeff = [numbers[i] integerValue];
            if (koeff > 0) {
                sign = @" + ";
            }
            if (koeff < 0) {
                sign = @" - ";
            }
            if (koeff == 0 && koeff < 0) {
                sign = @" - ";
            }
            if (i == 0 && koeff > 0) {
                sign = @"";
            }
            koeff = labs(koeff);
            if  (koeff == 1) {
                koeffString = @"";
            }
            if (koeff == 0) {
                [result appendString:@""];
                maxDegree --;
                continue;
            }
            if (koeff > 1) {
                koeffString = [NSString stringWithFormat:@"%ld", (long)koeff];
            }
            if (maxDegree == 1) {
                xDegree = @"x";
                degreeString = @"";
            }
            if (maxDegree == 0) {
                xDegree = @"";
                degreeString = @"";
            }
            if (maxDegree > 1) {
                xDegree = @"x^";
                degreeString = [NSString stringWithFormat:@"%lu", (unsigned long)maxDegree];
            }
            maxDegree --;
            [result appendString:[NSString stringWithFormat:@"%@%@%@%@",sign, koeffString,xDegree, degreeString]];
        }
        return result;
    }
}
@end
