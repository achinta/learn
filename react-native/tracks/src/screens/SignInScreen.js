import React, { useContext } from 'react';
import { View, StyleSheet, Text } from 'react-native';
import { NavigationEvents } from 'react-navigation';
import AuthForm from '../components/AuthForm';
import NavLink from '../components/NavLink';
import { Context } from '../context/AuthContext';

const SigninScreen = () => {
     const { state, signin, clearErrorMessage } = useContext(Context);
     return (
          <View style={styles.container}>
               <NavigationEvents 
               onWillFocus={clearErrorMessage}
               />
               <AuthForm
               headerText="Sign In to your Account"
               errorMessage={state.errorMessage}
               onSubmit={signin}
               submitButtonText="Sign In"
               />
               <NavLink 
               txt="Dont have an account? Sign up instead"
               routeName="Signup"
               />
          </View>
     )
}

SigninScreen.navigationOptions = () => {
     return {
       headerShown: false,
     };
   };

const styles = StyleSheet.create({
     container: {
          flex: 1,
          justifyContent: 'center',
          marginBottom: 250
     }
});

export default SigninScreen;