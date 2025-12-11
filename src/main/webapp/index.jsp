<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Portfolio - Mohamed Erra</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg-primary: #001a3d;
            --bg-secondary: #003d7a;
            --text-primary: #ffffff;
            --text-secondary: #4dabf7;
            --accent-primary: #007BFF;
            --accent-secondary: #0056b3;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, var(--bg-primary) 0%, var(--bg-secondary) 100%);
            min-height: 100vh;
            color: var(--text-primary);
            overflow-x: hidden;
            transition: all 0.5s ease;
        }

        body.light-mode {
            --bg-primary: #f0f4f8;
            --bg-secondary: #e2e8f0;
            --text-primary: #1a202c;
            --text-secondary: #2b6cb0;
            --accent-primary: #3182ce;
            --accent-secondary: #2c5282;
            background: linear-gradient(135deg, var(--bg-primary) 0%, var(--bg-secondary) 100%);
        }

        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            background: rgba(77, 171, 247, 0.3);
            border-radius: 50%;
            animation: float 15s infinite;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) translateX(0) scale(1);
                opacity: 0;
            }
            10% {
                opacity: 0.5;
            }
            90% {
                opacity: 0.5;
            }
            100% {
                transform: translateY(-100vh) translateX(50px) scale(1.5);
                opacity: 0;
            }
        }

        .scroll-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s;
            z-index: 2000;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .scroll-to-top.visible {
            opacity: 1;
            visibility: visible;
        }

        .scroll-to-top:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.6);
        }

        .scroll-to-top::before {
            content: '↑';
            font-size: 1.5em;
            color: white;
            font-weight: bold;
        }

        .theme-toggle {
            position: fixed;
            top: 120px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            z-index: 2000;
            border: 2px solid rgba(255, 255, 255, 0.2);
        }

        .theme-toggle:hover {
            transform: scale(1.1) rotate(15deg);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .theme-toggle .icon {
            font-size: 1.5em;
            transition: transform 0.3s;
        }

        .hamburger {
            display: none;
            flex-direction: column;
            gap: 5px;
            cursor: pointer;
            padding: 10px;
            z-index: 1001;
        }

        .hamburger span {
            width: 25px;
            height: 3px;
            background: var(--text-primary);
            transition: all 0.3s;
            border-radius: 3px;
        }

        .hamburger.active span:nth-child(1) {
            transform: rotate(45deg) translate(8px, 8px);
        }

        .hamburger.active span:nth-child(2) {
            opacity: 0;
        }

        .hamburger.active span:nth-child(3) {
            transform: rotate(-45deg) translate(7px, -7px);
        }

        .mobile-menu {
            display: none;
            position: fixed;
            top: 0;
            right: -100%;
            width: 300px;
            height: 100vh;
            background: rgba(0, 26, 61, 0.95);
            backdrop-filter: blur(10px);
            padding: 80px 30px 30px 30px;
            transition: right 0.4s ease;
            z-index: 1000;
            box-shadow: -5px 0 20px rgba(0,0,0,0.5);
        }

        body.light-mode .mobile-menu {
            background: rgba(240, 244, 248, 0.95);
        }

        .mobile-menu.active {
            right: 0;
        }

        .mobile-menu nav {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .mobile-menu nav a {
            color: var(--text-primary);
            text-decoration: none;
            font-size: 1.2em;
            padding: 15px 20px;
            border-radius: 10px;
            transition: all 0.3s;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.1);
        }

        .mobile-menu nav a:hover, .mobile-menu nav a.active {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            transform: translateX(-5px);
        }

        header {
            background: rgba(0, 0, 0, 0.3);
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
        }

        body.light-mode header {
            background: rgba(255, 255, 255, 0.3);
        }

        header h1 {
            font-size: 2em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.8);
            font-weight: 300;
            letter-spacing: 2px;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        header h1 img {
            height: 50px;
            width: auto;
            object-fit: contain;
        }

        .header-wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 1;
        }

        nav {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            align-items: center;
        }

        nav a {
            color: var(--text-primary);
            text-decoration: none;
            font-size: 1em;
            padding: 12px 24px;
            border-radius: 25px;
            transition: all 0.3s;
            background: rgba(255,255,255,0.05);
            position: relative;
            overflow: hidden;
            font-weight: 300;
            letter-spacing: 0.5px;
            border: 1px solid rgba(255,255,255,0.1);
        }

        nav a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        nav a:hover::before {
            left: 100%;
        }

        nav a:hover, nav a.active {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
            border-color: var(--accent-primary);
        }

        main {
            padding: 100px 0 60px 0;
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
        }

        .hero-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
            margin-bottom: 60px;
        }

        .hero-content {
            opacity: 0;
            animation: slideInLeft 0.8s ease forwards;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .hero-content h2 {
            font-size: 3em;
            margin-bottom: 20px;
            color: var(--text-secondary);
            line-height: 1.2;
        }

        .hero-content .highlight {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--text-secondary) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-content p {
            font-size: 1.3em;
            line-height: 1.8;
            margin-bottom: 30px;
            opacity: 0.9;
            color: var(--text-primary);
        }

        .cta-buttons {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 15px 35px;
            border-radius: 30px;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: bold;
            transition: all 0.3s;
            display: inline-block;
            border: 2px solid transparent;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.6);
        }

        .btn-secondary {
            background: transparent;
            color: var(--text-secondary);
            border-color: var(--text-secondary);
        }

        .btn-secondary:hover {
            background: rgba(77, 171, 247, 0.1);
            transform: translateY(-3px);
        }

        .hero-image {
            position: relative;
            opacity: 0;
            animation: slideInRight 0.8s ease 0.2s forwards;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .hero-visual {
            width: 100%;
            height: 500px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        body.light-mode .hero-visual {
            background: rgba(255, 255, 255, 0.6);
            border: 1px solid rgba(0,0,0,0.1);
        }

        .hero-visual img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.8);
        }

        .code-animation {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(0, 123, 255, 0.1), rgba(0, 86, 179, 0.1));
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
            line-height: 1.8;
            color: var(--text-secondary);
            overflow: hidden;
        }

        .code-line {
            opacity: 0;
            animation: typeLine 0.5s ease forwards;
            margin-bottom: 5px;
        }

        .code-line:nth-child(1) { animation-delay: 0.5s; }
        .code-line:nth-child(2) { animation-delay: 0.8s; }
        .code-line:nth-child(3) { animation-delay: 1.1s; }
        .code-line:nth-child(4) { animation-delay: 1.4s; }
        .code-line:nth-child(5) { animation-delay: 1.7s; }
        .code-line:nth-child(6) { animation-delay: 2s; }

        @keyframes typeLine {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .keyword { color: #ff6b6b; }
        .class-name { color: var(--text-secondary); }
        .method { color: #51cf66; }
        .string { color: #ffd43b; }

        .features-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .feature-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            transition: all 0.4s;
            cursor: pointer;
            position: relative;
            height: 400px;
            opacity: 0;
            animation: bounceIn 0.6s ease forwards;
        }

        .feature-card:nth-child(1) { animation-delay: 0.3s; }
        .feature-card:nth-child(2) { animation-delay: 0.5s; }
        .feature-card:nth-child(3) { animation-delay: 0.7s; }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3) rotate(-10deg);
            }
            50% {
                transform: scale(1.05) rotate(5deg);
            }
            70% {
                transform: scale(0.9) rotate(-2deg);
            }
            100% {
                opacity: 1;
                transform: scale(1) rotate(0);
            }
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 50px rgba(0, 123, 255, 0.3);
        }

        .card-image-container {
            width: 100%;
            height: 100%;
            position: relative;
            overflow: hidden;
            transition: all 0.5s;
        }

        .feature-card.active .card-image-container {
            height: 0;
            opacity: 0;
        }

        .card-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .feature-card:hover .card-image {
            transform: scale(1.1);
        }

        .image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, transparent 0%, rgba(0, 26, 61, 0.8) 100%);
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 30px;
            transition: all 0.3s;
        }

        .feature-card:hover .image-overlay {
            background: linear-gradient(to bottom, transparent 0%, rgba(0, 26, 61, 0.9) 100%);
        }

        .feature-icon {
            font-size: 3.5em;
            margin-bottom: 15px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .image-title {
            color: white;
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .click-hint {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9em;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .click-hint::before {
            content: '👆';
            animation: pointUp 1.5s infinite;
        }

        @keyframes pointUp {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        .card-content {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            opacity: 0;
            transform: rotateY(90deg);
            transition: all 0.6s;
        }

        .feature-card.active .card-content {
            opacity: 1;
            transform: rotateY(0);
        }

        .content-icon {
            font-size: 4em;
            margin-bottom: 20px;
            text-align: center;
            animation: zoomIn 0.6s ease;
        }

        @keyframes zoomIn {
            from {
                transform: scale(0);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .card-content h3 {
            font-size: 2em;
            color: white;
            margin-bottom: 15px;
            text-align: center;
            animation: slideInDown 0.6s ease 0.2s backwards;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card-content p {
            color: rgba(255, 255, 255, 0.95);
            font-size: 1.1em;
            line-height: 1.8;
            text-align: center;
            animation: fadeInUp 0.6s ease 0.4s backwards;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .close-button {
            position: absolute;
            top: 15px;
            right: 15px;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5em;
            color: white;
            cursor: pointer;
            transition: all 0.3s;
            backdrop-filter: blur(10px);
        }

        .close-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(90deg);
        }

        .feature-list {
            list-style: none;
            margin-top: 20px;
            animation: fadeInUp 0.6s ease 0.6s backwards;
        }

        .feature-list li {
            color: white;
            padding: 10px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            padding-left: 25px;
        }

        .feature-list li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: #4ade80;
            font-weight: bold;
        }

        .feature-list li:last-child {
            border-bottom: none;
        }

        .feature-card:nth-child(1) .card-content {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .feature-card:nth-child(2) .card-content {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .feature-card:nth-child(3) .card-content {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        footer {
            background: rgba(0, 0, 0, 0.4);
            text-align: center;
            padding: 20px 0;
            position: relative;
            z-index: 1;
        }

        body.light-mode footer {
            background: rgba(255, 255, 255, 0.4);
        }

        footer p {
            color: var(--text-primary);
        }

        @media (max-width: 968px) {
            .hero-section {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .hero-content h2 {
                font-size: 2.2em;
            }

            .hero-visual {
                height: 350px;
            }

            .header-wrapper {
                flex-direction: row;
                justify-content: space-between;
                padding: 0 20px;
            }

            header h1 {
                font-size: 1.3em;
            }

            header h1 img {
                height: 40px;
            }

            nav {
                display: none;
            }

            .hamburger {
                display: flex;
            }

            .mobile-menu {
                display: block;
            }

            main {
                padding: 90px 0 60px 0;
            }

            .cta-buttons {
                justify-content: center;
            }

            .code-animation {
                font-size: 0.7em;
                padding: 20px;
            }

            .theme-toggle {
                top: 90px;
                right: 20px;
                width: 45px;
                height: 45px;
            }

            .scroll-to-top {
                bottom: 20px;
                right: 20px;
                width: 45px;
                height: 45px;
            }

            .feature-card {
                height: 350px;
            }

            .features-section {
                grid-template-columns: 1fr;
            }

            .card-content {
                padding: 30px 20px;
            }

            .image-title {
                font-size: 1.5em;
            }

            .card-content h3 {
                font-size: 1.6em;
            }

            .card-content p {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="particles" id="particles"></div>

    <div class="scroll-to-top" id="scrollToTop"></div>

    <div class="theme-toggle" id="themeToggle">
        <span class="icon">🌙</span>
    </div>

    <div class="mobile-menu" id="mobileMenu">
        <nav>
            <a href="index.jsp" class="active">Accueil</a>
            <a href="about.jsp">À propos</a>
            <a href="projects.jsp">Projets</a>
            <a href="contact.jsp">Contact</a>
        </nav>
    </div>

    <header>
        <div class="header-wrapper">
            <h1>
                <img src="images/logo.png" alt="Logo">
            </h1>
            <div class="hamburger" id="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <nav>
                <a href="index.jsp" class="active">Accueil</a>
                <a href="about.jsp">À propos</a>
                <a href="projects.jsp">Projets</a>
                <a href="contact.jsp">Contact</a>
            </nav>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="hero-section">
                <div class="hero-content">
                    <h2>Bonjour, je suis <span class="highlight">Mohamed Erra</span></h2>
                    <p>Développeur Full Stack Java passionné par la création d'applications web modernes et performantes.</p>
                    <div class="cta-buttons">
                        <a href="projects.jsp" class="btn btn-primary">🚀 Voir mes projets</a>
                        <a href="contact.jsp" class="btn btn-secondary">📧 Me contacter</a>
                    </div>
                </div>

                <div class="hero-image">
                    <div class="hero-visual">
                        <div class="code-animation">
                            <div class="code-line"><span class="keyword">public class</span> <span class="class-name">Developer</span> {</div>
                            <div class="code-line">    <span class="keyword">private</span> String name = <span class="string">"Mohamed Erra"</span>;</div>
                            <div class="code-line">    <span class="keyword">private</span> String[] skills = {</div>
                            <div class="code-line">        <span class="string">"Java"</span>, <span class="string">"Spring Boot"</span>, <span class="string">"JSP"</span></div>
                            <div class="code-line">    };</div>
                            <div class="code-line">}</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="features-section">
                <div class="feature-card" onclick="toggleCard(this)">
                    <div class="card-image-container">
                        <img src="https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800&h=600&fit=crop" alt="Développement Web" class="card-image">
                        <div class="image-overlay">
                            <div class="feature-icon">💻</div>
                            <h3 class="image-title">Développement Web</h3>
                            <p class="click-hint">Cliquez pour en savoir plus</p>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="close-button" onclick="event.stopPropagation(); toggleCard(this.parentElement.parentElement)">×</div>
                        <div class="content-icon">💻</div>
                        <h3>Développement Web</h3>
                        <p>Création d'applications web robustes avec Java, JSP et les dernières technologies front-end.</p>
                        <ul class="feature-list">
                            <li>Java / Java EE</li>
                            <li>Spring Boot & Spring MVC</li>
                            <li>JSP & Servlets</li>
                            <li>API RESTful</li>
                        </ul>
                    </div>
                </div>

                <div class="feature-card" onclick="toggleCard(this)">
                    <div class="card-image-container">
                        <img src="https://images.unsplash.com/photo-1561070791-2526d30994b5?w=800&h=600&fit=crop" alt="Design Moderne" class="card-image">
                        <div class="image-overlay">
                            <div class="feature-icon">🎨</div>
                            <h3 class="image-title">Design Moderne</h3>
                            <p class="click-hint">Cliquez pour en savoir plus</p>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="close-button" onclick="event.stopPropagation(); toggleCard(this.parentElement.parentElement)">×</div>
                        <div class="content-icon">🎨</div>
                        <h3>Design Moderne</h3>
                        <p>Interfaces utilisateur élégantes et intuitives avec une attention particulière à l'expérience utilisateur.</p>
                        <ul class="feature-list">
                            <li>UI/UX Design</li>
                            <li>Responsive Design</li>
                            <li>CSS3 & Animations</li>
                            <li>Design Systems</li>
                        </ul>
                    </div>
                </div>

                <div class="feature-card" onclick="toggleCard(this)">
                    <div class="card-image-container">
                        <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&h=600&fit=crop" alt="Performance" class="card-image">
                        <div class="image-overlay">
                            <div class="feature-icon">⚡</div>
                            <h3 class="image-title">Performance</h3>
                            <p class="click-hint">Cliquez pour en savoir plus</p>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="close-button" onclick="event.stopPropagation(); toggleCard(this.parentElement.parentElement)">×</div>
                        <div class="content-icon">⚡</div>
                        <h3>Performance</h3>
                        <p>Optimisation des performances pour des applications rapides et réactives.</p>
                        <ul class="feature-list">
                            <li>Optimisation Backend</li>
                            <li>Cache Management</li>
                            <li>Lazy Loading</li>
                            <li>Code Optimization</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mohamed Erra. Tous droits réservés.</p>
        </div>
    </footer>

    <script>
        // Animation de particules
        const particlesContainer = document.getElementById('particles');
        
        function createParticle() {
            const particle = document.createElement('div');
            particle.className = 'particle';
            
            const size = Math.random() * 5 + 2;
            const startX = Math.random() * window.innerWidth;
            const delay = Math.random() * 5;
            const duration = Math.random() * 10 + 10;
            
            particle.style.width = size + 'px';
            particle.style.height = size + 'px';
            particle.style.left = startX + 'px';
            particle.style.bottom = '0';
            particle.style.animationDelay = delay + 's';
            particle.style.animationDuration = duration + 's';
            
            particlesContainer.appendChild(particle);
            
            setTimeout(() => {
                particle.remove();
            }, (duration + delay) * 1000);
        }
        
        setInterval(createParticle, 500);
        
        for (let i = 0; i < 10; i++) {
            setTimeout(createParticle, i * 100);
        }

        // Bouton retour en haut
        const scrollToTopBtn = document.getElementById('scrollToTop');
        
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
                scrollToTopBtn.classList.add('visible');
            } else {
                scrollToTopBtn.classList.remove('visible');
            }
        });

        scrollToTopBtn.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        // Changement de thème
        const themeToggle = document.getElementById('themeToggle');
        const body = document.body;
        const themeIcon = themeToggle.querySelector('.icon');

        // Charger le thème sauvegardé
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'light') {
            body.classList.add('light-mode');
            themeIcon.textContent = '☀️';
        }

        themeToggle.addEventListener('click', () => {
            body.classList.toggle('light-mode');
            
            if (body.classList.contains('light-mode')) {
                themeIcon.textContent = '☀️';
                localStorage.setItem('theme', 'light');
            } else {
                themeIcon.textContent = '🌙';
                localStorage.setItem('theme', 'dark');
            }
        });

        // Menu hamburger
        const hamburger = document.getElementById('hamburger');
        const mobileMenu = document.getElementById('mobileMenu');

        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('active');
            mobileMenu.classList.toggle('active');
        });

        // Fermer le menu mobile au clic sur un lien
        const mobileLinks = mobileMenu.querySelectorAll('a');
        mobileLinks.forEach(link => {
            link.addEventListener('click', () => {
                hamburger.classList.remove('active');
                mobileMenu.classList.remove('active');
            });
        });

        // Fermer le menu mobile au clic en dehors
        document.addEventListener('click', (e) => {
            if (!mobileMenu.contains(e.target) && !hamburger.contains(e.target)) {
                hamburger.classList.remove('active');
                mobileMenu.classList.remove('active');
            }
        });

        // Gestion des cartes interactives
        function toggleCard(card) {
            // Fermer toutes les autres cartes
            const allCards = document.querySelectorAll('.feature-card');
            allCards.forEach(c => {
                if (c !== card && c.classList.contains('active')) {
                    c.classList.remove('active');
                }
            });

            // Toggle la carte cliquée
            card.classList.toggle('active');
        }

        // Fermer la carte si on clique en dehors
        document.addEventListener('click', (e) => {
            if (!e.target.closest('.feature-card')) {
                const allCards = document.querySelectorAll('.feature-card');
                allCards.forEach(card => {
                    card.classList.remove('active');
                });
            }
        });
    </script>
</body>
</html>