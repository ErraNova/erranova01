<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.monportfolio.model.Contact" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation - Mohamed Erra</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #001a3d 0%, #003d7a 100%);
            min-height: 100vh;
            color: white;
        }
        
        header {
            background: rgba(0, 0, 0, 0.3);
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        header h1 {
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        
        nav {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }
        
        nav a {
            color: white;
            text-decoration: none;
            font-size: 1.1em;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s;
            background: rgba(255,255,255,0.1);
        }
        
        nav a:hover {
            background: #007BFF;
            transform: translateY(-2px);
        }
        
        main {
            padding: 60px 0;
        }
        
        section {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .success-icon {
            font-size: 4em;
            color: #28a745;
            margin-bottom: 20px;
        }
        
        section p {
            font-size: 1.2em;
            line-height: 1.8;
            margin-bottom: 15px;
        }
        
        section b {
            color: #4dabf7;
        }
        
        blockquote {
            background: rgba(0, 123, 255, 0.2);
            border-left: 4px solid #007BFF;
            padding: 20px;
            margin: 25px 0;
            border-radius: 8px;
            font-style: italic;
            text-align: left;
        }
        
        .btn-back {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1em;
            transition: all 0.3s;
        }
        
        .btn-back:hover {
            background: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(0,