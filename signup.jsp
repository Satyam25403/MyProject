<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register and Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="style.css">
        
        
    </head>
    <body>
        <div class="container" id="signup" >
            <h1 class="form-title">Register</h1>
      
            <form method="post" action="Signup">
      
              <div class="input-group"> 
                 <i class="fas fa-user"></i>
                 <input type="text"  name="Name" placeholder="First Name" required>
                 <label for="Name">Name</label>
              </div>

                <div class="input-group">
              <i class="fas fa-envelope"></i>
              <input type="email"  name="email" placeholder="Email" required>
              <label for="email">Email</label>
                </div>

            <div class="input-group">
              <i class="fas fa-lock"></i>
              <input type="password" name="password"  placeholder="Password" required>
              <label for="password">Password</label>
            </div>
              
             <button class="btn" name="submit" >Sign Up</button>
            </form>
            <div class="links">
                <p>Already have an account?</p>
                <a href="signin.jsp">Login</a>
                <button name="signInButton"></button>
                
            </div>
              
          </div>
    </body>
</html>