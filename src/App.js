import React, { Component } from "react";
import firebase from "./config";
import { BrowserRouter as Router } from "react-router-dom";
import { useRouter } from "./router";
import css from "./app.module.css";

class App extends Component {
  state = { userStatus: null };

  componentDidMount() {
    this.onStateChanged();
  }

  onStateChanged = async () => {
    await firebase.auth().onAuthStateChanged(user => {
      this.setState({ userStatus: user });
    });
  };

  signOut = () => {
    firebase.auth().signOut();
  };

  render() {
    const { userStatus } = this.state;
    const routing = useRouter(false);
    return (
      <div className={css.signOutContainer}>
        {userStatus && (
          <button className={css.signOut} onClick={this.signOut}>
            Sign out from {userStatus.email}
          </button>
        )}
        <Router>{routing}</Router>
      </div>
    );
  }
}

export default App;
