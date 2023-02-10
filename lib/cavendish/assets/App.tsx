import React from 'react';
import { NavigationContainer } from '@react-navigation/native';

import AppProvider from './src/providers/AppProvider';
import HomeNavigator from './src/navigators/HomeNavigator';

export default function App() {
  return (
    <AppProvider>
      <NavigationContainer>
        <HomeNavigator />
      </NavigationContainer>
    </AppProvider>
  );
}
