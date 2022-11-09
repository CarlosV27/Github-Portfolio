import React from "react";
import { Link } from "react-router-dom";
import "./Footer.css";

const Footer = () => {
    return(
        <footer>
            <span className="circle" id="circle-left"></span>
            <span className="circle" id="circle-right"></span>
            <div className="footer-sesion-container">
                <h3 className="footer-section-title">Ingresa a nuestro sistema</h3>
                <ul>
                    <li><Link to="/inicio-sesion">Inicia Sesión</Link></li>
                    <li><Link to="/registro">Registrate</Link></li>                    
                    <li>Contáctanos</li>
                </ul>
            </div>
            <div className="footer-nosotros-container">
                <h3 className="footer-section-title">Conócenos</h3>
                <ul>
                    <li>Sobre nosotros</li>
                    <li>Conoce nuestro trabajo</li>
                    <li>Contacto</li>
                </ul>
            </div>
            <div className="footer-actividades-container">
                <h3 className="footer-section-title">Se parte de nosotros</h3>
                <ul>
                    <li>Dona</li>
                    <li>Bolsa de trabajo</li>
                    <li>Internships</li>
                </ul>
            </div>
        </footer>
    );
}

export default Footer;