import React, { useReducer } from 'react';

export default (reducer, actions, defaultValue) => {
    const Context = React.createContext();

    const Provider = ({ children }) => {
        // dispatch is a function we can call with an action object
        // dispatch then calls the reducer method
        const [state, dispatch] = useReducer(reducer, defaultValue);

        const boundActions = {};
        for (let key in actions){
            boundActions[key] = actions[key](dispatch)
        }

        return (
            <Context.Provider value={{ state, ...boundActions}}>
            {children}
            </Context.Provider>
        ); 
    };

    return { Context, Provider }; 
}