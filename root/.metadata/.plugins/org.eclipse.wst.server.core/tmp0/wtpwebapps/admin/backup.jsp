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
	<title>バックアップ</title>
	<script type="text/javascript">
		function exec() {
			document.getElementById("fm").submit();
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
	<h2>バックアップ</h2>

	面談情報のデータをバックアップします。<br>
	注意！<br>
	バックアップは１日に１度のみ実施可能です。２度目のバックアップは失敗します。<br>
	<form id="fm" action="/admin/BackupController" method="Post">
    	<button class="btn btn-primary" name="check" value="backup" onclick="exec()">データバックアップ</button>
	</form>

    <form id="fm" action="/admin/BackupController" method="Get">
	    <% if (null != request.getAttribute("err")) { %>
        <p>エラー情報　：　<%=request.getAttribute("err") %></p>
        <% } %>

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

<script>
    function backup(button) {
        var form = document.getElementById("fm");
        form.action = "/admin/BackupController"; // サーブレットのURLを指定
        form.method = "Post"; // POSTメソッドを指定

        form.submit(); // フォームを送信
    }
</script>

</body>
</html>