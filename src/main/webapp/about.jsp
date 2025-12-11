<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>À propos - Mohamed Erra</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg-primary: #001a3d;t
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
            transition: all 0.3s ease;
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
            line-height: normal;
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
        }

        /* HERO BANNER */
        .hero-banner {
            width: 100%;
            height: 500px;
            position: relative;
            overflow: hidden;
            margin-bottom: 80px;
            border-radius: 0;
            box-shadow: 0 10px 40px rgba(0,0,0,0.5);
        }

        .hero-banner::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(0,26,61,0.7) 0%, rgba(0,61,122,0.8) 100%);
            z-index: 1;
        }

        .hero-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.4);
        }

        .hero-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            z-index: 2;
            width: 90%;
            max-width: 800px;
        }

        .hero-content h1 {
            font-size: 3.5em;
            font-weight: 700;
            color: white;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.8);
            animation: fadeInUp 0.8s ease;
        }

        .hero-content .highlight {
            color: var(--accent-primary);
        }

        .hero-content p {
            font-size: 1.3em;
            color: rgba(255,255,255,0.9);
            line-height: 1.6;
            animation: fadeInUp 0.8s ease 0.2s backwards;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* PRESENTATION SECTION */
        .presentation-section {
            background: rgba(255, 255, 255, 0.1);
            padding: 60px 40px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.2);
            margin-bottom: 80px;
            animation: revealCard 0.8s ease forwards;
        }

        body.light-mode .presentation-section {
            background: rgba(255, 255, 255, 0.6);
            border: 1px solid rgba(0,0,0,0.1);
        }

        @keyframes revealCard {
            from {
                opacity: 0;
                transform: rotateX(-15deg) scale(0.95);
            }
            to {
                opacity: 1;
                transform: rotateX(0) scale(1);
            }
        }

        .presentation-section h2 {
            font-size: 2.5em;
            text-align: center;
            color: var(--text-secondary);
            margin-bottom: 30px;
            position: relative;
            display: inline-block;
            left: 50%;
            transform: translateX(-50%);
        }

        .presentation-section h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent-primary), transparent);
        }

        .presentation-text {
            text-align: center;
            font-size: 1.2em;
            line-height: 1.8;
            color: var(--text-primary);
            max-width: 900px;
            margin: 40px auto 60px;
        }

        .team-member {
            text-align: center;
            max-width: 300px;
            margin: 0 auto;
            transition: transform 0.3s;
            opacity: 0;
            animation: slideUp 0.6s ease forwards 0.6s;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .team-member:hover {
            transform: translateY(-10px);
        }

        .team-member-image {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin: 0 auto 20px;
            overflow: hidden;
            border: 4px solid var(--accent-primary);
            box-shadow: 0 5px 20px rgba(0, 123, 255, 0.3);
            transition: all 0.3s;
        }

        .team-member:hover .team-member-image {
            border-color: var(--accent-secondary);
            box-shadow: 0 8px 30px rgba(0, 123, 255, 0.5);
            transform: scale(1.05);
        }

        .team-member-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .team-member h3 {
            font-size: 1.8em;
            color: var(--text-secondary);
            margin-bottom: 8px;
            font-weight: 600;
        }

        .team-member p {
            color: var(--text-primary);
            font-size: 1.1em;
            font-weight: 300;
        }

        /* PROCESS SECTION */
        .process-section {
            background: rgba(255, 255, 255, 0.1);
            padding: 60px 40px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.2);
            margin-bottom: 80px;
            animation: revealCard 0.8s ease 0.2s forwards;
        }

        body.light-mode .process-section {
            background: rgba(255, 255, 255, 0.6);
            border: 1px solid rgba(0,0,0,0.1);
        }

        .process-section h2 {
            font-size: 2.5em;
            text-align: center;
            color: var(--text-secondary);
            margin-bottom: 30px;
            position: relative;
            display: inline-block;
            left: 50%;
            transform: translateX(-50%);
        }

        .process-section h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent-primary), transparent);
        }

        .process-description {
            text-align: center;
            color: var(--text-primary);
            font-size: 1.1em;
            margin-bottom: 40px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .process-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .process-card {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 40px 30px;
            transition: all 0.4s;
            border: 1px solid rgba(255,255,255,0.2);
            cursor: pointer;
            opacity: 0;
            animation: bounceIn 0.6s ease forwards;
            position: relative;
            overflow: hidden;
        }

        body.light-mode .process-card {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0,0,0,0.1);
        }

        .process-card:nth-child(1) { animation-delay: 0.2s; }
        .process-card:nth-child(2) { animation-delay: 0.4s; }
        .process-card:nth-child(3) { animation-delay: 0.6s; }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                transform: scale(1.05);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .process-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-size: cover;
            background-position: center;
            opacity: 0.15;
            z-index: 0;
            transition: opacity 0.3s;
        }

        .process-card.design::before {
            background-image: url('https://images.unsplash.com/photo-1561070791-2526d30994b5?w=800&h=600&fit=crop');
        }

        .process-card.develop::before {
            background-image: url('https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800&h=600&fit=crop');
        }

        .process-card.deliver::before {
            background-image: url('https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&h=600&fit=crop');
        }
        
        .process-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 12px 40px rgba(0, 123, 255, 0.5);
            border-color: var(--accent-primary);
        }

        .process-card:hover::before {
            opacity: 0.25;
        }

        .process-card > * {
            position: relative;
            z-index: 1;
        }

        .process-card h3 {
            font-size: 1.8em;
            color: var(--text-secondary);
            margin-bottom: 15px;
            font-weight: 700;
        }

        .process-card p {
            color: var(--text-primary);
            font-size: 1em;
            line-height: 1.6;
        }

        /* STATS SECTION */
        .stats-section {
            background: rgba(255, 255, 255, 0.1);
            padding: 60px 40px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.2);
            text-align: center;
            animation: revealCard 0.8s ease 0.4s forwards;
        }

        body.light-mode .stats-section {
            background: rgba(255, 255, 255, 0.6);
            border: 1px solid rgba(0,0,0,0.1);
        }

        .stats-section h2 {
            font-size: 2.5em;
            color: var(--text-secondary);
            margin-bottom: 60px;
            position: relative;
            display: inline-block;
        }

        .stats-section h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent-primary), transparent);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 60px;
        }

        .stat-item {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px 30px;
            border-radius: 15px;
            border: 2px solid rgba(255,255,255,0.2);
            transition: all 0.3s;
            opacity: 0;
            animation: fadeInScale 0.6s ease forwards;
        }

        body.light-mode .stat-item {
            background: rgba(255, 255, 255, 0.8);
            border: 2px solid rgba(0,0,0,0.1);
        }

        .stat-item:nth-child(1) { animation-delay: 0.2s; }
        .stat-item:nth-child(2) { animation-delay: 0.3s; }
        .stat-item:nth-child(3) { animation-delay: 0.4s; }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .stat-item:hover {
            border-color: var(--accent-primary);
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 123, 255, 0.3);
        }

        .stat-number {
            font-size: 3.5em;
            font-weight: 700;
            color: var(--text-secondary);
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 1.2em;
            color: var(--text-primary);
            font-weight: 300;
        }

        .cta-button {
            display: inline-block;
            padding: 18px 50px;
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            color: white;
            font-size: 1.2em;
            font-weight: 600;
            text-decoration: none;
            border-radius: 50px;
            transition: all 0.3s;
            box-shadow: 0 5px 20px rgba(0, 123, 255, 0.3);
            animation: fadeInUp 0.6s ease 0.5s backwards;
        }

        .cta-button:hover {
            background: linear-gradient(135deg, var(--accent-secondary) 0%, var(--accent-primary) 100%);
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(0, 123, 255, 0.5);
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
            .header-wrapper {
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

            .hero-banner {
                height: 400px;
            }

            .hero-content h1 {
                font-size: 2.2em;
            }

            .hero-content p {
                font-size: 1.1em;
            }

            .presentation-section h2,
            .process-section h2,
            .stats-section h2 {
                font-size: 2em;
            }

            .team-member-image {
                width: 150px;
                height: 150px;
            }

            .process-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: 1fr;
                gap: 30px;
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
            <a href="index.jsp">Accueil</a>
            <a href="about.jsp" class="active">À propos</a>
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
                <a href="index.jsp">Accueil</a>
                <a href="about.jsp" class="active">À propos</a>
                <a href="projects.jsp">Projets</a>
                <a href="contact.jsp">Contact</a>
            </nav>
        </div>
    </header>

    <main>
        <!-- HERO BANNER -->
        <div class="hero-banner">
            <img src="https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=2000&h=600&fit=crop" alt="Hero Banner">
            <div class="hero-content">
                <h1>Creative & <span class="highlight">Innovative</span> Web Design</h1>
                <p>Nous créons des expériences digitales uniques qui transforment vos idées en réalité</p>
            </div>
        </div>

        <div class="container">
            <!-- PRESENTATION SECTION -->
            <section class="presentation-section">
                <h2>À Propos</h2>
                <p class="presentation-text">
                    Développeur passionné et créatif, je me spécialise dans la création de solutions web 
                    innovantes et performantes. Mon expertise couvre le développement full-stack avec une 
                    attention particulière portée à l'expérience utilisateur et aux technologies modernes.
                </p>

                <div class="team-member">
                    <div class="team-member-image">
                        <img src="images/profile.png" alt="Mohamed Erra">
                    </div>
                    <h3>Mohamed Erra</h3>
                    <p>Lead Developer</p>
                </div>
            </section>

            <!-- PROCESS SECTION -->
            <section class="process-section">
                <h2>Notre Processus</h2>
                <p class="process-description">
                    Une méthodologie éprouvée en trois étapes pour garantir le succès de vos projets
                </p>

                <div class="process-grid">
                    <div class="process-card design">
                        <h3>🎨 Design</h3>
                        <p>Création d'interfaces modernes et intuitives centrées sur l'utilisateur</p>
                    </div>

                    <div class="process-card develop">
                        <h3>⚙️ Develop</h3>
                        <p>Développement avec les technologies les plus récentes et performantes</p>
                    </div>

                    <div class="process-card deliver">
                        <h3>🚀 Deliver</h3>
                        <p>Livraison rapide avec support continu et maintenance</p>
                    </div>
                </div>
            </section>

            <!-- STATS SECTION -->
            <section class="stats-section">
                <h2>Nos Réalisations</h2>

                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">Projets Réussis</div>
                    </div>

                    <div class="stat-item">
                        <div class="stat-number">8</div>
                        <div class="stat-label">Partenaires de Confiance</div>
                    </div>

                    <div class="stat-item">
                        <div class="stat-number">3</div>
                        <div class="stat-label">Années d'Expérience</div>
                    </div>
                </div>

                <a href="contact.jsp" class="cta-button">Nous Contacter</a>
            </section>
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

        const mobileLinks = mobileMenu.querySelectorAll('a');
        mobileLinks.forEach(link => {
            link.addEventListener('click', () => {
                hamburger.classList.remove('active');
                mobileMenu.classList.remove('active');
            });
        });

        document.addEventListener('click', (e) => {
            if (!mobileMenu.contains(e.target) && !hamburger.contains(e.target)) {
                hamburger.classList.remove('active');
                mobileMenu.classList.remove('active');
            }
        });
    </script>
</body>
</html>