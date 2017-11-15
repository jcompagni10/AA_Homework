import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component{
  constructor(props){
    super(props);
    this.state = {search: ''};
  }

  handleChange(e){
    const val = e.currentTarget.value;
    this.setState({search: val});
    this.props.fetchSearchGiphys(this.state.search);
  }

  handleSubmit(){
    this.props.fetchSearchGiphys(this.state.search);
  }

  render(){
    return(
      <div>
        <label>Search:
          <input className="search-bar" type="text" value = {this.state.search}
            onChange = {this.handleChange.bind(this)}/>
        </label>
        <button onClick={this.handleSubmit.bind(this)}>Submit</button>
        <GiphysIndex giphys = {this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
