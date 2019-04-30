import React, { Component } from "react";
import { Route } from "react-router-dom";
import Header from "./Header.js";
import HomePage from "./HomePage.js";
import Sidebar from "./Sidebar";
import HistoryPage from "./HistoryPage.js";

import {Trollbox} from 'trollbox-pro'
import RegisterPage from "./RegisterPage";


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
    }

    async componentDidMount() {

    }

    render() {
        return (
            <>
                <Sidebar/>
                <Header/>
                <div className="content-wrap">
                    <div className="main">
                    <div className="container-fluid">
                        <Route path="/" exact render={() =>
                            <HomePage/>
                        }
                        />
                        <Route path="/history" render={() =>
                            <HistoryPage
                                
                            />}
                            />
                        <Route path="/register" render={() =>
                            <RegisterPage/>
                        }
                        />
                        
                        <Route path="/trollbox" render={() =>
                            <Trollbox ></Trollbox>
                        }
                        />
                        </div>
                    </div>
                </div>
            </>
        );
    }
}

export default App;
