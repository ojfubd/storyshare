// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails";
import "./controllers"
import * as bootstrap from "bootstrap"
import "chartkick/chart.js"
import $ from 'jquery';
import 'slick-carousel';// SlickのJavaScriptをインポート

document.addEventListener('DOMContentLoaded', () => {
    const sliderElement = $('.slider');
    if (sliderElement.length) { // 要素が存在するか確認
        sliderElement.slick({
            autoplay: true, // 自動再生
            arrows: true,
            infinite: true,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1,
            dots: true
        });
    } else {
        console.error('スライダーの要素が見つかりませんでした');
    }
});