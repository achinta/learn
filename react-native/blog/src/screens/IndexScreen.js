import React, { useContext } from 'react';
import { Text, StyleSheet, View, FlatList, Button} from 'react-native';
import { Context } from '../context/BlogContext';
import { Provider } from '../context/BlogContext';

const IndexScreen = () => {
    const { state, addBlogPost } = useContext(Context);
    
    return <View>
        <Text> Index Screen  </Text>
        <Button title="Add Post" onPress={addBlogPost}> </Button>
        <FlatList  
        data={state} 
        keyExtractor={(blogPost) => blogPost.title}
        renderItem={({ item }) => {
            return <Text>{item.title}</Text>;
        }}
        />
    </View>
}

const styles = StyleSheet.create({}) ;

export default IndexScreen;