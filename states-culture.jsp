<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>states-culture</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body{
            height: 100vh;
            width: 100vw;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .b
        {
            padding: 30px 70px;
            background-color: white;
            font-size: 20px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            
        }
        .card{
            width: 300px;
            height: 450px;
            border: 2px solid black;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 30px;
        }
        .card img{
            width: 300px;
            height: 400px;
        }
        .states
        {
            display: flex;
        }
        .heading
        {
            padding-top: 100px;
            height: 250px;
            font-family: Arial, Helvetica, sans-serif;
        }
        
    </style>
</head>
<body>
    <div class="heading">
        <h1>Select a State</h1>
    </div>
    <div class="states">
        <div class="card">
            <img src="photos/ap.jpg" alt="">
            <a href="culture-ap.jsp"><button class="b">Andhra Pradesh</button></a>
        </div>

        <div class="card">
            <img src="photos/uk.png" alt="">
            <a href="culture-uk.jsp"><button class="b">Uttarakhand</button></a>
        </div>
    </div>
</body>
</html>