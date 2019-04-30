import React from "react";

const Input = (props) => {
    let handleChange = props.handleChange;
    return(
      <div className="form-group">
        <label>{props.label}</label>
        <div>
          <input type="text" className="form-control" name={props.name} onChange={handleChange}/>
        </div>
      </div>
    )
} 

export default Input;