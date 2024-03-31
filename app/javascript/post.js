function count (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal =articleText.value*0.1;
    const charNum  = document.getElementById("add-tax-price");
    charNum.innerHTML = Math.round(countVal);

    const profitVal =articleText.value;
    const profitNum  = document.getElementById("profit");
    profitNum.innerHTML =articleText.value-Math.round(countVal);
    
  });
};



window.addEventListener('turbo:load', count);