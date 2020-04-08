import { configureStore, getDefaultMiddleware } from "@reduxjs/toolkit";
import { persistStore, persistReducer, PERSIST } from "redux-persist";
import storage from "redux-persist/lib/storage";
import { mainReducer } from "./reducers";

const persistConfig = {
  key: "root",
  storage,
  whitelist: ["isAuthenticated"],
};

const persistedReducer = persistReducer(persistConfig, mainReducer);

export const store = configureStore({
  reducer: persistedReducer,
  middleware: [
    ...getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: [PERSIST],
      },
    }),
  ],
});

export const persistor = persistStore(store);
