window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   

   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1 ));
    
    const profitPrice = document.getElementById("profit");
      const true_value = inputValue * 0.1 
      profitPrice.innerHTML = (Math.floor( inputValue - true_value ));
      
   
})
});