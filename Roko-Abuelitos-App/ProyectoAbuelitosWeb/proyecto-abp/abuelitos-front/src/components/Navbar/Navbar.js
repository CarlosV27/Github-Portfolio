import React from 'react';
import './Navbar.css';
import { Link, useHistory } from 'react-router-dom';

import logo from '../../images/logo.png';

const Navbar = (props) => {
    const history = useHistory(); 
    return(
        <header className="home-navbar">
            <span className="circle" id="circle-left"></span>
            <span className="circle" id="circle-right"></span>
            <div className="logo-container">
                <Link to="/user"><img id="logo" src={logo} /></Link>
            </div>
            <nav>
                <ul className="home-navigation-list">
                    <li className="home-navigation-list-item"><Link to="/user" className="home-navigation-link">Inicio</Link></li>
                    <li className="home-navigation-list-item"><Link to="/pruebas" className="home-navigation-link">Pruebas</Link></li>
                    <li className="home-navigation-list-item"><Link to="/perfil" className="home-navigation-link">Perfil</Link></li>
                </ul>                
            </nav>
            <div className="home-sesion-container">
                <ul className="home-navigation-list">
                    <li className="home-navigation-list-item"><button id="btn-inicio-sesion" className="home-navigation-link" onClick={() => {
                        props.handleLogout();
                        history.push("/");
                    }}>Cerrar Sesión</button></li>                    
                </ul>
            </div>
        </header>
    );
}

export default Navbar;