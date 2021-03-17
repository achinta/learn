import { ThemeProvider } from 'react-native-elements';
import { AsyncStorage } from 'react-native';
import createDataContext from './createDataContext';
import trackerApi from '../api/tracker';
import { navigate } from '../navigationRef';

const authReducer = (state, action) => {
    switch (action.type){
        case 'add_error':
            return {...state, errorMessage:action.payload};
        case 'signup':
            return {errorMessage: '', token: action.payload, }
        default: 
            return state
    }
}

const signup = dispatch => async ({ email, password }) => {
    try{
        const response = await trackerApi.post('/signup', {email, password});
        await AsyncStorage.setItem('token', response.data.token);
        console.log(response.data);
        dispatch({type: 'signup', payload: response.data.token});

        // navigate to main flow
        navigate('TrackList');
    }catch (err){
        dispatch({type: 'add_error', payload:'something went wrong with signup'});
        console.log(err.response.data);
    }
};


const signin = (dispatch) => {
    return ({ email, password }) => {
    };
};

const signout = (dispatch) => {
    return () => {
        // signout
    };
};


export const { Provider, Context } = createDataContext(authReducer, 
    {signup, signin , signout}, 
    { token: null, errorMesage:''})