import AppProvider from './src/providers/AppProvider';
import HomeNavigator from './src/navigators/HomeNavigator';

export default function App() {
  return (
    <AppProvider>
      <HomeNavigator />
    </AppProvider>
  );
}
