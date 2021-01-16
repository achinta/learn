import React from 'react';
import { View, Image, Text, StyleSheet } from 'react-native';

const default_url = 'https://as1.ftcdn.net/jpg/00/72/13/90/500_F_72139086_PgPSNJGHlbFSnhGeYn1NjhsbTHLbDFIT.jpg';

const ResultsDetail = ({result}) => {
    return <View style={styles.container}>
        <Image source={{ uri: result.thumb ? result.thumb : default_url}} style={styles.image}/>
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