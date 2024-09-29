import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="low"
export default class extends Controller {
  connect() {
    const isAgreed = this.element.querySelector('#check');
    const btn = this.element.querySelector('#btn');
    
    isAgreed.addEventListener('change', () => {
      btn.disabled = !isAgreed.checked;
    });
  }
}
