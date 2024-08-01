<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  // Servletのデータ受け取り
  request.setCharacterEncoding("UTF8");
  String strName = (String) request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- css読みこみ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- フッター CSS -->
    <link href="css/sticky-footer.css" rel="stylesheet">
    <style>
    .hidden {
      display: none; /* 初期状態では非表示 */
    }
    .btnhidden_off {
      display: none; /* 初期状態では非表示 */
    }
    .fixed-label-width {
      width: 100px; /* ラベルの固定サイズを指定 */
    }
  </style>
</head>
<body>

	<header class="navbar navbar-expand-md navbar" style="background-color: #e3f2fd;">

	    <nav class="container-xxl flex-wrap flex-md-nowrap" aria-label="Main navigation">

	    <div class="collapse navbar-collapse" id="bdNavbar">
	      <form id="fm_menu" action="/admin/MenuController" method="Post">
	      <ul class="navbar-nav flex-row flex-wrap bd-navbar-nav pt-2 py-md-0">
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="menu">メニュー</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="meet">面談登録</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="shokai">社員照会</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2 active"  aria-current="true" onclick="exec()" name="name" value="insert">社員登録</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <a class="nav-link p-2"  onclick="ga('send', 'event', 'Navbar', 'Community links', 'Themes');" target="_blank" rel="noopener">-----</a>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <a class="nav-link p-2"  onclick="ga('send', 'event', 'Navbar', 'Community links', 'Blog');" target="_blank" rel="noopener">-----</a>
	        </li>
	      </ul>
		  </form>
	      <hr class="d-md-none text-white-50">


	      <form id="fm" action="/admin/MainController" method="Get">

	      <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">

	        <li class="nav-item dropdown">
              <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="lang" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <%=strName %>さん
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="lang">
                <a class="dropdown-item active" href="/docs/4.3/"> <%=strName %>さん </a>
                <a id="logout" class="dropdown-item">ログアウト</a>
              </div>
            </li>
	      </ul>

    	  </form>
        </div>
  		</nav>
	</header>


    <div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout">
	<h2>社員情報を登録</h2>

	<form id="fm_insert" action="/admin/InsEmpController" method="post">

		<br>
		<div class="input-group">
          <label class="input-group-text fixed-label-width" >社員番号</label>
          <input type="text" name="emp_id" id="input_id" class="form-control" placeholder="社員番号を６桁の半角数字で入力してください　例 203001">
        </div>
        <br>
		<div class="input-group">
          <label class="input-group-text fixed-label-width" > 名　前 </label>
          <input type="text" name="name" id="input_name" class="form-control" placeholder="名前を入力してください　例 出板　菜園酢">
        </div>
        <br>
        <div class="input-group">
          <label class="input-group-text fixed-label-width" > カ　ナ </label>
          <input type="text" name="kana" id="input_kana" class="form-control" placeholder="カナ名を入力してください　例　データ　サイエンス">
        </div>
        <br>
		<p>役職：<input class="form-check-input" type="checkbox" name="director"></p>

		<div class="input-group">
          <label class="input-group-text fixed-label-width" for="department"> 所　属 </label>
          <select class="form-select" id="department" name="department">
            <option selected value="0">所属...</option>
            <!-- 出来ればDBから持ってくる -->
            <option value="1">事業推部</option>
            <option value="2">営業部</option>
            <option value="3">運用技術部/運用1課</option>
            <option value="4">運用技術部/運用2課</option>
            <option value="5">運用技術部/運用3課</option>
            <option value="6">基盤技術部/基盤1課</option>
            <option value="7">基盤技術部/基盤2課</option>
            <option value="8">第1開発部/開発1課</option>
            <option value="9">第1開発部/開発2課</option>
            <option value="10">第1開発部/開発3課</option>
            <option value="11">第2開発部/開発1課</option>
            <option value="12">ビジネス推進</option>
          </select>
        </div>
        <br>

        <p>管理者として登録する：<input class="form-check-input" type="checkbox" id="toggleCheckbox" onchange="toggleVisibility()" name="admincheck"></p>

        <div id="dataToToggle" class="hidden">
          <!-- ここに表示・非表示させるデータを追加 -->
          <div class="input-group">
            <label class="input-group-text fixed-label-width" >パスワード</label>
            <input type="text" name="pass" id="input_pass" class="form-control" placeholder="ログイン用のパスワードを入力してください">
          </div>
          <br>
        </div>


        <p><button  class="btn btn-primary" id="btnins" name="ins" onclick="exec()">社員情報を登録する</button></p>
        <p><button  class="btn btn-success btnhidden_off" id="btnupd" name="upd" onclick="exec()">社員情報を更新する</button></p>
        <p><button  class="btn btn-danger btnhidden_off" id="btndel" name="del" onclick="exec()">社員情報を削除する</button></p>


	</form>

<br>
<br>


    <p>登録した社員の情報を更新する場合は以下のテーブルから参照し編集ボタンをクリックしてください。</p>
	<form id="fm" action="/admin/MenuController" method="Get">

            <% int count = (int) request.getAttribute("count"); %>
            <table class="table table-striped">
                <tr>
                    <th scope="col">社員番号</th>
                    <th scope="col">名前</th>
                    <th scope="col">カナ</th>
                    <th scope="col"></th>
                </tr>
            <% for (int i = 0; i < count; i++) { %>
                <tr>
                    <td scope="row" class="id"><%= ((String[])(request.getAttribute("resID")))[i] %></td>
                    <td scope="row" class="name"><%= ((String[])(request.getAttribute("resName")))[i] %></td>
                    <td scope="row" class="kana"><%= ((String[])(request.getAttribute("resKananame")))[i] %></td>
                    <td scope="row"><button type="button" class="selectBtn btn btn-success">編集</button></td>
                </tr>
            <% } %>
            </table>

	</form>

    </div>

    <br>

    <footer class="footer">
      <div class="container text-center">
        <p class="text-muted">Data Sience Co.LTD</p>
      </div>
    </footer>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- js読みこみ -->
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".selectBtn").on("click", selectBtn);
    });
	function selectBtn() {
		var name0 = $(this).closest('tr').find('.id').text();
        $("#input_id").val(name0);
		var name1 = $(this).closest('tr').find('.name').text();
        $("#input_name").val(name1);
        var name2 = $(this).closest('tr').find('.kana').text();
        $("#input_kana").val(name2);

        var btnins = document.getElementById('btnins');
        var btnupd = document.getElementById('btnupd');
        var btndel = document.getElementById('btndel');
        btnins.style.display = 'none';
        btnupd.style.display = 'block';
        btndel.style.display = 'block';

	}
	function exec() {
		document.getElementById("fm_insert").submit();
	}

	function toggleVisibility() {
	  var dataElement = document.getElementById('dataToToggle');
	  var checkbox = document.getElementById('toggleCheckbox');

	  // チェックボックスがチェックされていれば表示、そうでなければ非表示
	  dataElement.style.display = checkbox.checked ? 'block' : 'none';
	}


</script>

</html>
