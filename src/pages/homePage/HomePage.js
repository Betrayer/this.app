import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import css from './homePage.module.css'

class HomePage extends Component {
  state = {
    isActive: false
  };
  render() {
    return (
      <div className={css.homePageContainer}>
        <h2>this is homepage</h2>
      </div>
    );
  }
}

export default withRouter(HomePage);
