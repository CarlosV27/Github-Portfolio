import React, { Component } from "react";
import Header from "./Header/Header";
import Card from "./Card/Card";
import Footer from "./Footer/Footer";


import "./Home.css";


export default class Home extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <Header />
        <main>
          <section>
            <div className="main-content-container">
              <h1>Queremos transformar el sistema geriátrico en México</h1>
              <p>
                Con nuestro sistema digital obtienes grandes beneficios para tu
                salud como persona adulta mayor.
              </p>
            </div>
            <div className="cards-homepage-container">
              <Card
                cardInitialParagraph="Para nuestros doctores y servicios médicos."
                cardTitle="¿Eres doctor o realizas pruebas médicas?"
                linkTo="/inicio-sesion"
              />
              <Card
                cardInitialParagraph="Para nuestros pacientes y usuarios en nuestro sistema."
                cardTitle="¿Quieres visualizar tus pruebas ya realizadas?"
                linkTo="/inicio-sesion"
              />
              <Card
                cardInitialParagraph="Para todas las personas nuevas en nuestro sistema."
                cardTitle="¿No estás registrado aún?"
                linkTo="/registro"
              />
            </div>
          </section>
          <section>
            <div className="info-img-container">
              <div className="info-content">
                <h2 className="info-content-title">
                  ¿Quieres ser parte de nuestra iniciativa?
                </h2>
                <span className="circle-btn" id="info-dona-btn">
                  Dona
                </span>
                <span className="circle-btn" id="info-equipo-btn">
                  Se parte de nuestro equipo
                </span>
                <span className="circle-btn" id="info-investigacion-btn">
                  Haz investigación con nosotros
                </span>
              </div>
            </div>
          </section>          
        </main>
        <Footer />
      </div>
    );
  }
}