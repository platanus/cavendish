import { combineReducers } from '@reduxjs/toolkit';

const appReducer = combineReducers({});

export default appReducer;

/*
// Example on how to create a counter slice in the path `src/store/slices/counter.ts`

import { createSlice, type PayloadAction } from '@reduxjs/toolkit';

const initialState = {
  value: 0,
};

export const counterSlice = createSlice({
  name: 'counter',
  initialState,
  reducers: {
    reset(state) {
      state.value = 0;
    },
    incrementBy(state, action: PayloadAction<number>) {
      state.value += action.payload;
    },
    decrementBy(state, action: PayloadAction<number>) {
      state.value -= action.payload;
    },
  },
});


// then to connect the slice, in this file do

import { combineReducers } from '@reduxjs/toolkit';

import { counterSlice } from @/store/slices/counter;

const appReducer = combineReducers({
  counter: counterSlice.reducer,
});

export default appReducer;

*/
