import React from "react";

const Input = (props) => {
    let handleChange = props.handleChange;
    return(
      <div className="form-group">
        <label>{props.label}</label>
        <div>
          <input type="text" className="form-control" value={props.value} pattern={props.pattern} name={props.name} onChange={handleChange} style={props.style}/>
        </div>
      </div>
    )
} 

export default Input;