import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const ResultShowScreen = ({ navigation }) => {
    const restaurant = navigation.getParam('restaurant');
    // console.log('retaurant object ', Object.keys(restaurant));
    return <View>
        <Text>Restaurant Detail Screen. id = {restaurant.id}</Text>
    </View>
};

const styles = StyleSheet.create({});

export default ResultShowScreen;