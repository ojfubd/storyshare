import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-fill"
export default class extends Controller {
  connect() {
    const themeArea = document.getElementById('body');
    if (themeArea) {
      themeArea.addEventListener('input', this.countChara3.bind(this));
    }
  }

  countChara3() {
    const textArea = document.getElementById('body');
    const charCount = document.getElementById('charCount6');
    if (textArea && charCount) {
      charCount.textContent = textArea.value.length;
    }
    if(textArea.value.length > 10000){
      charCount.classList.add('alert');
    }else{
      charCount.classList.remove('alert');
    }

  }

}
