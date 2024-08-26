import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chara-auto-fill"
export default class extends Controller {
  connect() {
    this.element.addEventListener('click', this.autoFill.bind(this))
    const themeArea = document.getElementById('chara');
    if (themeArea) {
      themeArea.addEventListener('input', this.countChara5.bind(this));
    }
  }

  countChara5() {
    const textArea = document.getElementById('chara');
    const charCount = document.getElementById('charCount5');
    if (textArea && charCount) {
      charCount.textContent = textArea.value.length;
    }
  }

  //迷い要素：複数の値を表示させるかどうか
  autoFill() {
    const values = {
      1: "クレオパトラ",
      2: "アレクサンダー大王",
      3: "ジュリアス・シーザー",
      4: "孔子",
      5: "レオナルド・ダ・ヴィンチ",
      6: "ガリレオ・ガリレイ",
      7: "シャカ・ズールー",
      8: "ジャンヌ・ダルク",
      9: "マルコ・ポーロ",
      10: "チンギス・ハン",
      11: "モーツァルト",
      12: "ナポレオン・ボナパルト",
      13: "イザベラ1世",
      14: "マハトマ・ガンジー",
      15: "マルティン・ルーサー",
      16: "クレオパトラ",
      17: "ールズ・ダーウィン",
      18: "アルベルト・アインシュタイン",
      19: "フロンス・ナイチンゲール",
      20: "リー・キュリー",
      21: "エリザベス1世",
      22: "ビクトリア女王",
      23: "アブラハム・リンカーン",
      24: "チャーチル",
      25: "ヒトラー",
      26: "スターリン",
      27: "マオ・ツェドン",
      28: "ネルソン・マンデラ",
      29: "マルコムX",
      30: "チェ・ゲバラ",
      31: "マザー・テレサ",
      32: "ダライ・ラマ",
      33: "タイガー",
      34: "レッサーパンダ",
      35: "クマ",
      36: "ワニ",
      37: "カメ",
      38: "サル",
      39: "ヘビ",
      40: "カエル",
      41: "カメレオン",
      42: "イグアナ",
      43: "ハリネズミ",
      44: "リス",
      45: "ウサギ",
      46: "ハムスター",
      47: "モルモット",
      48: "若者（男性） - ユウキ",
      49: "若者（女性） - メイ",
      50: "老人（男性） - カズオ",
      51: "老人（女性） - サチコ",
      52: "赤ちゃん（性別不明） - レン",
      53: "ライオン",
      54: "ゾウ",
      55: "キリン",
      56: "カバ",
      57: "シマウマ",
      58: "カンガルー",
      59: "パンダ",
      60: "コアラ",
      61: "ゴリラ",
      62: "チンパンジー",
      63: "オランウータン",
      64: "ペンギン",
      65: "フラミンゴ",
      66: "イルカ",
      67: "シロクマ",
      68: "赤ちゃん（男の子） - タロウ",
      69: "赤ちゃん（女の子） - ハナコ",
      70: "子供（男の子） - ケンタ",
      71: "子供（女の子） - ユキ",
      72: "成人男性 - シンジ",
      73: "成人女性 - アキコ",
      74: "中年男性 - ヒロシ",
      75: "中年女性 - ケイコ",
      76: "高齢男性 - ソウイチロウ",
      77: "高齢女性 - フミコ"
      };
      const randNumber = Math.floor(Math.random() * 77) + 1; // 1から3ランダムな数を生成
      const randNumber2 = Math.floor(Math.random() * 77) + 1;
      const randNumber3 = Math.floor(Math.random() * 77) + 1;

      // 連結する個数を1から3の間でランダムに決定
      const randomCount = Math.floor(Math.random() * 3) + 1;

      let result = "";

      // randomCountに応じて値を連結
      if (randomCount === 1) {
        result = values[randNumber];
      } else if (randomCount === 2) {
        result = values[randNumber] + ", " + values[randNumber2];
      } else if (randomCount === 3) {
        result = values[randNumber] + ", " + values[randNumber2] + ", " + values[randNumber3];
      }


      document.getElementById('chara').value = result;
    }
}
