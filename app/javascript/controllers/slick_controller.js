import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slick"
export default class extends Controller {
  connect() {
    const btn = document.querySelector('#barkbtn');
    btn.addEventListener('click', () =>{
      document.body.classList.toggle('dark-theme');

      if(btn.textContent === 'ダークモードにする'){
        btn.textContent = 'ライトモードにする';
      } else {
        btn.textContent = 'ダークモードにする';
      }
    });
  }
}
