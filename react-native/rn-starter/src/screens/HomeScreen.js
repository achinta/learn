import React from "react";
import { Text, StyleSheet, Button, View } from "react-native";

const HomeScreen = ({navigation}) => {
  return <View>
    <Button title="Go to Components Demo" 
    onPress={() => {
      navigation.navigate('Components')
    }}/>

    <Button title="Go to Colors"
    onPress={() => {
      navigation.navigate("Color")
    }} />
  </View>;
};

const styles = StyleSheet.create({
  text: {
    fontSize: 30
  }
});

export default HomeScreen;
