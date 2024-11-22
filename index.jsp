<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trinity</title>
    <link rel="stylesheet" href="Trinity.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!------------------------------------------------------------------- navigation ------------------------------------------------------------->
    <header>
        <div class="logo">
            <span class="title">Trinity</span>
        </div>
        <nav>
                <h4><a href="">Home</a></h4>
                <h4><a href="#arts-field">Arts</a></h4>
                <h4><a href="#culture-field">Culture</a></h4>
                <h4><a href="#tradition-field">Tradition</a></h4>
                <h4><a href="#tourism-field">Tourism</a></h4>
        </nav>
        <div class="credentials">
            <a href="signup.jsp"><button class="login"><i class="fa-solid fa-user" style="color: #784b55;"></i>Register/login</button></a>
        </div>
    </header>

    <!---------------------------------------------------------- introduction to fields ---------------------------------------------------------->
    
    <div class="welcome-page">
        <h1>Welcome to the heart of India</h1>
    </div>

    <div class="arts-field" id="arts-field">
       
         <div class="arts-buttons">
            <div>
                <h1 class="arts-h1">Arts section</h1>
            </div>
            <div class="buttons">
                <a href="signupartist.jsp"><button class="register" title="Want to show case your talent register here ">Register as an artist</button></a>
            </div>
         </div>
        <p>Historical art reflects the culture and values of its time, evolving from symbolic cave paintings to the realism of the Renaissance and the drama of the Baroque. Influenced by society, materials, and patronage, it documented history, expressed beliefs, and paved the way for modern art's experimentation and abstraction.</p>
        <a href="states-arts.jsp"><button class="explore">Explore more</button></a>
    </div>

    <div class="culture-field" id="culture-field">
        <h1>Culture section</h1>
        <p>Culture encompasses the beliefs, practices, art, and traditions of a society, reflecting its identity and values. It evolves through history, influenced by geography, religion, and interaction with other cultures, shaping languages, customs, and ways of life. Culture preserves heritage while adapting to change, bridging the past and present.</p>
        <a href="states-culture.jsp"><button class="explore">Explore more</button></a>
    </div>

    <div class="tradition-field" id="tradition-field">
        <h1>Tradition section</h1>
        <p>Tradition refers to the customs, rituals, and practices passed down through generations, shaping a community’s identity. It reflects a society's values, beliefs, and way of life, often tied to cultural, religious, or historical events. While traditions evolve over time, they help preserve heritage and foster a sense of continuity and belonging.</p>
        <a href="states-tradition.jsp"><button class="explore">Explore more</button></a>
    </div>

    <div class="tourism-field" id="tourism-field">
        <h1>Tourism section</h1>
        <p>Tourism involves traveling for leisure, exploration, or cultural exchange, often to experience new places, traditions, and natural wonders. It drives economic growth, promotes cultural understanding, and fosters global connections. While tourism offers personal enrichment, it can also impact local environments and communities, requiring sustainable practices.</p>
        <a href="https://googlemaps.com"><button class="explore">Explore more</button></a>   
    </div>

    <script src="scripts/Trinity.js"></script>
</body>
</html>