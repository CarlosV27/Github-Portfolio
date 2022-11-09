import React from 'react';
import './Header.css';
import { Link } from 'react-router-dom';

import logo from '../../images/logo.png';

const Header = () => {
    return(
        <header>
            <span className="circle" id="circle-left"></span>
            <span className="circle" id="circle-right"></span>
            <div className="logo-container">
                <Link to="/"><img id="logo" src={logo} /></Link>
            </div>
            <nav>
                <ul className="navigation-list">
                    <li className="navigation-list-item"><Link className="navigation-link">Dona</Link></li>
                    <li className="navigation-list-item"><Link className="navigation-link">Sobre Nosotros</Link></li>
                </ul>                
            </nav>
            <div className="sesion-container">
                <ul className="navigation-list">
                    <li className="navigation-list-item"><Link to="/inicio-sesion" id="btn-inicio-sesion" className="navigation-link">Inicia Sesión</Link></li>
                    <li className='navigation-list-item'><Link to="/registro" id="btn-registro" className="navigation-link" >Registrate</Link></li>
                </ul>
            </div>
        </header>
    );
}

export default Header;