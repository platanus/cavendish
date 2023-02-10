import React from 'react';
import { TailwindProvider, Utilities } from 'tailwind-rn';

import utilities from '../../tailwind.json';

export default function AppProvider({ children }: React.PropsWithChildren) {
  return (
    <TailwindProvider utilities={utilities as Utilities}>
      {children}
    </TailwindProvider>
  ); 
}
