import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-fill"
export default class extends Controller {
  connect() {
    this.element.addEventListener('click', this.autoFill.bind(this))
    const themeArea = document.getElementById('era');
    if (themeArea) {
      themeArea.addEventListener('input', this.countChara4.bind(this));
    }
  }

  countChara4() {
    const textArea = document.getElementById('era');
    const charCount = document.getElementById('charCount4');
    if (textArea && charCount) {
      charCount.textContent = textArea.value.length;
    }
  }

  //迷い要素：複数の値を表示させるかどうか
  autoFill() {
    const values = {
      1: "原始時代 - 紀元前3000年以前",
      2: "古代エジプト - 紀元前3000年頃",
      3: "メソポタミア文明 - 紀元前2500年頃",
      4: "古代インド - 紀元前2000年頃",
      5: "古代中国 - 紀元前1500年頃",
      6: "古代ギリシャ - 紀元前776年",
      7: "古代ローマ - 紀元前509年",
      8: "三国時代 - 3世紀",
      9: "ビザンチン帝国 - 330年",
      10: "中世ヨーロッパ - 5世紀から15世紀末",
      11: "イスラム黄金時代 - 8世紀から13世紀",
      12: "鎌倉時代 - 12世紀末から14世紀初頭",
      13: "ルネサンス - 14世紀から17世紀",
      14: "大航海時代 - 15世紀から17世紀",
      15: "江戸時代 - 17世紀から19世紀",
      16: "産業革命 - 18世紀後半から19世紀",
      17: "明治維新 - 19世紀後半",
      18: "第一次世界大戦 - 1914年から1918年",
      19: "第二次世界大戦 - 1939年から1945年",
      20: "冷戦時代 - 1947年から1991年",
      21: "ヴァイキング時代 - 8世紀から11世紀",
      22: "十字軍の時代 - 11世紀から13世紀",
      23: "室町時代 - 14世紀から16世紀",
      24: "オスマン帝国時代 - 14世紀から20世紀初頭",
      25: "百年戦争 - 14世紀から15世紀",
      26: "ルネサンス時代 - 14世紀から17世紀",
      27: "探検の時代 - 15世紀から17世紀",
      28: "宗教改革時代 - 16世紀",
      29: "エリザベス朝時代 - 16世紀",
      30: "江戸時代 - 17世紀から19世紀",
      31: "啓蒙時代 - 18世紀",
      32: "アメリカ独立戦争 - 18世紀後半",
      33: "フランス革命 - 18世紀末",
      34: "産業革命 - 18世紀後半から19世紀",
      35: "ビクトリア朝時代 - 19世紀",
      36: "明治時代 - 19世紀後半",
      37: "第一次世界大戦 - 1914年から1918年",
      38: "ロシア革命 - 1917年",
      39: "大恐慌 - 1929年",
      40: "第二次世界大戦 - 1939年から1945年",
      41: "冷戦時代 - 1947年から1991年",
      42: "宇宙時代 - 1957年",
      45: "グローバリゼーション - 20世紀末から21世紀",
      46: "情報時代 - 21世紀",
      47: "持続可能な開発の時代 - 21世紀",
      48: "人工知能の時代 - 21世紀",
      49: "パンデミック時代 - 21世紀初頭",
      50: "再生可能エネルギーの時代 - 21世紀",
      51: "夏王朝 - 紀元前2070年〜紀元前1600年",
      52: "商王朝 - 紀元前1600年〜紀元前1046年",
      53: "周王朝 - 紀元前1046年〜紀元前256年",
      54: "秦王朝 - 紀元前221年〜紀元前207年",
      55: "漢王朝 - 紀元前206年〜220年",
      56: "三国時代 - 220年〜280年",
      57: "晋王朝 - 280年〜420年",
      58: "南北朝時代 - 420年〜589年",
      59: "隋王朝 - 581年〜618年",
      60: "唐王朝 - 618年〜907年",
      61: "先住民時代 - 紀元前65000年頃から",
      62: "ヨーロッパ人による「発見」 - 1606年",
      63: "シドニー入植 - 1788年",
      64: "ゴールドラッシュ - 1851年",
      65: "オーストラリア連邦の成立 - 1901年",
      66: "キエフ大公国 - 9世紀〜12世紀",
      67: "タタールのくびき - 13世紀〜15世紀",
      68: "モスクワ大公国 - 1340年〜1547年",
      69: "ロシア・ツァーリ国 - 1547年〜1721年",
      70: "ロシア帝国 - 1721年〜1917年",
      71: "ソビエト連邦 - 1917年〜1991年",
      72: "ロシア連邦 - 1991年以降",
      73: "文郎国 - 紀元前8世紀",
      74: "甌雒 - 前257年〜前207年",
      75: "南越国 - 前207年〜前111年",
      76: "北属期 - 前111年〜939年",
      77: "李朝 - 1009年〜1225年",
      78: "陳朝 - 1225年〜1400年",
      79: "黎朝 - 1428年〜1788年",
      80: "西山朝 - 1778年〜1802年",
      81: "阮朝 - 1802年〜1945年",
      82: "フランス領インドシナ - 1887年〜1954年",
      83: "ベトナム戦争 - 1955年〜1975年",
      84: "ベトナム社会主義共和国 - 1976年以降",
      85: "チャビン文化 - 紀元前900年",
      86: "ワリ文化 - 600年〜1000年頃",
      87: "インカ帝国 - 1438年〜1533年",
      88: "植民地時代 - 16世紀〜19世紀",
      89: "独立国家の成立 - 19世紀初頭",
      90: "探検史・観測史 - 19世紀〜現在",
      91: "宋朝 - 960年から1279年まで",
      92: "元朝 - 1271年から1368年まで",
      93: "明朝 - 1368年から1644年まで",
      94: "清朝 - 1644年から1912年まで",
      95: "中華民国 - 1912年から1949年まで",
      96: "中華人民共和国 - 1949年から現在まで",
      97: "改革開放政策 - 1978年から",
      98: "天安門事件 - 1989年",
      99: "香港の返還 - 1997年",
      100: "加入国際組織 - 2001年",
      101: "オリンピック開催 - 2008年",
      102: "新型コロナウイルスの流行 - 2019年末から",
      103: "一帯一路政策 - 21世紀初頭から",
      104: "習近平の指導 - 2012年から"
    };
    const randNumber = Math.floor(Math.random() * 104) + 1; // 1から3ランダムな数を生成
    document.getElementById('era').value = values[randNumber];
  }
}

