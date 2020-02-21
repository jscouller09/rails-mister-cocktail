const initToggleForm = () => {
  const form = document.getElementById("new_dose");
  const button = document.getElementById("toggle-ingredient-button");
  button.addEventListener('click', (event) => {
    console.log(event)
  });
}

export { initToggleForm };
