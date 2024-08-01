var ctx = document.getElementById("myRadarChart");
var myRadarChart = new Chart(ctx, {
  //グラフの種類
  type: 'radar',
  //データの設定
  data: {
    labels: ['体調', '人間関係', '会社制度', '仕事内容', '業務状況', '私生活'],
    datasets: [{
      label: 'チャート',
      //グラフのデータ
      data: [3, 3, 3, 3, 3, 3],
      // データライン
      borderColor: 'blue',
    }],
  },
  //オプションの設定
  options: {
    scales: {
      r: {
        //グラフの最小値・最大値
        min: 0,
        max: 9,
        //背景色
        backgroundColor: '#FFF',
        //グリッドライン
        grid: {
          color: '#888',
        },
        //アングルライン
        angleLines: {
          color: '#888',
        },
        //各項目のラベル
        pointLabels: {
          color: 'black',
        },
      },
    },
  },
});

function bcbtnClick(){
    //ここにボタン押したときのレーダーチャートが動く仕組み入れる

	var bodyCondition1 = parseInt(document.querySelector('input[name="bodyCondition1"]:checked').value);
	var bodyCondition2 = parseInt(document.querySelector('input[name="bodyCondition2"]:checked').value);
	var bodyCondition3 = parseInt(document.querySelector('input[name="bodyCondition3"]:checked').value);
	var Relationship1 = parseInt(document.querySelector('input[name="Relationship1"]:checked').value);
	var Relationship2 = parseInt(document.querySelector('input[name="Relationship2"]:checked').value);
	var Relationship3 = parseInt(document.querySelector('input[name="Relationship3"]:checked').value);
	var companySystems1 = parseInt(document.querySelector('input[name="companySystems1"]:checked').value);
	var companySystems2 = parseInt(document.querySelector('input[name="companySystems2"]:checked').value);
	var companySystems3 = parseInt(document.querySelector('input[name="companySystems3"]:checked').value);
	var JobDescription1 = parseInt(document.querySelector('input[name="JobDescription1"]:checked').value);
	var JobDescription2 = parseInt(document.querySelector('input[name="JobDescription2"]:checked').value);
	var JobDescription3 = parseInt(document.querySelector('input[name="JobDescription3"]:checked').value);
	var progress1 = parseInt(document.querySelector('input[name="progress1"]:checked').value);
	var progress2 = parseInt(document.querySelector('input[name="progress2"]:checked').value);
	var progress3 = parseInt(document.querySelector('input[name="progress3"]:checked').value);
	var privateLife1 = parseInt(document.querySelector('input[name="privateLife1"]:checked').value);
	var privateLife2 = parseInt(document.querySelector('input[name="privateLife2"]:checked').value);
	var privateLife3 = parseInt(document.querySelector('input[name="privateLife3"]:checked').value);

	var newData = [bodyCondition1 + bodyCondition2 + bodyCondition3
		         , Relationship1 + Relationship2 + Relationship3
		         , companySystems1 + companySystems2 + companySystems3
		         , JobDescription1 + JobDescription1 + JobDescription1
		         , progress1 + progress2 + progress3
		         , privateLife1 + privateLife2 + privateLife3];

    // データを更新する
    myRadarChart.data.datasets[0].data = newData;

    // チャートを再描画する
    myRadarChart.update();
};