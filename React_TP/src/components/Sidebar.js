import React, {Component } from "react";
import {Link} from 'react-router-dom';

class Header extends Component {
    constructor(props) {
        super(props);
        this.state = {
           
        };
    }

    componentWillReceiveProps(nextProps) {

    }

    render() {
       
        return (
            <div className="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
                <div className="nano has-scrollbar">
                    <div className="nano-content" tabIndex="0" style={{ right: "-17px" }}>
                        <ul>
                            <li><Link to={"/"}><i className="ti-dashboard"></i> Dashboard </Link></li>
                            {/* <li className="active"><a href="cargo_register.html"><i className="ti-desktop"></i>Registro</Link></li> */}
                            <li><Link to={"/register"}><i className="ti-desktop"></i>Registro</Link></li>
                            <li><Link to={"/reportes"}><i className="ti-bar-chart-alt"></i>Reportes</Link></li>
                            <li><Link to={"/"}><i className="ti-layout-grid4-alt"></i> Data</Link></li>                   
                            <li><Link to={"/"}><i className="ti-settings"></i> Configuración</Link></li>
                        </ul>
                    </div>
                <div className="nano-pane" style= {{display: "none" }}><div className="nano-slider" style={{height: "884px", transform: "translate(0px, 0px)"}}></div></div></div>
            </div>
        )
    }

}

export default Header;