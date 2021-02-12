import React, { useReducer } from 'react';
import { call } from 'react-native-reanimated';
import jsonServer from '../api/jsonServer';
import createDataContext from './createDataContext'


const blogReducer = (state, action) => {
    switch(action.type){
        // this is not needed as index screen will automatically do a fetch again
        // case 'add_blogpost':
        //     return [...state, { id: Math.floor(Math.random() * 9999),
        //         title: action.payload.title, 
        //         content: action.payload.content
        //     }]
        case 'edit_blogpost':
            return state.map((blogPost) => {
                return blogPost.id === action.payload.id 
                ? action.payload
                : blogPost
            });
        case 'delete_blogpost':
            return state.filter((blogPost) => blogPost.id !== action.payload);
        case 'get_blogposts':
            return action.payload;
        default: 
            return state;
    }
}; 

const getBlogPosts = (dispatch) => {
    return async() => {
        const response = await jsonServer.get('/blogPosts');

        dispatch({ type: 'get_blogposts', payload: response.data }); 
    };
}

const addBlogPost = (dispatch) => {
    return async (title, content, callback) => {
         await jsonServer.post('/blogPosts', {title, content});
        // dispatch({type: 'add_blogpost', payload: {title, content}});
        if (callback){
            callback(); 
        }
    };
};

const editBlogPost = (dispatch) => {
    return async (id, title, content, callback) => {
        // remote state
        jsonServer.put(`/blogposts/${id}`, {title, content});

        // local state
        dispatch({ type: 'edit_blogpost',payload: { id, title, content }});
        if (callback){
            callback();
        }
    }
}

const deleteBlogPost = (dispatch) => {
    return async (id) => {
        await jsonServer.delete(`/blogposts/${id}`);
        dispatch({ type: 'delete_blogpost', payload: id})
    }
}

export const { Context, Provider } = createDataContext(
    blogReducer, 
    { addBlogPost, deleteBlogPost, editBlogPost, getBlogPosts},
    [ ]
    ); 