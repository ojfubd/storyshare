import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-toggle"
export default class extends Controller {
  toggle(event) {
    const passwordInput = event.target.previousElementSibling; // ボタンの前の要素（input）を取得
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    event.target.textContent = type === 'password' ? '表示' : '非表示'; // ボタンのテキストを切り替え
  }
}