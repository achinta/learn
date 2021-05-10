import React, { useReducer } from 'react';

export default (reducer, actions, defaultValue) => {
    const Context = React.createContext();

    const Provider = ({ children }) => {
        // dispatch(paramObject) calls reducer(state, ParamObject)
        const [state, dispatch] = useReducer(reducer, defaultValue);

        // actions is a dict of methodname:method. Whenever method is called, 
        // we want it to be calle 
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