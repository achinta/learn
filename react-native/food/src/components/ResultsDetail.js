import React from 'react';
import { View, Image, Text, StyleSheet } from 'react-native';

const ResultsDetail = ({result}) => {
    return <View style={styles.container}>
        <Image source={{ uri: result.thumb}} style={styles.image}/>
        <Text style={styles.name}>{result.name}</Text>
        <Text style={styles.name}>{result.user_rating.aggregate_rating} ({result.user_rating.votes} Reviews)</Text>
    </View>
};

const styles = StyleSheet.create({
    container: {
        marginLeft: 15
    },
    image: {
        width: 250,
        height: 120,
        borderRadius: 4
    },
    name: {
        fontWeight: 'bold',
        fontSize: 14
    }
})

export default ResultsDetail;