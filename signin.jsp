<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register and Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
  <div class="container" id="signIn">
        <h1 class="form-title">Sign In</h1>
        <form method="post" action="Signin">
          <div id="signInMessage" class="messageDiv" style="display:none;"></div>


          <div class="input-group">
              <i class="fas fa-envelope"></i>
              <input type="email"  name="email1" placeholder="Email" required>
              <label for="email1">Email</label>
          </div>

          <div class="input-group">
              <i class="fas fa-lock"></i>
              <input type="password" name="password1"  placeholder="Password" required>
              <label for="password1">Password</label>
          </div>

         
         <button  class="btn"  name="submitSignIn">Sign In</button>
         
        </form>
        <div class="links">
          <a href="forgotpassword.jsp">Forgot password?</a><br><br>
          <p>Don't have an account?</p>
          <a href="signup.jsp">Register</a>
          <button name="signUpButton"></button>
          
      </div>
      </div>
      
</body>
</html>