import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="base"
export default class extends Controller {
  connect() {
    this.addClickListener();
    this.setActiveClass();
  }

  addClickListener() {
    const links = ['#make','#mypage', '#story', '#fevarite', '#notification'];

    links.forEach(selector => {
      const link = document.querySelector(selector);
      if (link) {
        link.addEventListener('click', this.handleClick.bind(this));
      } else {
        console.error(`${selector}要素が見つかりませんでした`);
      }
    });
  }

  handleClick(event) {
   // すべてのリンクからactiveクラスを削除
   const links = ['#make','#mypage', '#story', '#fevarite', '#notification'];
   links.forEach(selector => {
     const link = document.querySelector(selector);
     if (link) {
       link.classList.remove('active');
     }
   });
 
   // クリックされたリンクにactiveクラスを追加
   const link = event.currentTarget;
   link.classList.add('active');
  }


  setActiveClass() {
    // 現在のURLを取得
    const currentPath = window.location.pathname;
    const links = ['#make','#mypage', '#story', '#fevarite', '#notification'];

    links.forEach(selector => {
      const link = document.querySelector(selector);
      if (link && link.href === window.location.href) {
        link.classList.add('active');
      }
    });
  }
}
