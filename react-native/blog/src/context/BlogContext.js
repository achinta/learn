import React, { useState } from 'react';

const BlogContext = React.createContext();



export const BlogProvider = ( { children }) => {
    const [blogPosts, setBlogPosts] = useState([]);

    const addBlogPost = () => {
        console.log('in add blogpost');
        setBlogPosts([...blogPosts, { title: `Blog Post #${blogPosts.length + 1}`}])
    }

    return <BlogContext.Provider value={{ data: blogPosts, addBlogPost: addBlogPost}}>{children}</BlogContext.Provider>
};

export default BlogContext;