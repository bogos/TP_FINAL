import React from 'react';
import { withRouter } from 'react-router-dom';
import background from "../images/background.jpg";

const LoginPage = (props) =>{
        return (
            <div className="background"
                style={{
                    background: "url("+background+")",
                    width: "100%",
                    height: "100%"
                }}
            >
            <div className="log-form">
                <h2>Login to your account</h2>
                <div className="form">
                    <input type="text" name="user" title="user" placeholder="user" onChange={props.handleChange}/>
                    <input type="password" name="password" title="password" placeholder="password" onChange={props.handleChange} />
                    <button onClick={props.handleLogin}className="btn">Login</button>
                    {props.success ? "" : <span style={{color:"red"}}>Error Credenciales</span>}
                    <a className="forgot">Forgot Username?</a>
                </div>
                </div>
            </div>
        )
    }

export default LoginPage;