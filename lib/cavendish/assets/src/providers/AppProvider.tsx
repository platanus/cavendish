import { NavigationContainer } from '@react-navigation/native';
import { Provider as ReduxProvider } from 'react-redux';
import { TailwindProvider, Utilities } from 'tailwind-rn';

import { store } from '@/store';

// eslint-disable-next-line no-restricted-imports
import utilities from '../../tailwind.json';

export default function AppProvider({ children }: React.PropsWithChildren) {
  return (
    <NavigationContainer>
      <TailwindProvider utilities={utilities as Utilities}>
        <ReduxProvider store={store}>
          {children}
        </ReduxProvider>
      </TailwindProvider>
    </NavigationContainer>
  );
}
