// canister/smart contract interface

import { dbank_backend as dbank } from "../../declarations/dbank_backend/index.js";

// Calls the canister method to retrieve the current balance
export const checkBalance = async () => {
  return await dbank.checkBalance();
};

// Calls the canister method to deposit funds
export const deposit = async (amount) => {
  await dbank.deposit(amount);
};

// Calls the canister method to withdraw funds
export const withdraw = async (amount) => {
  await dbank.withdraw(amount);
};

// Calls the canister method to apply interest compounding
export const compound = async () => {
  await dbank.compound();
};
