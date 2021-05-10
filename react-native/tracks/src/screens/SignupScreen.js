import React, { useContext} from 'react';
import { View, StyleSheet } from 'react-native';
import { NavigationEvents } from 'react-navigation';
import { Context as AuthContext } from '../context/AuthContext';
import AuthForm from '../components/AuthForm';
import NavLink from '../components/NavLink';




const SignupScreen = ({ navigation }) => {
     const { state, signup, clearErrorMessage } = useContext(AuthContext);

     return (
          <View style={styles.container}>
               <NavigationEvents 
               onWillFocus={clearErrorMessage}
               />
               <AuthForm 
               headerText="Sign Up for Tracker"
               errorMessage={state.errorMessage}
               submitButtonText="Sign Up"
               onSubmit={signup} 
               />
               <NavLink 
                    routeName="Signin" 
                    txt="Already have an account? Sign in insteadx!"
               />
          </View>)
}

SignupScreen.navigationOptions = () => {
     return {
          headerShown: false
     };
};

const styles = StyleSheet.create({
     container: {
          // borderColor: 'red',
          // borderWidth: 5,
          flex: 1,
          justifyContent: 'center',
          marginBottom: 200
     },
     errorMessage: {
          fontSize: 16,
          color: 'red', 
          marginLeft: 15,
          marginTop: 15
     }
});

export default SignupScreen;