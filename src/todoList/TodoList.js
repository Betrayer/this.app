import React, { Component } from "react";
import { withRouter } from 'react-router-dom'

import axios from "axios";

class TodoList extends Component {
  state = {
    todoList: []
  };
  //=====================================================
  async componentDidMount() {
    // axios.post("https://initialproject-b512b.firebaseio.com/todoList.json", {
    //   wish: "smth"
    // });
    // ===================================================
    this.getInitialData();
  }

  getInitialData = async () => {
    const data = await axios.get(
      "https://initialproject-b512b.firebaseio.com/todoList.json"
    );

    const transform = Object.keys(data.data).map(key => ({
      ...data.data[key],
      id: key
    }));
    this.setState({
      todoList: transform
    });
  };

  handleSubmit = async e => {
    e.preventDefault();
    const value = e.target.elements[0].value;
    await this.postToDo({ wish: value });
    this.getInitialData();
  };

  postToDo = async wish => {
    try {
      await axios.post(
        "https://initialproject-b512b.firebaseio.com/todoList.json",
        wish
      );
    } catch (er) {
      console.log(er);
    }
  };

  deleteToDo = async id => {
    try {
      await axios.delete(
        `https://initialproject-b512b.firebaseio.com/todoList/${id}.json`
      );
      this.getInitialData();
    } catch (er) {
      console.log(er);
    }
  };
  render() {
    const { todoList } = this.state;
    console.log(todoList);
    return (
      <>
        <h2>this is todo</h2>
        <form onSubmit={this.handleSubmit}>
          <input type="text" name="wish" />
          <button>Post</button>
        </form>
        <ul>
          {todoList.map(wish => (
            <li key={wish.id}>
              <p>{wish.wish}</p>
              <button onClick={() => this.deleteToDo(wish.id)}>
                Delete
              </button>
            </li>
          ))}
        </ul>
      </>
    );
  }
}

export default withRouter(TodoList);
