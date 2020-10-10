import React, { useState} from 'react';
import { View, Text, StyleSheet, Button, FlatList} from 'react-native';

const ColorScreen = (props) => {
    const [colors, setColors] = useState([]);
    console.log(colors);

    return <View>
        <Button title="Add a Color"
        onPress={() => {
            setColors([...colors, randomRGB()])
        }}> </Button>
        <FlatList data={colors}
        keyExtractor={(item) => item}
        renderItem={({item}) => {
            return <View style={{ height:100, width:100, backgroundColor: item}} />
        }}/>

    </View>
}

const randomRGB = () => {
    const red = Math.floor(Math.random() * 256);
    const green = Math.floor(Math.random() * 256);
    const blue = Math.floor(Math.random() * 256);

    return `rgb(${red}, ${green}, ${blue})`
}

const styles = StyleSheet.create({});

export default ColorScreen;
