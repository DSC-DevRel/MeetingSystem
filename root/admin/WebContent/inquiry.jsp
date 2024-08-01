<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  // Servletのデータ受け取り
  request.setCharacterEncoding("UTF-8");
  String strName = (String) request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>照会</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- css読みこみ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
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
	          <button class="nav-link p-2 active"  aria-current="true" onclick="exec()" name="name" value="shokai">社員照会</button>
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
    <h2>照会ページ</h2>



            <% int count = (int) request.getAttribute("count");
               String[] ids = (String[]) request.getAttribute("resID");
               String[] names = (String[]) request.getAttribute("resName");
               String[] kanas = (String[]) request.getAttribute("resKananame");
            %>



    <form id="fm" action="/admin/MeetMenuController" method="post">
    <table class="table table-striped">
      <tr>
        <th scope="col">社員番号</th>
        <th scope="col">名前</th>
        <th scope="col">カナ</th>
        <th scope="col"></th><!-- btn -->
      </tr>
      <% for (int i = 0; i < count; i++) { %>
      <tr>
        <!-- 本当は選択したclassのデータを引っ張ってサーブレットに送りたかった -->
        <td scope="row" class="id"><%= ids[i] %><input type="hidden" name="ids<%= i %>" value="<%= ids[i] %>"></td>
        <td scope="row" class="name"><%= names[i] %><input type="hidden" name="names<%= i %>" value="<%= names[i] %>"></td>
        <td scope="row" class="kana"><%= kanas[i] %><input type="hidden" name="kanas<%= i %>" value="<%= kanas[i] %>"></td>
        <td scope="row"><button class="btn btn-primary" name="check" value="<%= i %>" onclick="editRow(this)">照会</button></td>
      </tr>
      <% } %>
    </table>
    </form>

	</div>


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- js読みこみ -->
<script src="js/bootstrap.min.js"></script>

<script>

</script>

<script>
    function editRow(button) {
        var form = document.getElementById("fm");
        form.action = "/admin/MeetMenuController"; // サーブレットのURLを指定
        form.method = "Post"; // POSTメソッドを指定

        form.submit(); // フォームを送信
    }
</script>

</html>

