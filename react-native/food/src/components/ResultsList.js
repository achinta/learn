import React from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity} from 'react-native';
import ResultsDetail from '../components/ResultsDetail';
import { withNavigation } from 'react-navigation';

// get the 'navigation' directly, instead of being passed from search screen
const ResultsList = ({title, results, navigation}) => {
    // do not display if we do not have data
    if (!results.length){
        return null;
    }
    
    return <View style={styles.container}>
        <Text style={styles.title}>{title}</Text>
        <Text>Results: {results.length}</Text>
        <FlatList 
            horizontal
            showsHorizontalScrollIndicator={false}
            data={results}
            keyExtractor={(result) => result.restaurant.id}
            // renderItem={({item}) => {
            //     return <ResultsDetail result={item.restaurant}/>;
            // }}
            renderItem={({item}) => {
                return (
                    <TouchableOpacity onPress={() => navigation.navigate('ResultsShow', {restaurant: item.restaurant})}>
                        <ResultsDetail result={item.restaurant}/>
                    </TouchableOpacity>
                )
            }}
        />
    </View>
}

const styles = StyleSheet.create({
    title: {
        fontSize: 18,
        fontWeight: 'bold',
        marginLeft: 15,
        marginBottom: 5
    },
    container: {
        marginBottom: 10
    }
})
export default withNavigation(ResultsList);