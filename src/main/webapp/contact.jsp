<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - Mohamed Erra</title>
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
            0%, 100% { transform: translateY(0) translateX(0) scale(1); opacity: 0; }
            10% { opacity: 0.5; }
            90% { opacity: 0.5; }
            100% { transform: translateY(-100vh) translateX(50px) scale(1.5); opacity: 0; }
        }

        /* Bouton retour en haut */
        .scroll-to-top {
            position: fixed; bottom: 30px; right: 30px; width: 50px; height: 50px;
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            border-radius: 50%; display: flex; align-items: center; justify-content: center; cursor: pointer;
            opacity: 0; visibility: hidden; transition: all 0.3s; z-index: 2000;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }
        .scroll-to-top.visible { opacity: 1; visibility: visible; }
        .scroll-to-top:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0, 123, 255, 0.6); }
        .scroll-to-top::before { content: '↑'; font-size: 1.5em; color: white; font-weight: bold; }

        /* Bouton de changement de thème */
        .theme-toggle {
            position: fixed; top: 120px; right: 30px; width: 50px; height: 50px;
            background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px); border-radius: 50%;
            display: flex; align-items: center; justify-content: center; cursor: pointer; transition: all 0.3s;
            z-index: 2000; border: 2px solid rgba(255, 255, 255, 0.2);
        }
        .theme-toggle:hover { transform: scale(1.1) rotate(15deg); box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4); }
        .theme-toggle .icon { font-size: 1.5em; transition: transform 0.3s; }

        /* Menu hamburger */
        .hamburger { display: none; flex-direction: column; gap: 5px; cursor: pointer; padding: 10px; z-index: 1001; }
        .hamburger span { width: 25px; height: 3px; background: var(--text-primary); transition: all 0.3s; border-radius: 3px; }
        .hamburger.active span:nth-child(1) { transform: rotate(45deg) translate(8px, 8px); }
        .hamburger.active span:nth-child(2) { opacity: 0; }
        .hamburger.active span:nth-child(3) { transform: rotate(-45deg) translate(7px, -7px); }

        .mobile-menu {
            display: none; position: fixed; top: 0; right: -100%; width: 300px; height: 100vh;
            background: rgba(0, 26, 61, 0.95); backdrop-filter: blur(10px); padding: 80px 30px 30px 30px;
            transition: right 0.4s ease; z-index: 1000; box-shadow: -5px 0 20px rgba(0,0,0,0.5);
        }
        body.light-mode .mobile-menu { background: rgba(240, 244, 248, 0.95); }
        .mobile-menu.active { right: 0; }
        .mobile-menu nav { display: flex; flex-direction: column; gap: 15px; }
        .mobile-menu nav a {
            color: var(--text-primary); text-decoration: none; font-size: 1.2em; padding: 15px 20px;
            border-radius: 10px; transition: all 0.3s; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);
        }
        .mobile-menu nav a:hover, .mobile-menu nav a.active {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%); transform: translateX(-5px);
        }

        header {
            background: rgba(0, 0, 0, 0.3); padding: 15px 0; box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            position: fixed; top: 0; left: 0; right: 0; z-index: 1000; backdrop-filter: blur(10px);
        }
        body.light-mode header { background: rgba(255, 255, 255, 0.3); }
        header h1 { 
            font-size: 2em; text-shadow: 2px 2px 4px rgba(0,0,0,0.8); font-weight: 300; 
            letter-spacing: 2px; color: var(--text-primary); display: flex; align-items: center; 
            justify-content: center; margin: 0;
        }
        header h1 img { 
            height: 50px; width: auto; object-fit: contain; 
        }

        .header-wrapper {
            display: flex; justify-content: space-between; align-items: center; 
            padding: 0 40px; max-width: 1400px; margin: 0 auto;
        }

        nav { display: flex; gap: 15px; flex-wrap: wrap; align-items: center; }
        nav a {
            color: var(--text-primary); text-decoration: none; font-size: 1em; padding: 12px 24px;
            border-radius: 25px; transition: all 0.3s; background: rgba(255,255,255,0.05); position: relative; overflow: hidden;
            font-weight: 300; letter-spacing: 0.5px; border: 1px solid rgba(255,255,255,0.1);
        }
        nav a::before {
            content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent); transition: left 0.5s;
        }
        nav a:hover::before { left: 100%; }
        nav a:hover, nav a.active {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4); border-color: var(--accent-primary);
        }

        main {
            display: flex; justify-content: center; align-items: center; min-height: calc(100vh - 80px);
            padding: 100px 20px 60px; position: relative; z-index: 1;
        }

        .contact-wrapper {
            display: grid; grid-template-columns: 1fr 1.2fr; gap: 40px; max-width: 1200px; width: 100%;
            opacity: 0; animation: revealCard 0.8s ease forwards;
        }
        @keyframes revealCard {
            from { opacity: 0; transform: rotateX(-15deg) scale(0.95); }
            to { opacity: 1; transform: rotateX(0) scale(1); }
        }

        .contact-info {
            background: rgba(255, 255, 255, 0.1); padding: 40px; border-radius: 15px; backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3); border: 1px solid rgba(255,255,255,0.2);
            display: flex; flex-direction: column; justify-content: center; animation: slideInLeft 0.8s ease 0.2s backwards;
        }
        @keyframes slideInLeft { from { opacity: 0; transform: translateX(-50px); } to { opacity: 1; transform: translateX(0); } }

        .contact-info h2 { font-size: 2.2em; color: var(--text-secondary); margin-bottom: 20px; }
        .contact-info p { font-size: 1.1em; line-height: 1.8; margin-bottom: 30px; opacity: 0.9; color: var(--text-primary); }

        .info-item {
            display: flex; align-items: center; gap: 15px; margin-bottom: 20px; padding: 15px;
            background: rgba(0, 123, 255, 0.1); border-radius: 10px; transition: all 0.3s; border: 1px solid rgba(255,255,255,0.1);
        }
        .info-item:hover { background: rgba(0, 123, 255, 0.2); transform: translateX(5px); }

        .info-icon {
            width: 50px; height: 50px; background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.5em; flex-shrink: 0;
        }
        .info-content h3 { color: var(--text-secondary); font-size: 1.1em; margin-bottom: 5px; }
        .info-content p { margin: 0; font-size: 0.95em; }
        .info-content a { color: var(--text-primary); text-decoration: none; transition: color 0.3s; }
        .info-content a:hover { color: var(--text-secondary); }

        .form-container {
            background: rgba(255, 255, 255, 0.1); padding: 40px; border-radius: 15px; backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.4); border: 1px solid rgba(255,255,255,0.2);
            animation: slideInRight 0.8s ease 0.2s backwards;
        }
        @keyframes slideInRight { from { opacity: 0; transform: translateX(50px); } to { opacity: 1; transform: translateX(0); } }

        .form-container h2 { color: var(--text-secondary); text-align: center; font-size: 2.2em; margin-bottom: 30px; text-shadow: 2px 2px 4px rgba(0,0,0,0.5); }

        .form-group { margin-bottom: 25px; opacity: 0; animation: fadeInUp 0.6s ease forwards; }
        .form-group:nth-child(1) { animation-delay: 0.4s; }
        .form-group:nth-child(2) { animation-delay: 0.5s; }
        .form-group:nth-child(3) { animation-delay: 0.6s; }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }

        label { display: block; color: var(--text-secondary); margin-bottom: 8px; font-size: 1em; font-weight: bold; }
        input, textarea {
            width: 100%; padding: 12px 15px; border: 2px solid rgba(255,255,255,0.2); border-radius: 8px; font-size: 1em;
            background: rgba(255,255,255,0.9); transition: all 0.3s; font-family: Arial, sans-serif;
        }
        input:focus, textarea:focus {
            outline: none; border-color: var(--accent-primary); background: white; box-shadow: 0 0 15px rgba(0, 123, 255, 0.4); transform: translateY(-2px);
        }
        textarea { resize: vertical; min-height: 120px; }

        button {
            width: 100%; background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%); color: white;
            border: none; padding: 15px; font-size: 1.1em; font-weight: bold; border-radius: 8px; cursor: pointer;
            transition: all 0.3s; margin-top: 10px; position: relative; overflow: hidden; opacity: 0;
            animation: fadeInUp 0.6s ease 0.7s forwards;
        }
        button::before {
            content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent); transition: left 0.5s;
        }
        button:hover::before { left: 100%; }
        button:hover { transform: translateY(-3px); box-shadow: 0 8px 25px rgba(0, 123, 255, 0.5); }
        button:active { transform: translateY(-1px); }

        .success-message {
            background: rgba(40, 167, 69, 0.2); border: 2px solid #28a745; color: var(--text-secondary);
            padding: 15px; border-radius: 8px; margin-bottom: 20px; text-align: center; display: none;
            animation: slideDown 0.5s ease;
        }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }
        .success-message.show { display: block; }

        footer {
            background: rgba(0, 0, 0, 0.4); text-align: center; padding: 20px 0; position: relative; z-index: 1;
        }
        body.light-mode footer { background: rgba(255, 255, 255, 0.4); }
        footer p { color: var(--text-primary); }

        @media (max-width: 968px) {
            .contact-wrapper { grid-template-columns: 1fr; gap: 30px; }
            .header-wrapper { flex-direction: row; justify-content: space-between; padding: 0 20px; }
            header h1 { font-size: 1.3em; }
            header h1 img { height: 40px; }
            nav { display: none; }
            .hamburger { display: flex; }
            .mobile-menu { display: block; }
            main { padding: 90px 0 60px 0; }
            .theme-toggle { top: 90px; right: 20px; width: 45px; height: 45px; }
            .scroll-to-top { bottom: 20px; right: 20px; width: 45px; height: 45px; }
            .contact-info, .form-container { padding: 30px 20px; }
            .contact-info h2, .form-container h2 { font-size: 1.8em; }
        }
    </style>
