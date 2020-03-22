import React, { Component } from "react";
import firebase from "../../config";
import { withRouter } from "react-router-dom";

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
  };

  render() {
    const { message } = this.state;
    return (
      <div>
        <h2>this is login page</h2>

        {message ? <h2>{message}</h2> : <h2>Welcome back!</h2>}
        <form onSubmit={this.handleSubmit}>
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
