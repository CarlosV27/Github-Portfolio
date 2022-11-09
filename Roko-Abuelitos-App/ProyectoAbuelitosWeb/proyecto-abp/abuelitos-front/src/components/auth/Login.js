import React, { Component } from "react";
import { Link } from "react-router-dom";
import axios from "axios";

import abuelito1 from "../../images/abuelito-1.png";
import "./Login.css";

import logo from '../../images/logo.png';

export default class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      password: "",
      loginErrors:
        "There was an error with your registration. Please try again or contact with us.",
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSuccessfulAuthAdmin = this.handleSuccessfulAuthAdmin.bind(this);
    this.handleSuccessfulAuthDoctor = this.handleSuccessfulAuthDoctor.bind(this);
    this.handleSuccessfulAuthUser = this.handleSuccessfulAuthUser.bind(this);
  }

  handleSuccessfulAuthAdmin(data) {
    // TODO's -> update parent component
    this.props.handleLogin(data); // this is the function that is called from rails api
    this.props.history.push("/dashboard"); // this is the route we set up in the backend
  }

  handleSuccessfulAuthDoctor(data) {
    // TODO's -> update parent component
    this.props.handleLogin(data); // this is the function that is called from rails api
    this.props.history.push("/doctor"); // this is the route we set up in the backend
  }

  handleSuccessfulAuthUser(data) {
    // TODO's -> update parent component
    this.props.handleLogin(data); // this is the function that is called from rails api
    this.props.history.push("/user"); // this is the route we set up in the backend
  }

  handleChange(event) {
    // this is the function that is called from rails api
    this.setState({
      [event.target.name]: event.target.value,
    });
  }

  handleSubmit(event) {
    // this is the function that is called from rails api
    const { email, password } = this.state;

    axios
      .post(
        "http://localhost:3001/sessions", // this is the route we set up in the backend
        {
          user: {
            email: email,
            password: password,
          },
        },
        { withCredentials: true }
      )
      .then((response) => {
        if (response.data.logged_in) {
          let currentUser = response.data.user.email;
          
          let checkAdmin = currentUser.search(/admin@iepam.com/);
          let checkDoctor = currentUser.search(/@iepam.com/);
          console.log("Check admin: " + checkAdmin);
          console.log("Check doctor: " + checkDoctor);
          if (checkAdmin != -1) {
            console.log("admin");
            this.handleSuccessfulAuthAdmin(response.data);
          } else if (checkDoctor != -1) {
            this.handleSuccessfulAuthDoctor(response.data);
            console.log("doctor");
          } else {
            this.handleSuccessfulAuthUser(response.data);
            console.log("user");
          }
        }
        console.log("si entramos a login")
        console.log("login successful");
      })
      .catch((error) => {
        console.log("login error :(((((((", error);
      });
    event.preventDefault();
  }

  render() {
    return (
      <section id="inicio-sesion-section">
        <div className="inicio-sesion-content">
          <div className="inicio-sesion-navbar">
            <div className="logo-container">
              <Link to="/" >
                <img id="logo" src={logo} />
              </Link>
            </div>
            <nav className="inicio-sesion-nav-menu">
              <ul>
                <li>
                  <Link
                    to="/inicio-sesion"
                    className="link"
                    id="iniciar-sesion-active"
                  >
                    Iniciar Sesión
                  </Link>
                </li>
                <li>
                  <Link to="/registro" className="link">
                    Registrarse
                  </Link>
                </li>
              </ul>
            </nav>
          </div>

          <div className="form-section-login">
            <div className="form-content">
              <h2>Iniciar Sesión</h2>
              <p>Ingresa tu correo y contraseña para entrar a tu perfil</p>
              <form onSubmit={this.handleSubmit}>
                <div>
                  <label htmlFor="correo">Correo:</label>
                  <input
                    id="correo"
                    name="email"
                    type="email"
                    placeholder="Ej. tucorreo@email.com..."
                    value={this.state.email}
                    onChange={this.handleChange}
                    required
                  />
                </div>

                <div>
                  <label htmlFor="contraseña">Contraseña:</label>
                  <input
                    id="contraseña"
                    name="password"
                    type="password"
                    placeholder="Contraseña..."
                    value={this.state.password}
                    onChange={this.handleChange}
                    required
                  />
                  <span>¿Olvidaste tu contraseña?</span>
                </div>

                <div className="inicio-sesion-btns">
                  <Link
                    to="/registro"
                    className="inicio-sesion-btn"
                    id="no-cuenta-btn"
                  >
                    ¿No tienes cuenta?
                  </Link>
                  <button
                    className="inicio-sesion-btn"
                    id="inicia-sesion-btn"
                    type="submit"
                  >
                    Iniciar Sesión
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div className="inicio-sesion-decoration">
          <span className="circle circle-top"></span>
          <span className="line line-top"></span>
          <span className="circle circle-center"></span>
          <span className="square square-center"></span>
          <div className="inicio-sesion-img-container">
            <img
              src={abuelito1}
              alt="Foto de una persona adulto mayor"
              width="100%"
            />
          </div>
        </div>
      </section>
    );
  }
}
