import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import {applyMiddleware} from 'redux';

const addLoggingToDispatch = store => next => action =>{
  let dispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let result = next(action);
  console.log(store.getState());
  return ()=>result(dispatch);
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch));
    
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
