import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';
import HomeScreen from "./src/screens/HomeScreen";
import ComponentScreen from "./src/screens/ComponentsScreen";
import CounterScreen from "./src/screens/CounterScreen";
import ColorScreen from "./src/screens/ColorScreen";
import SquareScreen from './src/screens/SquareScreen';

const navigator = createStackNavigator(
  {
    Home: HomeScreen,
    Components: ComponentScreen,
    Counter: CounterScreen, 
    Color: ColorScreen,
    Square: SquareScreen
  },
  {
    initialRouteName: "Home",   
    defaultNavigationOptions: {
      title: "App"
    }
  }
);

export default createAppContainer(navigator);   