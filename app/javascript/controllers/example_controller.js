// app/javascript/controllers/example_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]

  changeText() {
    this.outputTarget.textContent = "テキストが変更されました！"
  }
}
