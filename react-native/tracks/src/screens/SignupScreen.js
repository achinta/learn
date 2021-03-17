import React, { useState, useContext} from 'react';
import { View, StyleSheet } from 'react-native';
import { Text, Input, Button } from 'react-native-elements';
import Spacer from '../components/Spacer';
import { Context as AuthContext } from '../context/AuthContext';


const SignupScreen = ({ navigation }) => {
     const { state, signup } = useContext(AuthContext);
     const [email, setEmail]  = useState('');
     const [password, setPassword] = useState('');

     return (
          <View style={styles.container}>
               <Spacer>
                    <Text h3>Sign up for Tracker</Text>
               </Spacer>
               <Input label='Email'
               value={email} 
               onChangeText={setEmail}
               autoCapitalize="none"
               autoCorrect={false}/>
               <Spacer />
               <Input label='Pasword' value={password} onChangeText={setPassword}
               autoCapitalize="none"
               autoCorrect={false}
               secureTextEntry/>
               <Spacer>
                    {state.errorMessage ? <Text style={styles.errorMessage}>{state.errorMessage}</Text>: null}
                    <Button title="Sign Up" onPress={() => signup({email, password})} />
               </Spacer>
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