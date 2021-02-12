import React, { useContext, useEffect } from 'react';
import { Text, StyleSheet, View, FlatList, Button, TouchableOpacity} from 'react-native';
import { Context } from '../context/BlogContext';
import { Feather } from '@expo/vector-icons';



const IndexScreen = ({ navigation }) => {
    const { state, addBlogPost, deleteBlogPost, getBlogPosts } = useContext(Context);

    useEffect(() => {
        getBlogPosts();

        // whenever this screen gets focus, refresh the data
        const listener = navigation.addListener('didFocus', ()=> {
            getBlogPosts();
        });

        // remove listener when index screen is destroyed
        return () => {
            listener.remove();
        };

    }, []);

    return <View>
        <FlatList  
        data={state} 
        keyExtractor={(blogPost) => blogPost.title}
        renderItem={({ item }) => {
            return (<TouchableOpacity onPress={() => navigation.navigate('Show', {id: item.id})}>
            <View style={styles.row}>
                    <Text style={styles.title}>{item.title} - {item.id}</Text>
                    <TouchableOpacity onPress={() => deleteBlogPost(item.id)}>
                        <Feather style={styles.icon} name="trash" />
                    </TouchableOpacity>
                </View>
            </TouchableOpacity>)
        }}
        />
    </View>
}

IndexScreen.navigationOptions = ({ navigation  }) => {
    return {
        headerRight: () => (
            <TouchableOpacity onPress={() => navigation.navigate('Create')}>
                <Feather name='plus' size={30}/>
            </TouchableOpacity>
        )
    }
};

const styles = StyleSheet.create({
    row: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        paddingVertical: 10,
        paddingHorizontal: 10, 
        borderTopWidth: 1,
        borderColor: 'gray'
    },
    title: {
        fontSize: 18
    },
    icon: {
        fontSize: 24 
    }
}) ;

export default IndexScreen;