import { ThemeProvider } from 'react-native-elements';
import createDataContext from './createDataContext';

const authReducer = (state, action) => {
    switch (action.type){
        default: 
            return state
    }
}

const signup = (dispatch) => {
    return ({ email, password }) => {
        // make api request to sign up with that email and password
    };
};

const singin = (dispatch) => {
    return ({ email, password }) => {
    };
};

const signout = (dispatch) => {
    return () => {
        // signout
    };
};


export const { Provider, Context } = createDataContext(authReducer, 
    {signup, singin, signout}, 
    { isSignedIn: false})