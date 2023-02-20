import AppProvider from '@/providers/AppProvider';
import HomeNavigator from '@/navigators/HomeNavigator';

export default function App() {
  return (
    <AppProvider>
      <HomeNavigator />
    </AppProvider>
  );
}
