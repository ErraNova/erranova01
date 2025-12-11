<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.monportfolio.model.Project" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projets - Mohamed Erra</title>
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
        
        section {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.2);
            opacity: 0;
            animation: revealCard 0.8s ease forwards;
        }

        body.light-mode section {
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
        
        h2 {
            font-size: 2em;
            margin-bottom: 30px;
            color: var(--text-secondary);
            text-align: center;
            position: relative;
            display: inline-block;
            left: 50%;
            transform: translateX(-50%);
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent-primary), transparent);
        }
        
        .projects-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }
        
        .project-card {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.4s;
            border: 1px solid rgba(255,255,255,0.2);
            cursor: pointer;
            opacity: 0;
            animation: bounceIn 0.6s ease forwards;
            position: relative;
        }

        body.light-mode .project-card {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0,0,0,0.1);
        }

        .project-card:nth-child(1) { animation-delay: 0.1s; }
        .project-card:nth-child(2) { animation-delay: 0.2s; }
        .project-card:nth-child(3) { animation-delay: 0.3s; }
        .project-card:nth-child(4) { animation-delay: 0.4s; }
        .project-card:nth-child(5) { animation-delay: 0.5s; }
        .project-card:nth-child(6) { animation-delay: 0.6s; }

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
        
        .project-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 12px 40px rgba(0, 123, 255, 0.5);
            border-color: var(--accent-primary);
        }

        .project-card.expanded {
            grid-column: 1 / -1;
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            gap: 30px;
            background: rgba(0, 123, 255, 0.2);
        }

        body.light-mode .project-card.expanded {
            background: rgba(49, 130, 206, 0.2);
        }
        
        .project-image-wrapper {
            width: 100%;
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .project-card.expanded .project-image-wrapper {
            height: 100%;
            min-height: 300px;
        }

        .project-image-wrapper::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.5), transparent);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .project-card:hover .project-image-wrapper::after {
            opacity: 1;
        }
        
        .project-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.4s;
        }

        .project-card:hover img {
            transform: scale(1.1);
        }

        .project-content {
            padding: 20px;
        }

        .project-card.expanded .project-content {
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .project-card h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: var(--text-secondary);
            transition: font-size 0.3s, margin-bottom 0.3s;
        }

        .project-card.expanded h3 {
            font-size: 2em;
            margin-bottom: 20px;
        }
        
        .project-card p {
            font-size: 1em;
            line-height: 1.6;
            color: var(--text-primary);
            transition: font-size 0.3s;
        }

        .project-card.expanded p {
            font-size: 1.1em;
            line-height: 1.8;
        }

        .project-details {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.5s ease;
            margin-top: 0;
        }

        .project-card.expanded .project-details {
            max-height: 500px;
            margin-top: 20px;
        }

        .project-details .detail-item {
            background: rgba(0, 0, 0, 0.3);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            border-left: 3px solid var(--accent-primary);
        }

        body.light-mode .project-details .detail-item {
            background: rgba(255, 255, 255, 0.5);
            border-left: 3px solid var(--accent-primary);
        }

        .project-details .detail-item h4 {
            color: var(--text-secondary);
            margin-bottom: 8px;
            font-size: 1.1em;
        }

        .project-details .detail-item p {
            font-size: 0.95em;
        }

        .project-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }

        .tag {
            background: rgba(0, 123, 255, 0.3);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.85em;
            border: 1px solid rgba(0, 123, 255, 0.5);
            color: var(--text-primary);
        }

        body.light-mode .tag {
            background: rgba(49, 130, 206, 0.3);
            border: 1px solid rgba(49, 130, 206, 0.5);
        }

        .no-projects {
            text-align: center;
            grid-column: 1/-1;
            padding: 60px 20px;
            font-size: 1.2em;
            color: var(--text-secondary);
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            border: 2px dashed rgba(255, 255, 255, 0.2);
        }

        body.light-mode .no-projects {
            background: rgba(255, 255, 255, 0.3);
            border: 2px dashed rgba(0, 0, 0, 0.2);
        }
        
        footer {
            background: rgba(0, 0, 0, 0.4);
            text-align: center;
            padding: 20px 0;
            margin-top: 60px;
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

            .projects-container {
                grid-template-columns: 1fr;
            }

            .project-card.expanded {
                grid-template-columns: 1fr;
            }

            .project-card.expanded .project-image-wrapper {
                min-height: 250px;
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
            <a href="about.jsp">À propos</a>
            <a href="projects.jsp" class="active">Projets</a>
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
                <a href="about.jsp">À propos</a>
                <a href="projects.jsp" class="active">Projets</a>
                <a href="contact.jsp">Contact</a>
            </nav>
        </div>
    </header>

    <main>
        <div class="container">
            <section>
                <h2>Portfolio de Projets</h2>
                <div class="projects-container">
                    <%
                    List<Project> projects = (List<Project>) request.getAttribute("projects");
                    if(projects != null && !projects.isEmpty()){
                        for(Project p : projects){
                    %>
                    <div class="project-card" onclick="toggleProject(this)">
                        <div class="project-image-wrapper">
                            <img src="<%= p.getImageUrl() %>" alt="<%= p.getTitre() %>">
                        </div>
                        <div class="project-content">
                            <h3><%= p.getTitre() %></h3>
                            <p><%= p.getDescription() %></p>
                            
                            <div class="project-details">
                                <div class="detail-item">
                                    <h4>🎯 Objectif</h4>
                                    <p>Créer une solution innovante répondant aux besoins spécifiques du client avec une architecture robuste et scalable.</p>
                                </div>
                                <div class="detail-item">
                                    <h4>🛠️ Technologies</h4>
                                    <div class="project-tags">
                                        <span class="tag">Java</span>
                                        <span class="tag">Spring Boot</span>
                                        <span class="tag">MySQL</span>
                                        <span class="tag">React</span>
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <h4>✨ Résultats</h4>
                                    <p>Application performante avec une expérience utilisateur optimisée et une maintenance simplifiée.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="no-projects">
                        <p>🚀 Aucun projet disponible pour le moment.</p>
                        <p style="margin-top: 10px; font-size: 0.9em; opacity: 0.7;">De nouveaux projets seront bientôt ajoutés !</p>
                    </div>
                    <%
                    }
                    %>
                </div>
            </section>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mohamed Erra. Tous droits réservés.</p>
        </div>
    </footer>

    <script>
        // Gestion de l'expansion des projets
        function toggleProject(card) {
            const isExpanded = card.classList.contains('expanded');
            
            // Fermer tous les autres projets
            document.querySelectorAll('.project-card').forEach(otherCard => {
                if (otherCard !== card) {
                    otherCard.classList.remove('expanded');
                }
            });
            
            // Toggle le projet cliqué
            card.classList.toggle('expanded');
        }

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