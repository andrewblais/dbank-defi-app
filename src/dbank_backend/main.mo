// module used for debugging
import Debug "mo:base/Debug";

// DBank is the class that holds the canister (smart contract)
actor DBank {

  // frontend code (src/dbank_frontend/src/App.jsx) calls this function
  // public query func greet(name : Text) : async Text {
  //   Debug.print(name);
  //   return "Hello, " # name # "!";
  // };

  var currentValue = 300;

  // replace the value of currentValue with what comes after ":=" (In this case, 100)
  currentValue := 100;

  // unlike in Javascript, let is used to define constant variables (where the data does not change)
  let id = 3740597832408;

  Debug.print(debug_show (id));

  Debug.print("Hello");

  Debug.print(debug_show (currentValue));

  // public keyword exposes topUp() so that it can be used outside of this DBank canister
  // Otherwise, topUp() would be a private function (only accessible in this DBank canister)
  // increments the vaue of currentValue by 1

  // Parameter: name = amount, type = Nat (short for Natural number)
  public func topUp(amount: Nat) {
    // adds the amount passed in to the currentValue
    currentValue += amount;
    // prints the currentValue to the console
    Debug.print(debug_show (currentValue));
  };

  
};
