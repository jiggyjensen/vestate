function sliderCalc () {

  const slider = document.getElementById("calculatorSlider");
  const invest = document.getElementById("invest-net-amount");
  const shares = document.getElementById("shares-owned");
  const valuation = parseInt(slider.dataset.valuation)


  function calculate(price) {
    shares.innerText = (( price / valuation ) * 100).toFixed(1) + '%';
    invest.innerText =  price + '€';
  }


  slider.addEventListener("change", function(e) {
    calculate(slider.value);
  })

}

export {sliderCalc}
