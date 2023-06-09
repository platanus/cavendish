import { configureStore } from '@reduxjs/toolkit';
import thunk from 'redux-thunk';

import appReducer from '@/store/reducers';

const store = configureStore({
  reducer: appReducer,
  middleware: [thunk],
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;

export default store;
