import React, { Component } from "react";
import firebase from "../../../config";
import { withRouter } from "react-router-dom";
import css from "./loginPage.module.css";

class LoginPage extends Component {
  state = {
    message: null,
    email: "",
    password: ""
  };

  createUser = async (email, password) => {
    try {
      await firebase.auth().signInWithEmailAndPassword(email, password);
    } catch (error) {
      this.setState({ message: error.message });
    }
  };

  handleChange = e => {
    this.setState({
      [e.target.name]: e.target.value
    });
  };

  handleSubmit = e => {
    e.preventDefault();
    const { email, password } = this.state;
    this.createUser(email, password);
    this.props.history.push("/home");
  };

  render() {
    const { message } = this.state;
    return (
      <div className={css.loginPageContainer}>
        <h2>this is login page</h2>

        {message ? <h2>{message}</h2> : <h2>Welcome back!</h2>}
        <form className={css.loginForm} onSubmit={this.handleSubmit}>
          <input
            placeholder="email"
            name="email"
            type="email"
            onChange={this.handleChange}
          ></input>
          <input
            placeholder="password"
            name="password"
            type="password"
            onChange={this.handleChange}
          ></input>
          <button type="submit">Login</button>
        </form>
        <button
          onClick={() => {
            this.props.history.push("/registration");
          }}
        >
          Registration
        </button>
      </div>
    );
  }
}

export default withRouter(LoginPage);
