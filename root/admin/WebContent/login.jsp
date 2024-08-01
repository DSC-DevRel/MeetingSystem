<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<script type="text/javascript">
	function exec() {
		document.getElementById("fm").submit();
	}
</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- css読みこみ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- フッター CSS -->
    <link href="css/sticky-footer.css" rel="stylesheet">

</head>
<body>

	<div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout">



	<div class="container-fluid">
    	<form id="fm" action="/admin/MainController" method="post">
    		<!-- divタグで分ける -->
    		<div class="card bg-light position-absolute top-50 start-50 translate-middle"  style="width: 30rem;">
    		  <h2>面談実施報告システム</h2>
    		  <br>
    		  <h4 class="card-title position-absolute" style="top: 70px; left: 16px;">ログイン</h4>
              <br>
              <div class="card-body">
                    		<div class="form-group">
				<p>ユーザー名：<br>
				<input type="text" name="name" class="form-control" placeholder="ユーザ名"></p>
			  </div>

   			  <div class="form-group">
				<p>パスワード：<br>
				<input type="text" name="pas"  class="form-control" placeholder="パスワード"></p>
			  </div>

			  <!-- buttonタグに変更 <p><input type="button" value="LOGIN" onclick="exec()" class="btn btn-primary"></p> -->
			  <button type="button" class="btn btn-primary" onclick="exec()">ログイン</button>
              </div><!-- card body -->
            </div><!-- card -->
		</form>

		<form id="fm" action="/admin/MainController" method="Get">
		    <% if (null != request.getAttribute("err")) { %>
    	       <p>エラー情報　：　<%=request.getAttribute("err") %></p>
     	   <% } %>

		</form>



	</div>
	</div>

	<footer class="footer">
      <div class="container text-center">
        <p class="text-muted">Data Sience Co.LTD</p>
      </div>
    </footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- js読みこみエラー出てるけど気にしない -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>