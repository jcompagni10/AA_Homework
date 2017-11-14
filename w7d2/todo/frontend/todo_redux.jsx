import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {

  // const addLoggingToDispatch = store => next => action =>{
  //   let dispatch = store.dispatch;
  //   console.log(store.getState());
  //   console.log(action);
  //   let result = next(action);
  //   console.log(store.getState());
  //   return ()=>result(dispatch);
  // };
  //
  // const applyMiddlewares = (store, ...middlewares)=>{
  //   let dispatch = store.dispatch;
  //   middlewares.forEach(mware=>(
  //     dispatch = mware(store)(dispatch)
  //   ));
  //   return Object.assign({}, store, {dispatch});
  // };

    const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
    let store = configureStore(preloadedState);
    // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
