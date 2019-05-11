import React, { Component } from "react";
import { Route, withRouter } from "react-router-dom";
import Header from "./Header.js";
import HomePage from "./HomePage.js";
import Sidebar from "./Sidebar";
// import HistoryPage from "./HistoryPage.js";

// import {Trollbox} from 'trollbox-pro'
import RegisterPage from "./RegisterPage";
import Login from "./LoginPage";

import "../assets/css/lib/font-awesome.min.css";
import "../assets/css/lib/themify-icons.css";
import "../assets/css/lib/menubar/sidebar.css";
import "../assets/css/lib/bootstrap.min.css";
import "../assets/css/lib/unix.css";
import "../assets/css/style.css";
import "./App.css";
import Axios from "axios";


Axios.defaults.headers = {"Content-Type": "application/json"}

class App extends Component {
    state = {
        login:false,
        
        user:"",
        password:"",
        success: true
    }

    componentDidMount = () => {
        if(localStorage.getItem("login") === null) return;
        this.setState({login: localStorage.getItem("login")}, ()=>{
                // console.log("localStorage", localStorage.getItem("login"), localStorage.getItem("login") === "true");
                // console.log("pathname", this.props.location.pathname, this.props.location.pathname === "/");
            if(this.props.location.pathname === "/" && localStorage.getItem("login") === "true"){
                this.setState({login:false});
            }    
        });

    }
    handleChange = (e) => {
        this.setState({
            [e.target.name]: e.target.value
        });
    }

    handleLogin = () => {
        console.log(this.props.history);
        let usersData = [{
            user: "andre@test.com", 
            pwd: "1234",
        },
        {
            user: "nora@test.com", 
            pwd: "1234"
        }
        ];

        for(let users of usersData) {
            if(this.state.user === users.user &&
               this.state.password === users.pwd){
                   this.setState({
                       login: true}, ()=> {
                            localStorage.setItem("login", this.state.login);
                            console.log("DESDE ACA", localStorage.getItem("login"));
                            this.props.history.push('/dashboard');
                       });
                }
        }
        this.setState({
            success: false
        })
    }

    render() {
        return (
            <>
                { !this.state.login ? 
                    <Route path="/" exact render={() =>
                        <Login
                            login = {this.state.login} 
                            success= {this.state.success}
                            handleChange={this.handleChange} 
                            handleLogin={this.handleLogin}
                        />
                    }/>
                    :
                    <>
                    <Sidebar/>
                    <Header/>
                    <div className="content-wrap">
                        <div className="main">
                        <div className="container-fluid">
                            <Route path="/dashboard" exact render={() =>
                                <HomePage/>
                            }/>

                            <Route path="/register" render={() =>
                                <RegisterPage/>
                            }
                            />
                            </div>
                        </div>
                    </div>
                    </>
                }
            </>
        );
    }
}

export default withRouter(App);
