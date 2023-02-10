import { NavigationContainer } from '@react-navigation/native';
import { TailwindProvider, Utilities } from 'tailwind-rn';

import utilities from '../../tailwind.json';

export default function AppProvider({ children }: React.PropsWithChildren) {
  return (
    <NavigationContainer>
      <TailwindProvider utilities={utilities as Utilities}>
        {children}
      </TailwindProvider>
    </NavigationContainer>
  );
}
