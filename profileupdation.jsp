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
        <div class="container" id="signup">
            <h1 class="form-title">Register</h1>
            <form method="post" action="Update"> <!-- Action should point to a valid servlet or JSP for processing -->
            
                <!-- Name Input -->
                <div class="input-group"> 
                    <i class="fas fa-user"></i>
                    <input type="text" name="Name" placeholder="Name" required>
                    <label for="Name">Name</label>
                </div>
            
                <!-- Country Dropdown -->
                <div class="input-group">
                    <i class="fas fa-map-marker"></i>
                    <select id="Country" name="Country" required>
                        <option value="">Select a country</option>
                        <option value="IN">India</option>
                        <option value="US">United States</option>
                        <!-- Add other countries as necessary -->
                    </select>
                    <label for="Country">Country</label>
                </div>
            
                <!-- Date of Birth -->
                <div class="input-group">
                    <i class="fas fa-plus-square"></i>
                    <input type="date" name="dob" placeholder="Date of birth" required>
                    <label for="dob">Date of Birth</label>
                </div>
            
                <!-- Profession Dropdown -->
                <div class="input-group">
                    <i class="fas fa-mortar-board"></i>
                    <select id="Profession" name="Profession" required>
                        <option value="">Select a Profession</option>
                        <option value="Photographer">Photographer</option>
                        <option value="Videographer">Videographer</option>
                        <option value="Musician">Musician</option>
                        <!-- Add other professions -->
                    </select>
                    <label for="Profession">Profession</label>
                </div>
            
                <!-- State Dropdown -->
                <div class="input-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <select id="State" name="State" required>
                        <option value="">Select a State</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <!-- Add other states -->
                    </select>
                    <label for="State">State</label>
                </div>
            
                <!-- Phone Number -->
                <div class="input-group">
                    <i class="fas fa-phone"></i>
                    <input type="tel" name="phone" placeholder="Phone Number" required>
                    <label for="phone">Phone Number</label>
                </div>
                
                <!-- Hidden Email Field (passed through the session) -->
                <%  
                    String email = request.getParameter("email");  
                    session.setAttribute("email", email); 
                %>
                <input type="hidden" name="email" value="<%= email %>">
            
                <!-- Submit Button -->
                <div class="input-group">
                    <input type="submit" value="Update Details">
                </div>
            </form>
        </div>
    </body>
</html>
