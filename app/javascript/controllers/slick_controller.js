import { Controller } from "@hotwired/stimulus"
import 'slick-carousel'
// Connects to data-controller="slick"
export default class extends Controller {
  connect() {
    $('.slider').slick({
      dots: true,
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true // 矢印ボタンを表示
    });
  }
}
