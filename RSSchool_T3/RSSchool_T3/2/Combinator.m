#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    return @0;
}
@end

//function resultFunction(arr) {
//let resString = "";
//if (arr.length === 0)
//return null;
//else {
//let sign, koeff, koeffString, xDegree, degreeString;
//let degree = arr.length - 1;
//for (let i = 0; i < arr.length; i++) {
//koeff = arr[i];// получили коэффициент перед Х
//// разбираемся со знаками
//if (koeff > 0)
//sign = " + ";
//if (koeff < 0)
//sign = " - ";
//if (i === 0 && koeff < 0)
//sign = " - ";
//if (i === 0 && koeff > 0)
//sign = "";
//// разбираемся с коэффициентом
//koeff = Math.abs(koeff);
//if (koeff === 1)
//koeffString = "";
//if (koeff === 0) {
//resString += "";
//degree--;
//continue;
//}
//if (koeff > 1)
//koeffString = (String)(koeff);
////разбираемся с х в степени
//if (degree === 1) {
//xDegree = "x";
//degreeString = "";
//}
//if (degree === 0) {
//xDegree = "";
//degreeString = "";
//}
//if (degree > 1) {
//xDegree = "x^";
//degreeString = (String)(degree);
//}
//degree--;
//resString += sign + koeffString + xDegree + degreeString;
//
//}
//return resString;
//}
//}
