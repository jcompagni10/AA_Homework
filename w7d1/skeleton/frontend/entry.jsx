import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import store from './store';
import Weather from './components/weather';

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(
    <div>
      <Widget store={store} />
      <Weather store = {store} />
    </div>,
    document.getElementById('root'));
});
