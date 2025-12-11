// Validation simple du formulaire
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("contactForm");
    if(form){
        form.addEventListener("submit", function(e){
            const email = document.getElementById("email").value;
            const message = document.getElementById("message").value;

            if(!email.includes("@") || message.trim() === ""){
                alert("Veuillez entrer un email valide et un message.");
                e.preventDefault();
            }
        });
    }
});
