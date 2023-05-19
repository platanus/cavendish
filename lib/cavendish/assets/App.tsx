import HomeNavigator from '@/navigators/HomeNavigator';
import AppProvider from '@/providers/AppProvider';

export default function App() {
  return (
    <AppProvider>
      <HomeNavigator />
    </AppProvider>
  );
}
