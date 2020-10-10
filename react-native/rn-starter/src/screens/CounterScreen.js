import React, {useState} from 'react';
import { View, StyleSheet, Text, Button } from 'react-native';

const CounterScreen = (props) => {
    const [counter, setCounter] = useState(0);

    return <View>
        <Button 
        title="Increase"
        onPress={() => {
            setCounter(counter + 1);
        }} />
        <Button 

        title="Decrease"
        onPress={() => {
            setCounter(counter - 1);
        }} />

    <Text>current value{counter}</Text>

    </View>
} 

export default CounterScreen;

