#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    NSNumber *numOfColors = array.lastObject;
    NSInteger numOfColorsForUniqueCombinations = -1;
    
    for (NSInteger i = 0; i < [numOfColors integerValue]; i++) {
        if ([self factorial:[numOfColors integerValue]] / ([self factorial:i] * [self factorial:[numOfColors integerValue] - i]) == [array.firstObject integerValue]) {
            numOfColorsForUniqueCombinations = i;
            break;
        }
    }
   
    if (numOfColorsForUniqueCombinations == -1) {
        return nil;
    } else {
        return  [NSNumber numberWithInteger: numOfColorsForUniqueCombinations];
    }
}

-(NSInteger)factorial:(NSInteger)n{
    if( n == 1 || n == 0) {
        return 1;
    } else if (n < 0) {
        return -1;
    }
    return n * [self factorial:n-1];
}
@end
