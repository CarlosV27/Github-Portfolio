import React from "react";
import { Link, useHistory } from 'react-router-dom';

import './NavbarAdmin.css';

import logo from '../../images/logo.png';
import homeIcon from '../../images/home-icon-dashboard.png';
import hospitalIcon from '../../images/hospital-icon-dashboard.png';
import pacienteIcon from '../../images/paciente-icon-dashboard.png';

const NavbarAdmin = (props) => {   
    const history = useHistory(); 
    return(
        <nav className="admin-navbar">
            <div className="logo-container">
                <Link id="logo-admin-nav" to="/dashboard"><img id="logo" src={logo} /></Link>
            </div>
            
            <div className="admin-nav-links">
                <ul>
                    <li className="list-item">
                        <div className="nav-icon-container">
                            <img className="nav-icon" src={homeIcon} />
                        </div>
                        Datos Generales
                    </li>

                    <li className="list-item">
                        <div className="nav-icon-container">
                            <img className="nav-icon" src={hospitalIcon} />
                        </div>
                        <a href="http://localhost:3001/doctors">Alta/Baja Doctor</a>
                    </li>

                    <li className="list-item">                        
                        <div className="nav-icon-container">
                            <img className="nav-icon" src={pacienteIcon} />
                        </div>
                        <a href="http://localhost:3001/pacients">Alta/Baja Paciente</a>
                    </li>
                </ul>
            </div>

            <div className="admin-logout-btn-container">
                <button className="admin-logout-btn" onClick={() => {
                    props.handleLogout();
                    history.push("/");
                }}>Cerrar Sesión</button>
            </div>
        </nav>
    );
};

export default NavbarAdmin;