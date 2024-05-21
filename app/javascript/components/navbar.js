const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.header');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('header-bottom');
      } else {
        navbar.classList.remove('header-bottom');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
