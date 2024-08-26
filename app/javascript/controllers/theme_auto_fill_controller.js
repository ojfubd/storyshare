import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-fill"
export default class extends Controller {
  connect() {
    this.element.addEventListener('click', this.autoFill.bind(this))
    const themeArea = document.getElementById('theme');
    if (themeArea) {
      themeArea.addEventListener('input', this.countChara.bind(this));
    }
  }

  countChara() {
    const textArea = document.getElementById('theme');
    const charCount = document.getElementById('charCount');
    if (textArea && charCount) {
      charCount.textContent = textArea.value.length;
    }
  }

  //迷い要素：複数の値を表示させるかどうか
  autoFill() {
    const values = {
      1: "受容：ありのままの自分を受け入れてもらう",
      2: "正確：自分の意見や信念正しく伝える",
      3: "達成：なにか重要なことを達成する",
      4: "冒険：新しくてワクワクする体験をする",
      5: "魅力：身体的な魅力を保つ",
      6: "権威：他者に対して責任を持って指導する",
      7: "自治：人まかせにしないで自分で決める",
      8: "美的：身のまわりの美しいものを味わう",
      9: "庇護：他者のめんどうをみる",
      10: "挑戦：難しい仕事や問題に取り組む",
      11: "変化：変化に富んだバラエティ豊かな人生を送る",
      12: "快適：喜びに満ちた快適な人生を送る",
      13: "誓約：絶対に破れない約束や近いを結ぶ",
      14: "慈愛：他者を心配して助ける",
      15: "貢献：世界の役に立つことをする",
      16: "協調：他者と強力して何かをする",
      17: "礼儀：他者に対して誠実で礼儀正しく接する",
      18: "創造：新しくて斬新なアイデアを生む",
      19: "信頼：信用があって頼れる人間になる",
      20: "義務：自分の義務と責任を果たす",
      21: "調和：周囲の環境と調和しながら生きる",
      22: "興奮：スリルと刺激に満ちた人生を送る",
      23: "貞節：パートナーにウソをつかず誠実に生きる",
      24: "名声：有名になって存在を認めれる",
      25: "家族：幸福で愛に満ちた家庭を作る",
      26: "体力：丈夫で強い身体を保つ",
      27: "柔軟：新たな環境にも簡単になじむ",
      28: "許し：他人を許しながら生きる",
      29: "友情：親密で助け合える友人を作る",
      30: "愉楽：遊んで楽しむこと",
      31: "寛大：自分の物を他人にあたえる",
      32: "真実：自分が正しいと思うとおりに行動する",
      33: "信教：自分を超えた存在の意思を考える",
      34: "成長：変化と成長を維持する",
      35: "健康：健やかで体調よく生きる",
      36: "有益：他人の役に立つこと",
      37: "正直：ウソをつかず正直に生きる",
      38: "希望：ポジティブで楽観的に生きる",
      39: "謙遜：地味で控えめに生きる",
      40: "笑い：人生や世界のユーモラスな側面を見る",
      41: "独立：他者に依存しないで生きる",
      42: "勤勉：自分の仕事に一生懸命取り組む",
      43: "平安：自分の内面の平和を維持する",
      44: "親密：プライベートな体験を他人とシェアする",
      45: "正義：すべての人を公平に扱う",
      46: "知識：価値ある知識を学ぶ、または生み出す",
      47: "余暇：自分の時間をリラックスして楽しむ",
      48: "寵愛：親しい人から愛される",
      49: "愛慕：誰かに愛をあたえる",
      50: "熟達：いつもの仕事・作業に習熟する",
      51: "現在：いまの瞬間に集中して生きる",
      52: "適度：過剰を避けてほどよいところを探す",
      53: "単婚：唯一の愛し合える相手を見つける",
      54: "反抗：権威やルールに疑問を持って挑む",
      55: "配慮：他人を心づかって世話すること",
      56: "開放：新たな体験、発想、選択肢に心を開く",
      57: "秩序：整理されて秩序のある人生を送る",
      58: "情熱：なんらかの発想、活動、人々に深い感情を抱く",
      59: "快楽：良い気分になること",
      60: "人気：多くの人に好かれる",
      61: "権力：他人をコントロールする",
      62: "目的：人生の意味を方向性を定める",
      63: "合理：理性と論理に従う",
      64: "現実：現実的、実践的にふるまう",
      65: "責任：責任をもって行動する",
      66: "危険：リスクを取ってチャンスを手に入れる",
      67: "恋愛：興奮して燃えるような恋をする",
      68: "安全：安心感を得る",
      69: "受諾：ありのままの自分を受け入れる",
      70: "自制：自分の行動を自分でコントロールする",
      71: "自尊：自分に自信を持つ",
      72: "自知：自分について深い理解を持つ",
      73: "献身：誰かに奉仕する",
      74: "性愛：活動的で満足のいく性生活を送る",
      75: "単純：シンプルでミニマルな暮らしをする",
      76: "孤独：他人から離れて１人でいられる時間と空間を持つ",
      77: "精神：精神的に成長し成熟する",
      78: "安定：いつも一定して変化のない人生を送る",
      79: "寛容：自分と違う存在を尊重して受け入れる",
      80: "伝統：過去から受け継がれてきたパターンを尊重する"
    };
    const randNumber = Math.floor(Math.random() * 80) + 1; // 1から3ランダムな数を生成
    document.getElementById('theme').value = values[randNumber];
  }
}
