// Smooth scrolling for anchor links
document.addEventListener('DOMContentLoaded', function() {
   // Smooth scroll for navigation links
   const navLinks = document.querySelectorAll('a[href^="#"]');
   navLinks.forEach(link => {
       link.addEventListener('click', function(e) {
           e.preventDefault();
           const targetId = this.getAttribute('href');
           const targetElement = document.querySelector(targetId);
           if (targetElement) {
               targetElement.scrollIntoView({
                   behavior: 'smooth',
                   block: 'start'
               });
           }
       });
   });
   // Add animation on scroll
   const observerOptions = {
       threshold: 0.1,
       rootMargin: '0px 0px -50px 0px'
   };
   const observer = new IntersectionObserver(function(entries) {
       entries.forEach(entry => {
           if (entry.isIntersecting) {
               entry.target.style.opacity = '1';
               entry.target.style.transform = 'translateY(0)';
           }
       });
   }, observerOptions);
   // Observe elements for animation
   document.querySelectorAll('.service-card, .stat-item').forEach(el => {
       el.style.opacity = '0';
       el.style.transform = 'translateY(20px)';
       el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
       observer.observe(el);
   });
});
