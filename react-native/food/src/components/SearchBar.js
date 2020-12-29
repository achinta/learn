import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Feather } from '@expo/vector-icons';
import { TextInput } from 'react-native-gesture-handler';

const SearchBar = ({term, onTermChange, onTermSubmit}) => {
    return <View style={styles.backgroundStyle}>
        <Feather name='search' style={styles.iconStyle}/>
        <TextInput placeholder="Search"
        autoCapitalize="none"
        autoCorrect={false}
        style={styles.inputStyle}
        value={term}
        // onChangeText={newTerm => onTermChange(newTerm)} // this works too
        onChangeText={onTermChange} //we can directly call the function
        onEndEditing={() => onTermSubmit()}
        />
    </View> 
};

// expo icons can be searched from https://icons.expo.fyi/
const styles = StyleSheet.create({
    backgroundStyle: {
        marginTop: 10,
        backgroundColor: '#F0EEEE',
        height: 50, 
        borderRadius: 5, 
        marginHorizontal: 15, 
        flexDirection: 'row' //keep objects in the same row
    },
    inputStyle: {
        // borderColor: 'black',
        // borderWidth: 1, 
        flex: 1,
        fontSize: 18
    },
    iconStyle: {
        fontSize: 35,
        alignSelf: 'center',
        marginHorizontal: 15
    }
}); 

export default SearchBar;

