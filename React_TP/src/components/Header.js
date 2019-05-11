import React, { Component } from "react";

class Header extends Component {
    constructor(props) {
        super(props);
        this.state = { 
        };
    }

    render() {       
        return (
        <div className="header">
            <div className="pull-left">
            <div className="logo">
            
                <span>E-Track</span>
            </div>

          </div>
            <div className="pull-right p-r-15">
                <ul>
                    <li className="header-icon dib"><img className="avatar-img" src="assets/images/avatar/1.jpg" alt="" /> <span className="user-avatar"> Nora Castillo <i className="ti-angle-down f-s-10"></i></span>
                        <div className="drop-down dropdown-profile">
                            <div className="dropdown-content-heading">
                                <span className="text-left">Contáctenos</span>
                                <p className="trial-day">Enviar mensaje</p>
                            </div>
                            <div className="dropdown-content-body">
                                <ul>
                                    <li><i className="ti-user"></i> <span>Perfil</span></li>
                                    <li><i className="ti-power-off"></i> <span>Cerrar Sesión</span></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
          </div>
        )
    }
}

export default Header;