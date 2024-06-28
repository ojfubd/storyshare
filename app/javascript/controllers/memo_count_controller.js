import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-fill"
export default class extends Controller {
  connect() {
    const themeArea = document.getElementById('memo');
    if (themeArea) {
      themeArea.addEventListener('input', this.countChara3.bind(this));
    }
  }

  countChara3() {
    const textArea = document.getElementById('memo');
    const charCount = document.getElementById('charCount2');
    if (textArea && charCount) {
      charCount.textContent = textArea.value.length;
    }
  }

}
