function mapViewToggle () {
  const background = document.querySelector('.background');
  const toggleBody = document.querySelector('.toggle-body');
  const toggleBtn = document.querySelector('.toggle-btn');
  if (toggleBtn) {
    const mapContainer = document.querySelector('.map-container')
    const cardContainer = document.querySelector('.card-container')
    toggleBtn.addEventListener('click', () => {
      background.classList.toggle('background--on');
      toggleBody.classList.toggle('toggle-body--on');
      toggleBtn.classList.toggle('toggle-btn--on');
      toggleBtn.classList.toggle('toggle-btn--scale');
      if (toggleBtn.classList.contains('toggle-btn--on')) {
        cardContainer.style.display = 'none'
       /* mapContainer.style.left = '0'*/
      }
      else {
        cardContainer.style.display = 'flex'
      /*  mapContainer.style.left = '100vw'*/
      }
    });
  }
}


export {mapViewToggle}
