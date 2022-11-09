import React from "react";
import NavbarAdmin from "./NavbarAdmin/NavbarAdmin";

import './Dashboard.css'
import dashboardAdmin from '../images/dashboardAdmin-img.png'

const Dashboard = (props) => {    
    return (    
        <div>
            <NavbarAdmin handleLogout={props.handleLogout} />
            <header className="admin-header">
                <span className="circle-admin" id="circle-left-admin"></span>
                <span className="circle-admin" id="circle-right-admin"></span>
                <div className="admin-title-section">
                    <h2>Admin Dashboard</h2>
                </div>
            </header>
            <section className="admin-section">
                <div className='dashboard'>            
                    <img width="1000px" src={dashboardAdmin} />                    
                </div>
            </section>
        </div>
    );
};

export default Dashboard;