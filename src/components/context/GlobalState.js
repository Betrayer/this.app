import React, { Component } from "react";
import { GlobalContext } from "./GlobalContext";
import firebase from "../../config";
import { useRouter } from "../../router";

class GlobalState extends Component {
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
    this.props.history.push("/");
  };

  render() {
    const { userStatus } = this.state;
    const routing = useRouter(userStatus);
    return (
      <GlobalContext.Provider
        value={{
          userStatus,
          signOut: this.signOut,
          onStateChanged: this.onStateChanged,
          routing
        }}
      >
        {this.props.children}
      </GlobalContext.Provider>
    );
  }
}

export default GlobalState;
