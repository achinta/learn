import React from 'react';
import { View, StyleSheet, Text }from 'react-native';

const ComponentsScreen = (props) => {
    const name = "Ajay";
    return <View>
        <Text style={styles.textStyle}> Getting started with React Native</Text>
<Text style={styles.subHeaderStyle}> My Name is {name}</Text>
    </View>
}

const styles = StyleSheet.create({
    textStyle: {
        fontSize: 30
    },
    subHeaderStyle: {
        fontSize: 20
    }
});

export default ComponentsScreen;
