import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
//完成途中
export default class extends Controller {
    // HTML要素のターゲットを指定している
    // 「input」はファイル選択のための入力フィールド、「preview」はプレビュー表示用の画像要素
  static targets = ["input", "preview"]

//   connectメソッドは、コントローラーが接続されたときに呼び出される
// this.inputTargetは、Stimulusが自動的に提供してくれるターゲットを指している
  connect() {
    this.inputTarget.addEventListener('change', this.previewImage.bind(this))
  }

  previewImage(event) {
    const file = event.target.files[0]
    if (file) {
      const reader = new FileReader()
      reader.onload = (e) => {
        this.previewTarget.src = e.target.result
        this.previewTarget.classList.remove('d-none') // 必要なら、表示するためのクラスを追加
      }
      reader.readAsDataURL(file)
    }
  }
}