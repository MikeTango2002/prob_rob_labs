#include "ad.h"
#include <iostream>

using namespace std;
using namespace AD;

DualValuef fancyFn(const DualValuef& x, const DualValuef& y){
  return (sin(x)*exp(-x*x)/(DualValuef(2.0)+cos(DualValuef(2.0)+log(x)))/y);
}

typedef DualValue_<float> DualValuef;
int main(int argc, char** argv) {
  DualValuef result=fancyFn(DualValuef (0.5,1), DualValuef (0.2,0));
  cerr << "value of the function in the point: " << result.value << endl;
  cerr << "value of the derivtive in the point: " << result.derivative << endl;

  result=fancyFn(DualValuef (0.5,0), DualValuef (0.2,1));
  cerr << "value of the function in the point: " << result.value << endl;
  cerr << "value of the derivtive in the point: " << result.derivative << endl;
  
}
