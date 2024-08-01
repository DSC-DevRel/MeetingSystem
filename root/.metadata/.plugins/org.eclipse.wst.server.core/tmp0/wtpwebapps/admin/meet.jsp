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
	<title>Meeting</title>
	<script type="text/javascript" src="js/package/dist/chart.js"></script>
	<script type="text/javascript" src="js/radarChart.js"></script>


	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- css読みこみ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
    function exec() {
	  document.getElementById("fm").submit();
    }
</script>

</head>
<body>
	<div class="skippy visually-hidden-focusable overflow-hidden">
	  <div class="container-xl">
	    <a class="d-inline-flex p-2 m-1" href="#content">Skip to main content</a>
	    <a class="d-none d-md-inline-flex p-2 m-1" href="#bd-docs-nav">Skip to docs navigation</a>
	  </div>
	</div>


	<header class="navbar navbar-expand-md navbar" style="background-color: #e3f2fd;">

	    <nav class="container-xxl flex-wrap flex-md-nowrap" aria-label="Main navigation">

	    <div class="collapse navbar-collapse" id="bdNavbar">
	      <form id="fm_menu" action="/admin/MenuController" method="Post">
	      <ul class="navbar-nav flex-row flex-wrap bd-navbar-nav pt-2 py-md-0">
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2" onclick="exec()" name="name" value="menu">メニュー</button>
	        </li>
	        <li class="nav-item col-6 col-md-auto">
	          <button class="nav-link p-2 active"  aria-current="true" onclick="exec()" name="name" value="meet">面談登録</button>
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

	<!-- 本当はDBからデータを抽出したかった -->
    <!-- 横幅余白調整 -->
	<div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout">

	<%
	   //編集時データ整理
	   String resId = (String) request.getAttribute("resID");
       if (resId != null) {

    	   String resName = (String) request.getAttribute("resName");
    	   String resDate = (String) request.getAttribute("resDate");
    	   String resSituation = (String) request.getAttribute("resSituation");
    	   String resOpinion = (String) request.getAttribute("resOpinion");
    	   String resTransfer = (String) request.getAttribute("resTransfer");
    	   String resAnalysis = (String) request.getAttribute("resAnalysis");
    	   String resCheck_1_1 = (String) request.getAttribute("resCheck_1_1");
    	   String resCheck_1_2 = (String) request.getAttribute("resCheck_1_2");
    	   String resCheck_1_3 = (String) request.getAttribute("resCheck_1_3");
    	   String resCheck_2_1 = (String) request.getAttribute("resCheck_2_1");
    	   String resCheck_2_2 = (String) request.getAttribute("resCheck_2_2");
    	   String resCheck_2_3 = (String) request.getAttribute("resCheck_2_3");
    	   String resCheck_3_1 = (String) request.getAttribute("resCheck_3_1");
    	   String resCheck_3_2 = (String) request.getAttribute("resCheck_3_2");
    	   String resCheck_3_3 = (String) request.getAttribute("resCheck_3_3");
    	   String resCheck_4_1 = (String) request.getAttribute("resCheck_4_1");
    	   String resCheck_4_2 = (String) request.getAttribute("resCheck_4_2");
    	   String resCheck_4_3 = (String) request.getAttribute("resCheck_4_3");
    	   String resCheck_5_1 = (String) request.getAttribute("resCheck_5_1");
    	   String resCheck_5_2 = (String) request.getAttribute("resCheck_5_2");
    	   String resCheck_5_3 = (String) request.getAttribute("resCheck_5_3");
    	   String resCheck_6_1 = (String) request.getAttribute("resCheck_6_1");
    	   String resCheck_6_2 = (String) request.getAttribute("resCheck_6_2");
    	   String resCheck_6_3 = (String) request.getAttribute("resCheck_6_3");

    %>

	<!-- インサート用スクリプト -->
	<form id="fm_meet" action="/admin/MeetController" method="Post">

    <h2>面談照会</h2>
    <div class="row g-1" >
	  <!-- 社員入力グループ -->
      <div class="card-group border border-secondary-subtle rounded">
        <div class="col">
          <div class="card border border-0">
            <div class="card-body">
              <div class="input-group">
              <label class="input-group-text" for="Affiliation">所属</label>
              <select class="form-select" id="Affiliation" name="Affiliation" onchange="filterData()">
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
            </div>
          </div>
        </div><!-- col -->

        <div class="col">
          <div class="card border border-0" >
            <div class="card-body">
              <div class="input-group">
                <label class="input-group-text" for="Project">プロジェクト</label>
                <select class="form-select" id="Project" name="Project">
                  <option selected>Project...</option>
                  <!-- 出来ればDBから持ってくる -->
                  <option value="1">Aプロジェクト</option>
                  <option value="2">Bプロジェクト</option>
                  <option value="3">C</option>
                  <option value="4">D</option>
                  <option value="5">E</option>
                </select>
              </div>
            </div>
          </div>
        </div><!-- col -->



        <div class="col">
          <div class="card border border-0" >
            <div class="card-body">
              <div class="input-group">
                <label class="input-group-text" for="Name">氏名</label>
                <select class="form-select" id="Name" name="Name">
                  <option selected value="<%= resId %>" data-department="0"><%= resName %></option>
        <%@ page import="com.example.admin.empListData" %>
        <%
          // リクエスト属性からデータを取得する
          empListData[] employeeList = (empListData[]) request.getAttribute("jsonData");
          // データを表示
          for (empListData employee : employeeList) {
        %>
                 <option value="<%= employee.getId() %>" data-department="<%= employee.getDepart() %>"><%= employee.getName() %></option>
        <%
          }
        %>
                </select>
              </div>
            </div>
          </div>
        </div><!-- col -->
      </div><!-- card-group -->

    </div><!-- row -->

<br>
    <div class="row">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">状況・問題</span>
              <textarea class="form-control" aria-label="With textarea" id="situation" name="situation"><%= resSituation %></textarea>
            </div>
          </div>
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">　所 見　</span>
              <textarea class="form-control" aria-label="With textarea" id="opinion" name="opinion"><%= resOpinion %></textarea>
            </div>
          </div>
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">事業推進部への<br>申し送り</span>
              <textarea class="form-control" aria-label="With textarea" id="transfer" name="transfer"><%= resTransfer %></textarea>
            </div>
          </div>
        </div>
      </div>
    </div><!-- row -->

<br>
    <div class="row row-cols-1 row-cols-md-2 g-4">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">体 調</h5>

            <p class="card-text">睡眠不足、食欲不振、倦怠感がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="bodyCondition1" aria-label="睡眠不足、食欲不振、倦怠感がある">

                <% if (resCheck_1_1.equals("1")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr3">ほとんどない</label>
                <% } else if (resCheck_1_1.equals("2")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr3">ほとんどない</label>
                <% } else if (resCheck_1_1.equals("3")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">体調が悪い</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="bodyCondition2" aria-label="体調が悪い">

                <% if (resCheck_1_2.equals("1")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr3">ほとんどない</label>
                <% } else if (resCheck_1_2.equals("2")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr3">ほとんどない</label>
                <% } else if (resCheck_1_2.equals("3")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">やる気が出ない</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="bodyCondition3" aria-label="やる気が出ない">

                <% if (resCheck_1_3.equals("1")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr1">いつも出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr2">時々出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr3">ほとんど問題ない</label>
                <% } else if (resCheck_1_3.equals("2")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr1">いつも出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr2">時々出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr3">ほとんど問題ない</label>
                <% } else if (resCheck_1_3.equals("3")) { %>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr1">いつも出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr2">時々出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr3">ほとんど問題ない</label>
                <% } %>
                </div>
              </div>
            </div>

          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- col -->
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">人間関係</h5>

            <p class="card-text">上司（管理職）に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="Relationship1" aria-label="上司（管理職）に不満がある">
                <% if (resCheck_2_1.equals("1")) { %>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr3">ほとんどない</label>
                <% } else if (resCheck_2_1.equals("2")) { %>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr3">ほとんどない</label>
                <% } else if (resCheck_2_1.equals("3")) { %>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship1_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">先輩、同僚に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="Relationship2" aria-label="先輩、同僚に不満がある">
                <% if (resCheck_2_2.equals("1")) { %>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr3">ほとんどない</label>
                <% } else if (resCheck_2_2.equals("2")) { %>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr3">ほとんどない</label>
                <% } else if (resCheck_2_2.equals("3")) { %>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship2_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">ﾊﾟﾜﾊﾗ、ｾｸﾊﾗ、嫌がらせ等を受けている</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="Relationship3" aria-label="ﾊﾟﾜﾊﾗ、ｾｸﾊﾗ、嫌がらせ等を受けている">
                <% if (resCheck_2_3.equals("1")) { %>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr3">ほとんどない</label>
                <% } else if (resCheck_2_3.equals("2")) { %>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr3">ほとんどない</label>
                <% } else if (resCheck_2_3.equals("3")) { %>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship3_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">会社制度</h5>

            <p class="card-text">評価、給与に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="companySystems1" aria-label="評価、給与に不満がある">

                <% if (resCheck_3_1.equals("1")) { %>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr3">ほとんどない</label>
                <% } else if (resCheck_3_1.equals("2")) { %>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr3">ほとんどない</label>
                <% } else if (resCheck_3_1.equals("3")) { %>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems1_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">ｷｬﾘｱｱｯﾌﾟ、会社の将来に不安がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="companySystems2" aria-label="ｷｬﾘｱｱｯﾌﾟ、会社の将来に不安がある">

                <% if (resCheck_3_2.equals("1")) { %>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr3">ほとんどない</label>
                <% } else if (resCheck_3_2.equals("2")) { %>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr3">ほとんどない</label>
                <% } else if (resCheck_3_2.equals("3")) { %>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems2_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">会社の制度、雰囲気に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="companySystems3" aria-label="会社の制度、雰囲気に不満がある">

                <% if (resCheck_3_3.equals("1")) { %>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr3">ほとんどない</label>
                <% } else if (resCheck_3_3.equals("2")) { %>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr3">ほとんどない</label>
                <% } else if (resCheck_3_3.equals("3")) { %>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems3_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->

      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">仕事内容</h5>

            <p class="card-text">仕事内容に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="JobDescription1" aria-label="上司（管理職）に不満がある">

                <% if (resCheck_4_1.equals("1")) { %>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr3">ほとんどない</label>
                <% } else if (resCheck_4_1.equals("2")) { %>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr3">ほとんどない</label>
                <% } else if (resCheck_4_1.equals("3")) { %>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">仕事の成果が芳しくない</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="JobDescription2" aria-label="仕事の成果が芳しくない">

                <% if (resCheck_4_2.equals("1")) { %>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr1">よくある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr3">ほとんどない</label>
                <% } else if (resCheck_4_2.equals("2")) { %>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr1">よくある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr3">ほとんどない</label>
                <% } else if (resCheck_4_2.equals("3")) { %>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr1">よくある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">他の仕事に興味がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="JobDescription3" aria-label="他の仕事に興味がある">

                <% if (resCheck_4_3.equals("1")) { %>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr3">ほとんどない</label>
                <% } else if (resCheck_4_3.equals("2")) { %>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr3">ほとんどない</label>
                <% } else if (resCheck_4_3.equals("3")) { %>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->

      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">業務状況</h5>

            <p class="card-text">残業の多さ、休日出勤に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="progress1" aria-label="残業の多さ、休日出勤に不満がある">

                <% if (resCheck_5_1.equals("1")) { %>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr3">ほとんどない</label>
                <% } else if (resCheck_5_1.equals("2")) { %>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr3">ほとんどない</label>
                <% } else if (resCheck_5_1.equals("3")) { %>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress1_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">仕事量の多さに不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="progress2" aria-label="仕事量の多さに不満がある">

                <% if (resCheck_5_2.equals("1")) { %>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr3">ほとんどない</label>
                <% } else if (resCheck_5_2.equals("2")) { %>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr3">ほとんどない</label>
                <% } else if (resCheck_5_2.equals("3")) { %>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress2_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">勤務形態に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="progress3" aria-label="勤務形態に不満がある">

                <% if (resCheck_5_3.equals("1")) { %>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr3">ほとんどない</label>
                <% } else if (resCheck_5_3.equals("2")) { %>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr3">ほとんどない</label>
                <% } else if (resCheck_5_3.equals("3")) { %>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress3_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->


      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">私生活</h5>

            <p class="card-text">私生活が充実していない</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="privateLife1" aria-label="私生活が充実していない">

                <% if (resCheck_6_1.equals("1")) { %>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr3">ほとんどない</label>
                <% } else if (resCheck_6_1.equals("2")) { %>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr3">ほとんどない</label>
                <% } else if (resCheck_6_1.equals("3")) { %>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife1_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">私生活で問題を抱えている</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="privateLife2" aria-label="私生活で問題を抱えている">

                <% if (resCheck_6_2.equals("1")) { %>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr3">ほとんどない</label>
                <% } else if (resCheck_6_2.equals("2")) { %>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr3">ほとんどない</label>
                <% } else if (resCheck_6_2.equals("3")) { %>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife2_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">仕事によって私生活に悪影響がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="privateLife3" aria-label="仕事によって私生活に悪影響がある">

                <% if (resCheck_6_3.equals("1")) { %>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr3">ほとんどない</label>
                <% } else if (resCheck_6_3.equals("2")) { %>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr3">ほとんどない</label>
                <% } else if (resCheck_6_3.equals("3")) { %>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife3_btnr3">ほとんどない</label>
                <% } %>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->

    </div><!-- row -->

<br>
    <div class="row">
    </div><!-- row -->

    <div class="row">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">チェックリストの分析</span>
              <textarea class="form-control" aria-label="With textarea" id="analysis" name="analysis"><%= resAnalysis %></textarea>
            </div>
          </div>
        </div>
      </div>
    </div><!-- row -->


<br>
    <!-- チャート情報 -->
    <div class="row row-cols-1 row-cols-md-2 g-4">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <div class="graph">
              <canvas id="myRadarChart" width="400" height="400"></canvas>
            </div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card" >
          <div class="card-body">
            <input type="hidden" name="meetdate" value="<%= resDate %>"><!-- 最終手段この手に限る -->
            <button id="menudata" class="btn btn-success" onclick="exec_meet()" name="menudata" value="update" >面談内容を更新する</button>
            <button id="menudata" class="btn btn-danger" onclick="exec_meet()" name="menudata" value="delete" >面談内容を削除する</button>
            <button class="btn btn-success" onclick="window.print()">印刷する</button>
          </div>
        </div>
      </div>
    </div>

    </form>

    <%
       } else {
    	   // 新規の登録
    %>
    <h2>面談登録</h2>

    <!-- インサート用スクリプト -->
	<form id="fm_meet" action="/admin/MeetController" method="Post">


    <div class="row g-1" >
	  <!-- 社員入力グループ -->
      <div class="card-group border border-secondary-subtle rounded">
        <div class="col">
          <div class="card border border-0">
            <div class="card-body">
              <div class="input-group">
              <label class="input-group-text" for="Affiliation">所属</label>
              <select class="form-select" id="Affiliation" name="Affiliation" onchange="filterData()">
                <option selected value="0">所属...</option>
                <!-- 出来ればDBから持ってくる -->
                <option value="1" onclick="bcbtnClick()">事業推部</option>
                <option value="2" onclick="bcbtnClick()">営業部</option>
                <option value="3" onclick="bcbtnClick()">運用技術部/運用1課</option>
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
            </div>
          </div>
        </div><!-- col -->

        <div class="col">
          <div class="card border border-0" >
            <div class="card-body">
              <div class="input-group">
                <label class="input-group-text" for="Project">プロジェクト</label>
                <select class="form-select" id="Project" name="Project">
                  <option selected>Project...</option>
                  <!-- 出来ればDBから持ってくる -->
                  <option value="1" onclick="bcbtnClick()">Aプロジェクト</option>
                  <option value="2" onclick="bcbtnClick()">Bプロジェクト</option>
                  <option value="3" onclick="bcbtnClick()">C</option>
                  <option value="4">D</option>
                  <option value="5">E</option>
                </select>
              </div>
            </div>
          </div>
        </div><!-- col -->



        <div class="col">
          <div class="card border border-0" >
            <div class="card-body">
              <div class="input-group">
                <label class="input-group-text" for="Name">氏名</label>
                <select class="form-select" id="Name" name="Name">
                  <option selected value="0" data-department="0">Name...</option>
        <%@ page import="com.example.admin.empListData" %>
        <%
          // リクエスト属性からデータを取得する
          empListData[] employeeList = (empListData[]) request.getAttribute("jsonData");
          // データを表示
          for (empListData employee : employeeList) {
        %>
                 <option value="<%= employee.getId() %>" data-department="<%= employee.getDepart() %>"><%= employee.getName() %></option>
        <%
          }
        %>
                </select>
              </div>
            </div>
          </div>
        </div><!-- col -->
      </div><!-- card-group -->

    </div><!-- row -->

<br>
    <div class="row">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">状況・問題</span>
              <textarea class="form-control" aria-label="With textarea" id="situation" name="situation"></textarea>
            </div>
          </div>
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">　所 見　</span>
              <textarea class="form-control" aria-label="With textarea" id="opinion" name="opinion"></textarea>
            </div>
          </div>
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">事業推進部への<br>申し送り</span>
              <textarea class="form-control" aria-label="With textarea" id="transfer" name="transfer"></textarea>
            </div>
          </div>
        </div>
      </div>
    </div><!-- row -->

<br>
    <div class="row row-cols-1 row-cols-md-2 g-4">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">体 調</h5>

            <p class="card-text">睡眠不足、食欲不振、倦怠感がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="bodyCondition1" aria-label="睡眠不足、食欲不振、倦怠感がある">
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition1" id="bodyCondition1_btnr3" value="3" onclick="bcbtnClick()"  autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition1_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">体調が悪い</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="bodyCondition2" aria-label="体調が悪い">
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="bodyCondition2" id="bodyCondition2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition2_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">やる気が出ない</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="bodyCondition3" aria-label="やる気が出ない">
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr1">いつも出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr2">時々出ない</label>
                  <input type="radio" class="btn-check" name="bodyCondition3" id="bodyCondition3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="bodyCondition3_btnr3">ほとんど問題ない</label>
                </div>
              </div>
            </div>

          </div><!-- card-body -->
        </div><!-- card -->
      </div><!-- col -->
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">人間関係</h5>

            <p class="card-text">上司（管理職）に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="Relationship1" aria-label="上司（管理職）に不満がある">
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship1" id="Relationship1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship1_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">先輩、同僚に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="Relationship2" aria-label="先輩、同僚に不満がある">
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="Relationship2" id="Relationship2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship2_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">ﾊﾟﾜﾊﾗ、ｾｸﾊﾗ、嫌がらせ等を受けている</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="Relationship3" aria-label="ﾊﾟﾜﾊﾗ、ｾｸﾊﾗ、嫌がらせ等を受けている">
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="Relationship3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="Relationship3" id="Relationship3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="Relationship3_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">会社制度</h5>

            <p class="card-text">評価、給与に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="companySystems1" aria-label="評価、給与に不満がある">
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems1" id="companySystems1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems1_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">ｷｬﾘｱｱｯﾌﾟ、会社の将来に不安がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="companySystems2" aria-label="ｷｬﾘｱｱｯﾌﾟ、会社の将来に不安がある">
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems2" id="companySystems2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems2_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">会社の制度、雰囲気に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="companySystems3" aria-label="会社の制度、雰囲気に不満がある">
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="companySystems3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="companySystems3" id="companySystems3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="companySystems3_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->

      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">仕事内容</h5>

            <p class="card-text">仕事内容に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="JobDescription1" aria-label="上司（管理職）に不満がある">
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="JobDescription1" id="JobDescription1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription1_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">仕事の成果が芳しくない</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="JobDescription2" aria-label="仕事の成果が芳しくない">
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr1">よくある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription2" id="JobDescription2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription2_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">他の仕事に興味がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="JobDescription3" aria-label="他の仕事に興味がある">
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr1">良くある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr2">時々ある</label>
                  <input type="radio" class="btn-check" name="JobDescription3" id="JobDescription3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="JobDescription3_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->

      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">業務状況</h5>

            <p class="card-text">残業の多さ、休日出勤に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="progress1" aria-label="残業の多さ、休日出勤に不満がある">
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress1" id="progress1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress1_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">仕事量の多さに不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="progress2" aria-label="仕事量の多さに不満がある">
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress2" id="progress2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress2_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">勤務形態に不満がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="progress3" aria-label="勤務形態に不満がある">
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="progress3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="progress3" id="progress3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="progress3_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->


      <div class="col">
        <div class="card" >
          <div class="card-body">
            <h5 class="card-title">私生活</h5>

            <p class="card-text">私生活が充実していない</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="privateLife1" aria-label="私生活が充実していない">
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife1_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife1" id="privateLife1_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife1_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">私生活で問題を抱えている</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="privateLife2" aria-label="私生活で問題を抱えている">
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife2_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife2" id="privateLife2_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife2_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>
            <br>

            <p class="card-text">仕事によって私生活に悪影響がある</p>
            <div class="controls-container" style="--highlight-x-pos: 8px;">
              <div class="controls ready">
                <div class="btn-group w-100 " role="privateLife3" aria-label="仕事によって私生活に悪影響がある">
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr1" value="1" onclick="bcbtnClick()" autocomplete="off" checked>
                  <label class="btn btn-outline-primary" for="privateLife3_btnr1">大いにある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr2" value="2" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr2">ややある</label>
                  <input type="radio" class="btn-check" name="privateLife3" id="privateLife3_btnr3" value="3" onclick="bcbtnClick()" autocomplete="off">
                  <label class="btn btn-outline-primary" for="privateLife3_btnr3">ほとんどない</label>
                </div>
              </div>
            </div>

          </div><!-- card-body -->

        </div><!-- card -->
      </div><!-- col -->

    </div><!-- row -->

<br>
    <div class="row">
    </div><!-- row -->

    <div class="row">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <div class="input-group">
              <span class="input-group-text">チェックリストの分析</span>
              <textarea class="form-control" aria-label="With textarea" id="analysis" name="analysis"></textarea>
            </div>
          </div>
        </div>
      </div>
    </div><!-- row -->


<br>
    <!-- チャート情報 -->
    <div class="row row-cols-1 row-cols-md-2 g-4">
      <div class="col">
        <div class="card" >
          <div class="card-body">
            <div class="graph">
              <canvas id="myRadarChart" width="400" height="400"></canvas>
            </div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card" >
          <div class="card-body">
            <button id="menudata" class="btn btn-primary" onclick="exec_meet()" name="menudata" value="insert">面談内容を保存する</button>
          </div>
        </div>
      </div>
    </div>

    </form>



    <% } %>








<br>
<br>

<!-- 以下注意事項 -->
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        面談実施報告書の作成
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong></strong>・面談は原則として管理職が行う。<br>・面談実施報告は年度ごとに1人作成し、面談ごとに新規作成する。<br>・面談は原則として四半期に1回以上とし、状況に応じて適宜実施する。<br>・派遣、作業請負については原則として毎月面談を実施し、チェックリストの記入については四半期に1回以上とする。<br>・面談後は面談実施報告はサービス内に記録される。<br>・変化や推移を把握するため前年度の面談日と点数も確認すること。
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        状況・問題・所見
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ・業務の状況や問題、チェックリスト以外の内容や詳細な状況報告について、要点をまとめて具体的に記入する。<br>・状況・問題の内容を踏まえて記入する。
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        事業推進部への申し送り
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ・総務部・営業部への展開や面談、フォローを依頼することがあれば具体的に記入する。
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        チェックリスト
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ・数値は高いほど良好である。<br>・チェックリストの結果について過去との比較や変化等について具体的に記入する。
      </div>
    </div>
  </div>
</div>

	</div>
</body>



<script type="text/javascript" src="js/radarChart.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- js読みこみ -->
<script src="js/bootstrap.min.js"></script>

<script>
function filterData() {
    // 選択された所属の値を取得
    var filterValue = document.getElementById("Affiliation").value;

    // オプション要素を取得
    var options = document.getElementById("Name").getElementsByTagName("option");

    // フィルタリングされたオプションの表示/非表示を設定
    for (var i = 0; i < options.length; i++) {
        var option = options[i];
        var department = option.dataset.department; // data-department属性の値を取得

        if (filterValue === "0" || department.includes(filterValue)) {
            option.style.display = ""; // 表示
        } else {
            option.style.display = "none"; // 非表示
        }
    }
}
</script>
<script type="text/javascript">
    function exec_meet() {

	  document.getElementById("fm_meet").submit();
    }
</script>


</html>