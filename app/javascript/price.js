  function memo() {
    let list = document.getElementById("item-price")
    let tax = document.getElementById("add-tax-price")
    let profit = document.getElementById("profit")
  
    list.addEventListener("keyup", () => {
      let amount = list.value;
      console.log(amount)
      let add_tax_price = Math.ceil(amount * 0.1);
      console.log(add_tax_price)
      let profit_number = Math.floor(amount * 0.9);
      console.log(profit_number)

      tax.innerHTML = add_tax_price
      profit.innerHTML = profit_number
    });
  };

window.addEventListener("load", memo);