import React from "react";
import { Link, useHistory } from 'react-router-dom';

import './NavbarDoctor.css';

import logo from '../../images/logo.png';

const NavbarDoctor = (props) => {
    const history = useHistory(); 
    return(
        <header className="doctor-navbar">
            <span className="circle" id="circle-left"></span>
            <span className="circle" id="circle-right"></span>
            <div className="logo-container">
                <Link to="/doctor"><img id="logo" src={logo} /></Link>
            </div>
            <div className="doctor-sesion-container">
                <ul className="doctor-navigation-list">
                    <li className="doctor-navigation-list-item"><button className="doctor-navigation-link" onClick={() => {
                        props.handleLogout();
                        history.push("/");
                    }}>Cerrar Sesión</button></li>                    
                </ul>
            </div>
        </header>
    );
};

export default NavbarDoctor;