import axios from 'axios';

// add some resuable defaults 
export default axios.create({
    baseURL: 'https://developers.zomato.com/api/v2.1',
    headers: {
        'user-key': '77bc84789b360dc667e3a637c4632ff5'
    }
})