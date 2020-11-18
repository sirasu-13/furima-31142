function tax() {

  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('change', () => {
        const price = itemPrice.value;
        const taxPriceAdd = document.getElementById("add-tax-price");
        const profit = document.getElementById("profit");
        const taxPrice = price * 0.1;
        const saleProfit = price - taxPrice;

        taxPriceAdd.innerHTML = taxPrice;
        profit.innerHTML = saleProfit;
    });
}
window.addEventListener("load", tax);