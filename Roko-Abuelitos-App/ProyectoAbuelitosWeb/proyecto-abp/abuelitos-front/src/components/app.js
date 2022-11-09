import React, { Component } from "react";
import { BrowserRouter, Switch, Route, Redirect } from "react-router-dom";
import axios from "axios";
import Home from "./Home";
import Dashboard from "./Dashboard";
import Login from "./auth/Login";
import Registration from "./auth/Registration";
import DoctorView from "./DoctorView/DoctorView";
import DoctorRegister from "./DoctorRegister/DoctorRegister";
import UserView from "./UserView/UserView";
import Pruebas from "./Pruebas/Pruebas";
import Perfil from "./Perfil/Perfil";

import "./app.css";

export default class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      loggedInStatus: "NOT_LOGGED_IN",
      user: {},
    };

    this.handleLogin = this.handleLogin.bind(this);
    this.handleLogout = this.handleLogout.bind(this);    
  }  

  checkLoginStatus() {
    axios
      .get("http://localhost:3001/logged_in", { withCredentials: true })
      .then((response) => {
        // withCredentials: true is a way to send cookies to the backend server
        // console.log("logged_in", response);
        if (
          response.data.logged_in &&
          this.state.loggedInStatus === "NOT_LOGGED_IN"
        ) {
          this.setState({
            loggedInStatus: "LOGGED_IN",
            user: response.data.user,
          });
        } else if (
          !response.data.logged_in &&
          this.state.loggedInStatus === "LOGGED_IN"
        ) {
          this.setState({
            loggedInStatus: "NOT_LOGGED_IN",
            user: {},
          });
        }
      })
      .catch((error) => {
        console.log("check login error", error);
      });
  }

  componentDidMount() {
    this.checkLoginStatus();
  }

  handleLogout() {        
    axios.delete("http://localhost:3001/logout", { withCredentials: true }).then(response => {      
      this.setState({
        loggedInStatus: "NOT_LOGGED_IN",
        user: {},
      });
      if (this.loggedInStatus == "NOT_LOGGED_IN") {
        <Redirect to="/" />
      }            
    }).catch(error => {
    console.log("logout error", error);
    });
  }

  handleLogin(data) {
    this.setState({
      loggedInStatus: "LOGGED_IN",
      user: data.user,
    });
  }


  render() {
    return (
      <div className="app">
        <BrowserRouter>
          <Switch>
            <Route
              exact
              path={"/"}
              render={(props) => (
                <Home
                  {...props}
                  handleLogin={this.handleLogin}
                  loggedInStatus={this.state.loggedInStatus}
                  handleLogout={this.handleLogout}
                />
              )}            />

            <Route
              exact
              path={"/dashboard"}
              render={(props) => (
                <Dashboard
                  {...props}
                  loggedInStatus={this.state.loggedInStatus}
                  handleLogout={this.handleLogout}
                />
              )}
            />

            <Route path="/inicio-sesion" render={(props) => (
              <Login
                {...props}
                handleLogin={this.handleLogin}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />
            
            <Route path="/registro" render={(props) => (
              <Registration
                {...props} 
                handleLogin={this.handleLogin}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />

            <Route path="/doctor" render={(props) => (
              <DoctorView
                {...props}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />

            <Route path="/doctor-register" render={(props) => (
              <DoctorRegister
                {...props} 
                handleLogin={this.handleLogin}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />
            
            <Route path="/user" render={(props) => (
              <UserView
                {...props}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />
            
            <Route path="/pruebas" render={(props) => (
              <Pruebas
                {...props}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />
            
            <Route path="/perfil" render={(props) => (
              <Perfil
                {...props}
                loggedInStatus={this.state.loggedInStatus}
                handleLogout={this.handleLogout}
              />
            )} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}