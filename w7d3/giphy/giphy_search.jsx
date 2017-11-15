import React from 'react';
import ReactDOM from 'react-dom';
import {configureStore} from './store/store';
import {Root} from './components/root';

  $(document).on("DOMContentLoaded", ()=>{
    const store = configureStore();
    window.store = store;
    ReactDOM.render(<Root store = {store}/>, $("#root")[0]);
  });
