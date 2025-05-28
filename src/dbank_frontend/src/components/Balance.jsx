import React from "react";

// Simple component to display the balance passed in via props
export default function Balance({ amount }) {
  return (
    <div className="balance-display">
      <h1>
        Current Balance: <span>{new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(amount)}</span>
      </h1>
    </div>
  );
}
