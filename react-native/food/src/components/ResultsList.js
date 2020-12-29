import React from 'react';
import { View, Text, StyleSheet, FlatList } from 'react-native';

const ResultsList = ({title, results}) => {
    return <View>
        <Text style={styles.title}>{title}</Text>
        <Text>Results: {results.length}</Text>
        <FlatList 
        horizontal
        data={results}
        keyExtractor={(result) => result.restaurant.id}
        renderItem={({item}) => {
            return <Text>{item.restaurant.name}</Text>;
        }}
        />
    </View>
}

const styles = StyleSheet.create({
    title: {
        fontSize: 18,
        fontWeight: 'bold'
    }
})
export default ResultsList;