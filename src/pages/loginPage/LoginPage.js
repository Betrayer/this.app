import React, { Component } from 'react'


class LoginPage extends Component {
  state = {  }
  render() {
    return (
      <div>
      <h2>this is login page</h2>

      <form>
        <input placeholder="login"></input>
        <input placeholder="password"></input>
      </form>
    </div>
    );
  }
}

export default LoginPage;
