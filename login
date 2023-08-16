import React, { useState } from 'react';
import classes from  './LoginBox.module.css';

const LoginBox = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleUsernameChange = (e) => {
    setUsername(e.target.value);
  };

  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
  };

  const validateUsername = () => {
    const containsLetters = /[a-zA-Z]/.test(username);
    const containsNumbers = /[0-9]/.test(username);
    return containsLetters && containsNumbers;
  };

  const validatePassword = () => {
    const containsUppercase = /[A-Z]/.test(password);
    const containsSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(password);
    const isValid = /^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+$/.test(password);
    return isValid && containsUppercase && containsSpecialChar;
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    
    if (!validateUsername()) {
      alert("Username must contain numbers and letters only.");
      return;
    }

    if (!validatePassword()) {
      alert("Password must contain alphanumeric values only.");
      return;
    }

    alert("Form submitted successfully!");
  };

  return (
    <div className={classes["login-box"]}>
      <div className={classes["logo"]}>
        <img src="assets/download1.png" alt="" />
      </div>
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <div className={classes["user-box"]}>
          <input
            type="text"
            name="username"
            value={username}
            onChange={handleUsernameChange}
            required
          />
          <label>Username</label>
        </div>
        <div className={classes["user-box"]}>
          <input
            type="password"
            name="password"
            value={password}
            onChange={handlePasswordChange}
            required
          />
          <label>Password</label>
        </div>
        <button type="submit">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          Submit
        </button>
      </form>
    </div>
  );
};

export default LoginBox;


/* LoginBox.css */
/* 
html {
  height: 100%;
}

body {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: linear-gradient(#21a7fa, #0e335e);
} */

.logo {
  display: inline-block;
  margin-left: 9px;
  margin-bottom: 20px;
}

img {
  width: 190px;
  height: 70px;
}

.button-container {
  perspective: 800px;
}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  padding-top: 35px;
  transform: translate(-50%, -50%);
  background: rgb(255, 255, 255);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0, 0, 0, 0.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #0c77b9;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #0c77b9;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #0c77b9;
  outline: none;
  background: transparent;
}

.login-box .user-box label {
  position: absolute;
  top: 0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #0c77b9;
  pointer-events: none;
  transition: 0.5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #0c77b9;
  font-size: 12px;
}

.login-box form button {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  background-color: #009e42;
  color: #ffffff;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: 0.5s;
  margin-top: 40px;
  letter-spacing: 4px;
}

.login-box button {
  position: absolute;
  display: block;
}






