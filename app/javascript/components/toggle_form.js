const initToggleForm = () => {
  const button = document.getElementById("toggle-ingredient-button");
  button.addEventListener('click', (event) => {
    const form = document.getElementById("new_dose");
    if (form.hasAttribute("hidden")) {
      event.currentTarget.innerHTML = `<i class="fas fa-minus pr-3"></i>&nbsp;Hide`;
    }
    else {
      event.currentTarget.innerHTML = `<i class="fas fa-plus pr-3"></i>&nbsp;Add ingredient`;
    }
    form.toggleAttribute("hidden");
  });
}

export { initToggleForm };
