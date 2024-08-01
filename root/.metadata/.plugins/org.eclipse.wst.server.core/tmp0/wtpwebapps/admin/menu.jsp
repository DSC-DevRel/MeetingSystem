<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  // Servletのデータ受け取り
  request.setCharacterEncoding("UTF8");
  String strName = (String) request.getAttribute("name");
%>
<html>

<head>
	<meta charset="UTF-8">
	<title>Menu</title>
	<script type="text/javascript">
		function exec() {
			document.getElementById("fm").submit();
		}
		function exec() {
			document.getElementById("fm_menu").submit();
		}
		function exec_menu() {
		    var name = "name"; // 名前を設定
		    var value = "menu"; // 値を設定
		    var form = document.getElementById("fm_menu"); // フォームのIDを取得
		    var input = document.createElement("input"); // 新しいinput要素を作成
		    input.setAttribute("type", "hidden"); // type属性を設定
		    input.setAttribute("name", name); // name属性を設定
		    input.setAttribute("value", value); // value属性を設定
		    form.appendChild(input); // input要素をフォームに追加
		    form.action = "/admin/MenuController"; // アクションを設定
		    form.method = "POST"; // メソッドを設定
		    form.submit();
		}
		function exec_meet() {
		    var name = "name";
		    var value = "meet";
		    var form = document.getElementById("fm_menu");
		    var input = document.createElement("input");
		    input.setAttribute("type", "hidden");
		    input.setAttribute("name", name);
		    input.setAttribute("value", value);
		    form.appendChild(input);
		    form.action = "/admin/MenuController";
		    form.method = "POST";
		    form.submit();
		}
		function exec_shokai() {
		    var name = "name";
		    var value = "shokai";
		    var form = document.getElementById("fm_menu");
		    var input = document.createElement("input");
		    input.setAttribute("type", "hidden");
		    input.setAttribute("name", name);
		    input.setAttribute("value", value);
		    form.appendChild(input);
		    form.action = "/admin/MenuController";
		    form.method = "POST";
		    form.submit();
		}
		function exec_insert() {
		    var name = "name";
		    var value = "insert";
		    var form = document.getElementById("fm_menu");
		    var input = document.createElement("input");
		    input.setAttribute("type", "hidden");
		    input.setAttribute("name", name);
		    input.setAttribute("value", value);
		    form.appendChild(input);
		    form.action = "/admin/MenuController";
		    form.method = "POST";
		    form.submit();
		}
		function exec_setting() {
		    var name = "name";
		    var value = "setting";
		    var form = document.getElementById("fm_menu");
		    var input = document.createElement("input");
		    input.setAttribute("type", "hidden");
		    input.setAttribute("name", name);
		    input.setAttribute("value", value);
		    form.appendChild(input);
		    form.action = "/admin/MenuController";
		    form.method = "POST";
		    form.submit();
		}
		function exec_backup() {
		    var name = "name";
		    var value = "backup";
		    var form = document.getElementById("fm_menu");
		    var input = document.createElement("input");
		    input.setAttribute("type", "hidden");
		    input.setAttribute("name", name);
		    input.setAttribute("value", value);
		    form.appendChild(input);
		    form.action = "/admin/MenuController";
		    form.method = "POST";
		    form.submit();
		}


	</script>
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- css読みこみ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/pricing.css" rel="stylesheet">
    <!-- フッター CSS -->
    <link href="css/sticky-footer.css" rel="stylesheet">
</head>

<body>

	<header class="navbar navbar-expand-md navbar" style="background-color: #e3f2fd;">

	    <nav class="container-xxl flex-wrap flex-md-nowrap" aria-label="Main navigation">

	    <div class="collapse navbar-collapse" id="bdNavbar">
	      <form id="fm_menu" action="/admin/MenuController" method="Post">
	      <ul class="navbar-nav flex-row flex-wrap bd-navbar-nav pt-2 py-md-0">
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2 active"  aria-current="true" onclick="exec()" name="name" value="menu">メニュー</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="meet">面談登録</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="shokai">社員照会</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="insert">社員登録</button>
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
	<h2>menu</h2>

    <form id="fm_menu" action="/admin/MenuController" method="Post">

        <div class="row row-cols-1 row-cols-md-3 g-4">
          <div class="col">
            <div class="card">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false" onclick="exec_menu()">
                <rect width="100%" height="100%" fill="#D2E0E6"></rect>
                <image href="./img/menu.png" width="100%" height="100%" />
              </svg>
              <div class="card-body">
                <h5 class="card-title">Menu ページ</h5>
                <p class="card-text">メニュー画面初期画面を再表示します。</p>
                <button onclick="exec()" class="btn btn-primary" name="name" value="menu" style="width: 150px;">メニュー</button>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false" onclick="exec_meet()">
                <rect width="100%" height="100%" fill="#D2E0E6"></rect>
                <image href="./img/meet.png" width="100%" height="100%" />
              </svg>
              <div class="card-body">
                <h5 class="card-title">面談 ページ</h5>
                <p class="card-text">新規に面談を実施する場合はこちらから</p>
                <button onclick="exec()" class="btn btn-primary" name="name" value="meet" style="width: 150px;">新規面談</button>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false" onclick="exec_shokai()">
                <rect width="100%" height="100%" fill="#D2E0E6"></rect>
                <image href="./img/inquiry.png" width="100%" height="100%" />
              </svg>
              <div class="card-body">
                <h5 class="card-title">照会 ページ</h5>
                <p class="card-text">社員の面談情報を確認する場合はこちらから</p>
                <button onclick="exec()" class="btn btn-primary" name="name" value="shokai" style="width: 150px;">社員情報照会</button>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false" onclick="exec_insert()">
                <rect width="100%" height="100%" fill="#D2E0E6"></rect>
                <image href="./img/insert.png" width="100%" height="100%" />
              </svg>
              <div class="card-body">
                <h5 class="card-title">社員登録 ページ</h5>
                <p class="card-text">社員情報登録・修正はこちらから</p>
                <button onclick="exec()" class="btn btn-primary" name="name" value="insert" style="width: 150px;">社員情報登録</button>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false" onclick="exec_setting()">
                <rect width="100%" height="100%" fill="#D2E0E6"></rect>
                <image href="./img/setting.png" width="100%" height="100%" />
              </svg>
              <div class="card-body">
                <h5 class="card-title">設定 ページ</h5>
                <p class="card-text">設定はこちらから</p>
                <button onclick="exec()" class="btn btn-primary" name="name" value="setting" style="width: 150px;">設定</button>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false" onclick="exec_backup()">
                <rect width="100%" height="100%" fill="#D2E0E6"></rect>
                <image href="./img/backup.png" width="100%" height="100%" />
              </svg>
              <div class="card-body">
                <h5 class="card-title">バックアップ ページ</h5>
                <p class="card-text">DBのバックアップ作業はこちらから</p>
                <button onclick="exec()" class="btn btn-primary" name="name" value="backup" style="width: 150px;">バックアップ</button>
              </div>
            </div>
          </div>
        </div>


    </form>
<br>
<br>
<br>
	</div>

    <!-- フッター -->
	<footer class="footer">
      <div class="container text-center">
        <p class="text-muted">Data Sience Co.LTD</p>
      </div>
    </footer>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- js読みこみ -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>