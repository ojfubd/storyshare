import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="file"
export default class extends Controller {
  connect() {
    document.getElementById('download').addEventListener('click', function(event) {
      event.preventDefault(); // デフォルトの動作を防ぐ
      this.downloadFeedback();
  }.bind(this));
  }
  formatDataToMemo(username,name,category,theme,motif,memos,place,era,character,body) {
    return `--- メモ ---
    ${username}
    ${name}
    ${category}
    ${theme}
    ${motif}
    ${memos}
    ${place}
    ${era}
    ${character}
    本文:${body}
    -----------------`;
  }

  downloadFeedback() {
    // フォームの入力を取得
    const username = document.querySelector('#username').textContent;
    const name = document.querySelector('#name').textContent;
    const category = document.querySelector('#category').textContent;
    const theme = document.querySelector('#theme').textContent;
    const motif = document.querySelector('#motif').textContent;
    const memos = document.querySelector('#memo').textContent;
    const place = document.querySelector('#place').textContent;
    const era = document.querySelector('#era').textContent;
    const character = document.querySelector('#character').textContent;
    const body = document.querySelector('#body').textContent;


    // メモ形式に整形
    const memo = this.formatDataToMemo(username,name,category,theme,motif,memos,place,era,character,body);

    // Blobを生成
    const blob = new Blob([memo], { type: 'text/plain' });

    // URLを作成
    const url = window.URL.createObjectURL(blob);

    // ダウンロード用の一時的な<a>要素を生成
    const a = document.createElement('a');
    a.href = url;
    a.download = 'story.txt'; // ダウンロードするファイル名を指定

    // 一時的にDOMに追加
    document.body.appendChild(a);
    
    // 自動でクリックしてダウンロードを開始
    a.click(); 

    // 要素を削除
    document.body.removeChild(a); 

    // BlobのURLを即座に解放
    window.URL.revokeObjectURL(url); // URLを解放
  }

  
}
