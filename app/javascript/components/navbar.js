import $ from 'jquery';
const initNavbarColor = () => {
  $(document).scroll(function(){
    if($(this).scrollTop() > 10)
    {
      $('.navbar-lewagon').removeClass('navbar-transparent').addClass('navbar-colored');
    } else {
      $('.navbar-lewagon').removeClass('navbar-colored').addClass('navbar-transparent');
    }
  });
}
export { initNavbarColor };
