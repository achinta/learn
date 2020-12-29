import React, {useState, useEffect} from 'react';
import { View, Text, StyleSheet } from 'react-native';
import SearchBar from '../components/SearchBar';
import zomato from '../api/zomato';
import useRestaurants from '../hooks/useRestaurants';
import ResultList from '../components/ResultsList';


const SearchScreen = () => {
    const [term, setTerm] = useState('');
    const [searchApi, results, errorMessage] = useRestaurants();

    const filterResultsByPriceRange = (price_range) => {
        const filtered = results.filter( result => {
            // console.log(result);
            return result['restaurant']['price_range'] === price_range;
        });
        // console.log('type of price_range ' + typeof(results[0]['price_range']));
        console.log('results for price_range - ', price_range, filtered.length);
        return filtered;
    }; 

    return <View>
        <SearchBar term={term} 
        onTermChange={newTerm => setTerm(newTerm)}
        onTermSubmit={() => searchApi(term)}
        />

        {errorMessage ? <Text>{errorMessage}</Text> : null}
        <Text>We have found {results.length}</Text>
        <Text>{term}</Text>
        <ResultList results={filterResultsByPriceRange(1)} title="Cost Effective"/>
        <ResultList results={filterResultsByPriceRange(2)} title="Bit Pricier"/>
        <ResultList results={filterResultsByPriceRange(3)} title="Big Spender"/>
    </View>
};

const styles = StyleSheet.create({});

export default SearchScreen;

