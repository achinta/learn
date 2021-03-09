import React from 'react'
import { StyleSheet, Text, View } from 'react-native'

export default function BoxScreen() {
    return (
        <View style={styles.viewParentStyle}>
            <View style={styles.viewOneStyle} />
            <View style={styles.viewTwoStyle} />
            <View style={styles.viewThreeStyle} />
        </View>
    )
};

const styles = StyleSheet.create({
    viewParentStyle: {
        borderColor : 'black',
        borderWidth: 3, 
        height: 200,
        width: 400,
        flexDirection: 'row',
        justifyContent: 'space-between'
    },
    viewOneStyle: {
        backgroundColor: 'red',
        height: 50,
        width:50
    },
    viewTwoStyle: {
        backgroundColor: 'green',
        height: 50,
        width:50,
        marginTop: 50,
        alignSelf: 'flex-end'
    },
    viewThreeStyle: {
        backgroundColor: 'purple',
        height: 50,
        width:50
    },
    textOneStyle: {
        borderWidth: 3,
        borderColor: 'red',
        flex: 4
    },
    textTwoStyle: {
        borderWidth: 3,
        borderColor: 'red',
        flex: 4
    },
    textThreeStyle: {
        borderWidth: 3,
        borderColor: 'red',
        flex: 2
    },
});
