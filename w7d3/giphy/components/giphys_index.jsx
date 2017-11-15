import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const giphyIndex = (props)=>{
  console.log(props);
  return (
    <div>
      <ul>
        {props.giphys.map((giphy)=>(
          <li className ="giphy-li">
            <img className="giphy" key = {giphy.id} src = {giphy.images.original.webp}/>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default giphyIndex;
