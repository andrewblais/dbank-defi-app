// module used for debugging
import Debug "mo:base/Debug";

// module used for getting time
import Time "mo:base/Time";

// module used to convert numbers to type Float
import Float "mo:base/Float";

// DBank is the class that holds the canister (smart contract)
actor DBank {

  // Orthogonal Persistance: Allows data to survive beyond the life
  // of a program, and the way data is created, used, or stored does 
  // not affect its persistence. The persistence of data is independent
  // of how long the program runs or what kind of data it is.

  // stable keyword makes the variable become orthogonally persisted 
  // variable that stores the current time (in nanoseconds since January 1, 1970)
  stable var startTime = Time.now();

  Debug.print(debug_show(startTime));

  // flexible variable
  // Nat (short for Natural number)
  // var currentValue : Nat = 300;

  // stable keyword makes the variable become orthogonally persisted 
  stable var currentValue : Float = 300;

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

  // Parameter: name = amount, type = the type of the variable
  public func deoposit(amount : Float) {
    // adds the amount passed in to the currentValue
    currentValue += amount;
    // prints the currentValue to the console
    Debug.print(debug_show (currentValue));
  };

  // allows the user to withdraw from the currentValue
  public func withdraw(amount : Float) {

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
  public query func checkBalance() : async Float {
    return currentValue;
  };

  // function that calculates compound interest
  public func compound(){
    // gets the current time for when this function has been called 
    let currentTime = Time.now();
    // Calculates the difference in time from when this function was 
    // called and the start time of this program.
    let timeElapsedNS = currentTime - startTime;
    // converts the time from nanoseconds to seconds
    let timeElapsedS = timeElapsedNS / 1000000000;
    // formula for compound interest is below: 
    // Amount = Principal * (1 + (interest rate/number of times interest is compounded))^Time
    // In motoko, "**" means raise to the exponent
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));

    // reset the startTime to the time when the compound interest was last calculated
    startTime := currentTime;

  };

};
