import React, { Component } from "react";
import axios from "axios";

class App extends Component {
  state = {
    wishes: []
  };
  //=====================================================
  async componentDidMount() {
    // axios.post("https://initialproject-b512b.firebaseio.com/wishes.json", {
    //   wish: "smth"
    // });
    // ===================================================
    this.getSmth();
  }

  getSmth = async () => {
    const data = await axios.get(
      "https://initialproject-b512b.firebaseio.com/wishes.json"
    );

    const transform = Object.keys(data.data).map(key => ({
      ...data.data[key],
      id: key
    }));
    this.setState({
      wishes: transform
    });
  };

  handleSubmit = async e => {
    e.preventDefault();
    const value = e.target.elements[0].value;
    await this.putWish({ wish: value });
    this.getSmth();
  };

  putWish = async wish => {
    try {
      await axios.post(
        "https://initialproject-b512b.firebaseio.com/wishes.json",
        wish
      );
    } catch (er) {
      console.log(er);
    }
  };

  deleteWish = async id => {
    try {
      await axios.delete(
        `https://initialproject-b512b.firebaseio.com/wishes/${id}.json`
      );
      this.getSmth();
    } catch (er) {
      console.log(er);
    }
  };

  render() {
    const { wishes } = this.state;
    console.log(wishes);
    return (
      <>
        <form onSubmit={this.handleSubmit}>
          <input type="text" name="wish" />
          <button>LEGGO</button>
        </form>
        <ul>
          {wishes.map(wish => (
            <li key={wish.id}>
              <h2>{wish.wish}</h2>
              <button onClick={() => this.deleteWish(wish.id)}>
                DILIT DIS
              </button>
            </li>
          ))}
        </ul>
      </>
    );
  }
}

export default App;