</head>
<body>
    <div class="particles" id="particles"></div>

    <!-- Bouton retour en haut -->
    <div class="scroll-to-top" id="scrollToTop"></div>

    <!-- Bouton de changement de thème -->
    <div class="theme-toggle" id="themeToggle">
        <span class="icon">🌙</span>
    </div>

    <!-- Menu mobile -->
    <div class="mobile-menu" id="mobileMenu">
        <nav>
            <a href="index.jsp">Accueil</a>
            <a href="about.jsp">À propos</a>
            <a href="projects.jsp">Projets</a>
            <a href="contact.jsp" class="active">Contact</a>
        </nav>
    </div>

    <header>
        <div class="header-wrapper">
            <h1>
                <img src="images/logo.png" alt="Logo">
            </h1>
            <div class="hamburger" id="hamburger">
                <span></span><span></span><span></span>
            </div>
            <nav>
                <a href="index.jsp">Accueil</a>
                <a href="about.jsp">À propos</a>
                <a href="projects.jsp">Projets</a>
                <a href="contact.jsp" class="active">Contact</a>
            </nav>
        </div>
    </header>

    <main>
        <div class="contact-wrapper">
            <div class="contact-info">
                <h2>Restons en contact</h2>
                <p>N'hésitez pas à me contacter pour discuter de vos projets, poser des questions ou simplement échanger sur les technologies web.</p>
                
                <div class="info-item">
                    <div class="info-icon" aria-label="Email">📧</div>
                    <div class="info-content">
                        <h3>Email</h3>
                        <p><a href="https://mail.google.com/mail/u/0/?authuser=erranova01@gmail.com">erranova01@gmail.com</a></p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon" aria-label="Téléphone">📱</div>
                    <div class="info-content">
                        <h3>Téléphone</h3>
                        <p><a href="tel:+212629545834">+212 629-545834</a></p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon" aria-label="Localisation">📍</div>
                    <div class="info-content">
                        <h3>Localisation</h3>
                        <p>Casablanca, Maroc</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon" aria-label="LinkedIn"></div>
                    <div class="info-content">
                        <h3>LinkedIn</h3>
                        <p><a href="https://linkedin.com/in/erra-nova-8144163a0" target="_blank">linkedin.com/in/erra-nova-8144163a0</a></p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon" aria-label="GitHub"></div>
                    <div class="info-content">
                        <h3>GitHub</h3>
                        <p><a href="https://github.com/erranova01-source" target="_blank">github.com/erranova01-source</a></p>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <h2>Envoyez-moi un message</h2>
                
                <div class="success-message" id="successMessage" role="alert" aria-live="polite">
                    ✅ Votre message a été envoyé avec succès !
                </div>

                <form action="contact" method="post" id="contactForm">
                    <div class="form-group">
                        <label for="nom">Votre nom *</label>
                        <input type="text" id="nom" name="nom" placeholder="Entrez votre nom" required aria-required="true">
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Votre email *</label>
                        <input type="email" id="email" name="email" placeholder="exemple@email.com" required aria-required="true">
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Votre message *</label>
                        <textarea id="message" name="message" placeholder="Écrivez votre message ici..." required aria-required="true"></textarea>
                    </div>
                    
                    <button type="submit"> Envoyer le message</button>
                </form>
            </div>
        </div>
    </main>

    <footer>
        <div style="max-width: 1200px; margin: 0 auto; padding: 0 20px;">
            <p>&copy; 2025 Mohamed Erra. Tous droits réservés.</p>
        </div>
    </footer>

    <script>
        // Animation de particules (optimisée)
        const particlesContainer = document.getElementById('particles');
        function createParticle() {
            const particle = document.createElement('div'); particle.className = 'particle';
            const size = Math.random() * 5 + 5; const startX = Math.random() * window.innerWidth;
            const delay = Math.random() * 5; const duration = Math.random() * 15 + 10;
            particle.style.width = particle.style.height = size + 'px';
            particle.style.left = startX + 'px'; particle.style.bottom = '0';
            particle.style.animationDelay = delay + 's'; particle.style.animationDuration = duration + 's';
            particlesContainer.appendChild(particle);
            setTimeout(() => particle.remove(), (duration + delay) * 1000);
        }
        setInterval(createParticle, 500);
        for (let i = 0; i < 10; i++) setTimeout(createParticle, i * 100);

        // Bouton retour en haut
        const scrollToTopBtn = document.getElementById('scrollToTop');
        window.addEventListener('scroll', () => {
            scrollToTopBtn.classList.toggle('visible', window.pageYOffset > 300);
        });
        scrollToTopBtn.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));

        // Changement de thème
        const themeToggle = document.getElementById('themeToggle'); const body = document.body; const themeIcon = themeToggle.querySelector('.icon');
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'light') { body.classList.add('light-mode'); themeIcon.textContent = '☀️'; }
        themeToggle.addEventListener('click', () => {
            body.classList.toggle('light-mode');
            themeIcon.textContent = body.classList.contains('light-mode') ? '☀️' : '🌙';
            localStorage.setItem('theme', body.classList.contains('light-mode') ? 'light' : 'dark');
        });

        // Menu hamburger
        const hamburger = document.getElementById('hamburger'); const mobileMenu = document.getElementById('mobileMenu');
        hamburger.addEventListener('click', () => { hamburger.classList.toggle('active'); mobileMenu.classList.toggle('active'); });
        mobileMenu.querySelectorAll('a').forEach(link => link.addEventListener('click', () => { hamburger.classList.remove('active'); mobileMenu.classList.remove('active'); }));
        document.addEventListener('click', (e) => {
            if (!mobileMenu.contains(e.target) && !hamburger.contains(e.target)) { hamburger.classList.remove('active'); mobileMenu.classList.remove('active'); }
        });

        // Gestion du formulaire (validation + envoi moderne)
        const contactForm = document.getElementById('contactForm'); const successMessage = document.getElementById('successMessage');
        contactForm.addEventListener('submit', async (e) => {
            e.preventDefault(); // Empêche soumission par défaut
            const formData = new FormData(contactForm);
            const email = formData.get('email');
            if (!email.includes('@')) return alert('Email invalide !');
            
            try {
                // Simulation envoi (remplace par ton backend)
                await fetch('/contact', { method: 'POST', body: formData });
                successMessage.classList.add('show'); contactForm.reset();
                setTimeout(() => successMessage.classList.remove('show'), 5000);
            } catch (err) { alert('Erreur envoi !'); }
        });

        // Animation focus inputs (moderne scale)
        document.querySelectorAll('input, textarea').forEach(input => {
            input.addEventListener('focus', () => { input.parentElement.style.transform = 'scale(1.02)'; });
            input.addEventListener('blur', () => { input.parentElement.style.transform = 'scale(1)'; });
        });
    </script>
</body>
</html>