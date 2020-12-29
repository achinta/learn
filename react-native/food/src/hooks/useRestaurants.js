import { useEffect, useState } from 'react';
import zomato from '../api/zomato';

export default() => {
    const [results, setResults] = useState([]);
    const [errorMessage, setErrorMessage] = useState('');

    const searchApi = async (searchTerm) => {
        try{
            const response = await zomato.get('/search', {
                params: {
                    entity_type: 'city',
                    entity_id: 28, //visakhapatnam in zomato,
                }
            });
            // console.log(response.data.restaurants);
            setResults(response.data.restaurants);
        } catch(err){
            setErrorMessage('something went wrong')
        }
    };

    // run this only once
    useEffect(() => {
        searchApi('test')
    }, []);

    return [searchApi, results, errorMessage];
}