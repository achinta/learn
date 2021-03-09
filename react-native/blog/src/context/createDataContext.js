import React, { useReducer } from 'react';

export default (reducer, actions, initialState) => {
    const Context = React.createContext();

    const Provider = ({ children }) => {
        // dispath(params) is a wrapper which invokes reducer(state, params)
        const [state, dispatch] = useReducer(reducer, initialState);

        // We extend the actions {addBlog: addBlog} with {addBlog:addBlog(dispatch)} in the provider
        // addBlog returns a addblog_wrapper(title), which has access to disptach. See BlogContext.js
        // When it is called from a screen with addBlog(title='xyz), addblog_wrapper does something (lets say with api)
        // and then uses disptach to invoke the reducer. 
        const boundActions = {};
        for (let key in actions){
            //call action with dispatch
            boundActions[key] = actions[key](dispatch)
        }

        return <Context.Provider value={{state, ...boundActions}}>
            {children}
        </Context.Provider>
    };

    return {Context, Provider}
};