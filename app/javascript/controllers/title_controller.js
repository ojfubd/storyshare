import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="title"
export default class extends Controller {

  //ここがmainメソッドと考える
  connect() {
    const nameArea = document.getElementById('name');
    nameArea.addEventListener('input', this.countName.bind(this));

    const summaryArea = document.getElementById('summary');
    summaryArea.addEventListener('input', this.countSummary.bind(this));

  }

  countName() {
    //文字列エリア
    const nameArea = document.getElementById('name');
    // 文字数
    const nameCount = document.querySelector('#nameCount');
    if (nameArea && nameCount) {
    nameCount.textContent = nameArea.value.length;
    }

    if(nameArea.value.length > 30){
      nameCount .classList.add('alert');
    }else{
      nameCount.classList.remove('alert');
    }
  }

  countSummary() {
    //文字列エリア
    const summaryArea = document.getElementById('summary');
    // 文字数
    const summaryCount = document.querySelector('#summaryCount');
    summaryCount.textContent = summaryArea.value.length;

    if(summaryArea.value.length > 50){
      summaryCount.classList.add('alert');
    }else{
      summaryCount.classList.remove('alert');
    }
  }

}
