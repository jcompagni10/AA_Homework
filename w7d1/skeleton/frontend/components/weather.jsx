import React from 'react';
import {selectCity} from '../actions';
import {selectCurrency} from '../actions';


class Weather extends React.Component{
  constructor(props){
    super(props);
    this.cities = ['Oakland', 'Berkeley', 'Moscow', 'Beijing', 'Madrid'];
    this.selectCity = selectCity.bind(this);
    this.props.store.subscribe(this.forceUpdate.bind(this));
  }


  getWeather(city){
    const url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=bf7ce0bec1ca1a917f23885ce3ac6b0e&units=imperial`;
    $.get({
      url: url,
      success: this.parseWeather.bind(this),
      error: console.log
    });
  }


  parseWeather(data){
    const description = data.weather[0].description;
    const temp = data.main.temp;
    this.props.store.dispatch(this.selectCity(
      data.name,
      data.main.temp,
      data.weather[0].description
    ));
  }


  render(){
    const {temp, city, description} = this.props.store.getState();
    const cityOptions = this.cities.map(cityName =>(
      <button key = {cityName} onClick= { ()=>(this.getWeather(cityName) )} >{cityName}</button>
    ));

    return (
      <div>
        <h1> Current Weather</h1>
        <h3>Choose City:</h3>
        {cityOptions}
        <ul>
          <li>city: {city}</li>
          <li>temp: {temp}</li>
          <li>description: {description}</li>
        </ul>
    </div>

    );
  }
}

export default Weather;
