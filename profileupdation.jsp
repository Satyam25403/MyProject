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
                
                  <select id="Profession" name="Profession">
                      <option value="">Select a Profession</option>
                      <option value="Photographer">Photographer</option>
                      <option value="Videographer">Videographer</option>
                      <option value="Musician">Musician</option>
                      <option value="Singer">Singer</option>
                      <option value="Travel Guide">Travel Guide</option>
                      <option value="Event Planner">Event Planner</option>
                      <option value="Hotel Manager">Hotel Manager</option>
                      <option value="Dancer">Dancer</option>
                      <option value="Painter">Painter</option>
                      <option value="Textile">Textile</option>
                      <option value="Poet">Poet</option>
                      <option value="Craftsmen">Craftsmen</option>
                  </select><label for="Profession">Profession:</label><br><br>
            </div>
            
                <!-- State Dropdown -->
                              <div class="input-group">
    <i class="fas fa-map-marker-alt"></i>
    <select id="State" name="state">
        <option value="">Select a State</option>
        
        <option value="Andhra Pradesh">Andhra Pradesh</option>
        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
        <option value="Assam">Assam</option>
        <option value="Bihar">Bihar</option>
        <option value="Chhattisgarh">Chhattisgarh</option>
        <option value="Goa">Goa</option>
        <option value="Gujarat">Gujarat</option>
        <option value="Haryana">Haryana</option>
        <option value="Himachal Pradesh">Himachal Pradesh</option>
        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
        <option value="Jharkhand">Jharkhand</option>
        <option value="Karnataka">Karnataka</option>
        <option value="Kerala">Kerala</option>
        <option value="Madhya Pradesh">Madhya Pradesh</option>
        <option value="Maharashtra">Maharashtra</option>
        <option value="Manipur">Manipur</option>
        <option value="Meghalaya">Meghalaya</option>
        <option value="Mizoram">Mizoram</option>
        <option value="Nagaland">Nagaland</option>
        <option value="Odisha">Odisha</option>
        <option value="Punjab">Punjab</option>
        <option value="Rajasthan">Rajasthan</option>
        <option value="Sikkim">Sikkim</option>
        <option value="Tamil Nadu">Tamil Nadu</option>
        <option value="Telangana">Telangana</option>
        <option value="Tripura">Tripura</option>
        <option value="Uttar Pradesh">Uttar Pradesh</option>
        <option value="Uttarakhand">Uttarakhand</option>
        <option value="West Bengal">West Bengal</option>
        
        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
        <option value="Chandigarh">Chandigarh</option>
        <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
        <option value="Delhi">Delhi</option>
        <option value="Lakshadweep">Lakshadweep</option>
        <option value="Puducherry">Puducherry</option>
        <option value="Ladakh">Ladakh</option>
    </select>
    <label for="State">State:</label><br><br>
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