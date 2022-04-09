import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
   stable var currentValue: Float = 300; //This is a Nat(Natural Number) and can only be positive. Persistent / flexible variable(persistent state while updation)
   currentValue := 300; //reassigning the variable
  //  let id = 17526723712987; //contsant
   Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float) {
     currentValue += amount;
     Debug.print(debug_show(currentValue));
   };
  public func withdraw(amount: Float) {
    let tempVal: Float = currentValue - amount;
    if(tempVal >=0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }else{
     Debug.print("Amount too large, currentValue less than zero.");
  }
  };
  public query func checkBalance(): async Float {
     return currentValue;

  };
  public func compound(){
    let currentTime=Time.now();
    let timeElapsedNS=currentTime-startTime;
    let timeElapsedS=timeElapsedNS/ 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

  //  topUp();
}