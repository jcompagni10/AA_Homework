const selectCurrency = (baseCurrency, rates)=>({
  type: "SWITCH_CURRENCY",
  baseCurrency: baseCurrency,
  rates: rates
});

const selectCity = (city, temp, description)=>({
  type: "SWITCH_CITY",
  city: city,
  temp: temp,
  description: description
});

export {selectCurrency, selectCity};
