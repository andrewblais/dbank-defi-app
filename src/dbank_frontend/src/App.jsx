import React, { useEffect, useState } from "react";
import { checkBalance, deposit, withdraw, compound } from "./dbank.js";
import TransactionForm from "./components/TransactionForm";
import Balance from "./components/Balance";
import "./index.scss";

function App() {
  // Local state to hold the user's current account balance
  const [balance, setBalance] = useState(0);

  // Fetch the current balance from the backend canister
  const updateBalance = async () => {
    const newBalance = await checkBalance();
    // Round to two decimal places before setting state
    setBalance(parseFloat(newBalance.toFixed(2)));
  };

  // Run updateBalance once when the component mounts
  useEffect(() => {
    updateBalance();
  }, []);

  // Handle both deposit and withdrawal operations, then update balance
  const handleTransaction = async (depositAmount, withdrawAmount) => {
    // Deposit funds if input is provided
    if (depositAmount) await deposit(depositAmount); 
    // Withdraw funds if input is provided
    if (withdrawAmount) await withdraw(withdrawAmount); 
    // Apply interest compound
    await compound(); 
    // Refresh the balance displayed
    await updateBalance(); 
  };

  return (
    <main className="container">
      <img src="dbank_logo.png" alt="DBank logo" width="100"/>
      {/* Display current balance */}
      <Balance amount={balance}/>
      {/* Form for submitting deposit/withdraw actions */}
      <TransactionForm onSubmit={handleTransaction}/>
    </main>
  );
}

export default App;
