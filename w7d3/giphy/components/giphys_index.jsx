import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const giphyIndex = (props)=>{
  console.log(props);
  return (
    <div>
      <ul>
        {props.giphys.map((giphy)=>(
          <li key = {giphy.id} className ="giphy-li">
            <img className="giphy"  src = {giphy.images.original.url}/>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default giphyIndex;
