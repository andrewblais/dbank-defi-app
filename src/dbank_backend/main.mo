// module used for debugging
import Debug "mo:base/Debug";

// DBank is the class that holds the cannister (smart contract)
actor DBank {

  public query func greet(name : Text) : async Text {

    var currentValue = 300;

    // replace the value of currentValue with what comes after ":=" (In this case, 100)
    currentValue := 100;


    // unlike in Javascript, let is used to define constant variables (where the data does not change)
    let id = 3740597832408;

    Debug.print(debug_show(id));

    Debug.print("Hello");

    Debug.print(name);

    Debug.print(debug_show (currentValue));

    return "Hello, " # name # "!";

  };

};
