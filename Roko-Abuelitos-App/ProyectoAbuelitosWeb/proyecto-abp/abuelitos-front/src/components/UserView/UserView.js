import React from "react";
import Navbar from "../Navbar/Navbar";
import Footer from "../Footer/Footer";
import CardRPF from "../CardRPF/CardRPF";

import './UserView.css';

const UserView = (props) => {
  return (
    <div>
      <Navbar handleLogout={props.handleLogout}/>
      <section>
        <div className="home-greetings-container">
          <h1 className="home-title">¡Hola, David!👋🏼</h1>
          <p>¿Cómo te encuentras hoy?</p>
        </div>
        <div className="recordatorios-section">
          <h2 className="section-title">Recordatorios/Recomendaciones</h2>
          <div className="cards-container">
            <CardRPF
              hasObj={false}
              cardTitle="Hoy"
              cardContent="Cita con el médico"
            />
            <CardRPF
              hasObj={false}
              cardTitle="Mañana"
              cardContent="Salir a caminar al menos 30 mins"
            />
            <CardRPF
              hasObj={false}
              cardTitle="En 2 días"
              cardContent="Convivir con personas"
            />
            <CardRPF
              hasObj={false}
              cardTitle="En 4 días"
              cardContent="Hablar con alguien"
            />
            <CardRPF
              hasObj={false}
              cardTitle="En 1 mes"
              cardContent="Realizar prueba: Geriatric Depression Scale"
            />
          </div>
        </div>
        <div className="pruebas-section">
          <h2 className="section-title">Mis pruebas</h2>
          <div className="cards-container">
            <CardRPF
              hasObj={true}
              cardTitle="Prueba del Reloj"
              cardContent={{ title: "Resultado:", result: "Positivo" }}
            />
            <CardRPF
              hasObj={true}
              cardTitle="MMSE"
              cardContent={{ title: "Resultado:", result: "25 puntos" }}
            />
          </div>
        </div>
      </section>
      <Footer />
    </div>
  );
};

export default UserView;