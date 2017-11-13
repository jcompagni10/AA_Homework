import {createStore} from 'redux';
import reducer from './reducer';

window.reducer = reducer;
const store = createStore(reducer);

export default store;
