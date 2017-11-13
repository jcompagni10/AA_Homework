import merge from 'lodash/merge';


const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  switch(action.type){
    case "SWITCH_CURRENCY":
      let currencyData = {baseCurrency: action.baseCurrency, rates: action.rates};
      return merge(state, currencyData);
    case "SWITCH_CITY":
      let weatherState = {
        city: action.city,
        temp: action.temp,
        description: action.description
      };
      let newState = merge(state, weatherState);
      return newState;
    default:
      return state;
  }
};

export default reducer;
