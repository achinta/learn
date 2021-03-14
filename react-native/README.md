### Purpose
Code from https://www.udemy.com/course/the-complete-react-native-and-redux-course

### Setting up a local json server. 
In the json server folder, create db.json with the entities to be served. Then we add two scripts, `db` and `tunnel`. 
Then we run in two terminals

```shell
cd jsonserver

# start the api server
npm run db

# expose it to outside world
npm run tunnel
```

### Useful references
 - [Understanding Data Context](./blog/src/context/createDataContext.js)
