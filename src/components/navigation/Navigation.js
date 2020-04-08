import React from 'react'
import { NavLink } from 'react-router-dom';

export const Navigation = () => {
    return (
        <ul>
            <li><NavLink exact to='/home'>Home</NavLink></li>
            <li><NavLink exact to='/home/todo'>TO-DO</NavLink></li>
            <li>smth else</li>
        </ul>
    )
}

