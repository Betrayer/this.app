import React, { Component } from "react";
import { withRouter } from 'react-router-dom'
import css from './toDoList.module.css'
import {Navigation} from '../navigation/Navigation'
import axios from "axios";

class TodoList extends Component {
  state = {
    todoList: []
  };
  //=====================================================
  async componentDidMount() {
    // axios.post("https://initialproject-b512b.firebaseio.com/todoList.json", {
    //   todo: "smth"
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
    await this.postToDo({ todo: value });
    this.getInitialData();
  };

  postToDo = async todo => {
    try {
      await axios.post(
        "https://initialproject-b512b.firebaseio.com/todoList.json",
        todo
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
      <div className={css.todoListWrapper}>
        <Navigation />
        <h2>this is todo</h2>
        <form onSubmit={this.handleSubmit}>
          <input type="text" name="todo" />
          <button>Post</button>
        </form>
        <ul className={css.todoList}>
          {todoList.map(todo => (
            <li key={todo.id}>
              <p>{todo.todo}</p>
              <button onClick={() => this.deleteToDo(todo.id)}>
                Delete
              </button>
            </li>
          ))}
        </ul>
      </div>
    );
  }
}

export default withRouter(TodoList);
