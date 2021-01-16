import React, {useState, useEffect} from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import SearchBar from '../components/SearchBar';
import zomato from '../api/zomato';
import useRestaurants from '../hooks/useRestaurants';
import ResultList from '../components/ResultsList';


const SearchScreen = ({ }) => {
    const [term, setTerm] = useState('');
    const [searchApi, results, errorMessage] = useRestaurants();

    const filterResultsByPriceRange = (price_range) => {
        const filtered = results.filter( result => {
            return result['restaurant']['price_range'] === price_range;
        });
        return filtered;
    }; 

    return <View style={{flex: 1}}>
        {/* use flex 1 if we have content being cut off, as it is expanding beyond the screen */}
        <SearchBar term={term} 
        onTermChange={newTerm => setTerm(newTerm)}
        onTermSubmit={() => searchApi(term)}
        />

        {errorMessage ? <Text>{errorMessage}</Text> : null}
        <Text>We have found {results.length}</Text>
        <Text>{term}</Text>

        {/* scrollview makes vertical scrolling for a list */}
        <ScrollView>
            <ResultList results={filterResultsByPriceRange(1)} title="Cost Effective" />
            <ResultList results={filterResultsByPriceRange(2)} title="Bit Pricier" />
            <ResultList results={filterResultsByPriceRange(3)} title="Big Spender" />
        </ScrollView>
    </View>
};

const styles = StyleSheet.create({});

export default SearchScreen;

