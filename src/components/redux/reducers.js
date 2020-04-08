import { createReducer } from "@reduxjs/toolkit";
import { signIn, signOut } from "./actions";

const initialState = {
  isAuthenticated: false,
};

export const mainReducer = createReducer(initialState, {
  [signIn]: (state, { payload }) => ({
    ...initialState,
    isAuthenticated: true,
  }),
  [signOut]: (state, { payload }) => ({
    ...initialState,
    isAuthenticated: false,
  }),
});
