import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import css from './homePage.module.css'
import {Navigation} from '../../navigation/Navigation'

class HomePage extends Component {
  state = {
    isActive: false
  };
  render() {
    return (
      <div className={css.homePageContainer}>
        <Navigation />
        <h2>this is homepage</h2>
      </div>
    );
  }
}

export default withRouter(HomePage);
