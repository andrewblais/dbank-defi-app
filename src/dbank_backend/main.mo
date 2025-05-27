// module used for debugging
import Debug "mo:base/Debug";

// DBank is the class that holds the canister (smart contract)
actor DBank {

  // frontend code (src/dbank_frontend/src/App.jsx) calls this function
  // public query func greet(name : Text) : async Text {
  //   Debug.print(name);
  //   return "Hello, " # name # "!";
  // };

  // flexible variable
  // var currentValue : Nat = 300;

  // Orthogonal Persistance: Allows data to survive beyond the life
  // of a program, and the way data is created, used, or stored does 
  // not affect its persistence. The persistence of data is independent
  // of how long the program runs or what kind of data it is.

  // stable keyword makes the variable become orthogonally persisted 
  stable var currentValue : Nat = 300;

  // replace the value of currentValue with what comes after ":=" (In this case, 100)
  // currentValue := 100;

  // unlike in Javascript, let is used to define constant variables (where the data does not change)
  let id = 3740597832408;

  Debug.print(debug_show (id));

  Debug.print("Hello");

  Debug.print(debug_show (currentValue));

  // public keyword exposes deposit() so that it can be used outside of this DBank canister
  // Otherwise, deposit() would be a private function (only accessible in this DBank canister)
  // increments the vaue of currentValue by 1

  // Update method: An update method makes changes to the canister’s (smart contract) persistent state
  // and/or performs operations that must be recorded on the blockchain.

  // Parameter: name = amount, type = Nat (short for Natural number)
  public func deoposit(amount : Nat) {
    // adds the amount passed in to the currentValue
    currentValue += amount;
    // prints the currentValue to the console
    Debug.print(debug_show (currentValue));
  };

  // allows the user to withdraw from the currentValue
  public func withdraw(amount : Nat) {

    // never let the current value be less than 0
    if (amount >= currentValue) {
      currentValue := 0;
    } else {
      currentValue := currentValue - amount;
    };
    Debug.print(debug_show (currentValue));

  };

  // Query method: A query method is a read-only function. It can access state but cannot modify it.
  // query methods are MUCH faster than update methods
  // this query function retrieves and returns the currentValue
  public query func checkBalance() : async Nat {
    return currentValue;
  };

};
