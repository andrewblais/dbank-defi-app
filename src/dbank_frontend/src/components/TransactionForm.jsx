import React, { useState } from "react";

// Form for handling user deposits and withdrawals
export default function TransactionForm({ onSubmit }) {
  // State for deposit input
  const [input, setInput] = useState("");
  // State for withdrawal input
  const [withdrawal, setWithdrawal] = useState(""); 

  // Submit handler that triggers the onSubmit callback with parsed amounts
  const handleSubmit = async (e) => {
    e.preventDefault();
    const depositAmount = parseFloat(input);
    const withdrawAmount = parseFloat(withdrawal);

    // Call the parent component's onSubmit function and pass in the user-entered values.
    // If the user leaves one of the fields empty, `parseFloat` will return NaN.
    // Using `depositAmount || 0` ensures that if `depositAmount` is NaN or 0, 
    // we still pass 0 to avoid breaking the logic.
    // This line allows both fields to be optional—users can deposit, withdraw, or do both in one submission.
    await onSubmit(depositAmount || 0, withdrawAmount || 0); 
    // Reset deposit field
    setInput(""); 
    // Reset withdrawal field
    setWithdrawal(""); 
  };

  return (
    <form onSubmit={handleSubmit} className="transaction-form">
      <input
        type="number"
        placeholder="Deposit amount"
        value={input}
        onChange={(e) => setInput(e.target.value)}
      />
      <input
        type="number"
        placeholder="Withdrawal amount"
        value={withdrawal}
        onChange={(e) => setWithdrawal(e.target.value)}
      />
      <button type="submit" id="submit-btn">Finalize Transaction</button>
    </form>
  );
}
