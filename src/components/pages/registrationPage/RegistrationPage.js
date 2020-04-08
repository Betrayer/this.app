import React, { Component } from "react";
import firebase from "../../../config";
import { withRouter } from "react-router-dom";
import css from "./registrationPage.module.css";

class RegistrationPage extends Component {
  state = {
    message: null,
    email: "",
    password: "",
  };

  //   componentDidMount() {
  //   console.log("user created");
  //   this.createUser("test@test.com", "qwerty");
  // }

  createUser = async (email, password) => {
    try {
      await firebase.auth().createUserWithEmailAndPassword(email, password);
    } catch (error) {
      this.setState({ message: error.message });
    }
  };

  handleChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const { email, password } = this.state;
    this.createUser(email, password);
  };

  render() {
    const { message } = this.state;
    return (
      <div className={css.registrationPageContainer}>
        <h2>this is register page</h2>
        {message ? <h2>{message}</h2> : <h2>Greetings, new user!</h2>}
        <form className={css.registrationForm} onSubmit={this.handleSubmit}>
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
          <button type="submit">Submit</button>
        </form>
        <button onClick={() => this.props.history.push("/login")}>Login</button>
      </div>
    );
  }
}

export default withRouter(RegistrationPage);
