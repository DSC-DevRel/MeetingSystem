package com.example.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MenuController
 */
@WebServlet("/MenuController")
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//コンテンツタイプの設定
		request.setCharacterEncoding("UTF8");
		response.setContentType("text/html; charset=UTF8");

		HttpSession session = request.getSession(false);

		 // メニュー画面に戻る
		if ( "menu".equals(request.getParameter("name")) ) {

			RequestDispatcher dispatcher =  request.getRequestDispatcher("/menu.jsp");
			request.setAttribute("name", (String) session.getAttribute("name"));

			//フォワードの実行
			dispatcher.forward(request, response);


		  // 新規のミーティング画面
		} else if ( "meet".equals(request.getParameter("name"))) {

			empListData[] jsonData = empListData.empJson();
			request.setAttribute("jsonData", jsonData);

			RequestDispatcher dispatcher =  request.getRequestDispatcher("/meet.jsp");
			request.setAttribute("name", (String) session.getAttribute("name"));
			//フォワードの実行
			dispatcher.forward(request, response);



          //患者情報の
		} else if ( "shokai".equals(request.getParameter("name"))) {

			String[] result = PostgresConect.employeeListSelect("0");

			int count = result.length; // resultの長さを取得するコード
			String countString = Integer.toString(count); // intをStringに変換

			request.setAttribute("count", Integer.valueOf(countString));

			String[] resID = new String[count];
			String[] resName = new String[count];
			String[] resKananame = new String[count];

			String tmp = "";
			String[] tmpSplit = new String[3];

			// SQL中身を成形
			for (int i = 0; i < count; i++) {
				tmp = result[i];
				tmpSplit = tmp.split(",");

				resID[i] = tmpSplit[0];
				resName[i] = tmpSplit[1];
				resKananame[i] = tmpSplit[2];

			}
			request.setAttribute("resID", resID);
			request.setAttribute("resName", resName);
			request.setAttribute("resKananame", resKananame);
			RequestDispatcher dispatcher =  request.getRequestDispatcher("/inquiry.jsp");
			request.setAttribute("name", (String) session.getAttribute("name"));
			//フォワードの実行
			dispatcher.forward(request, response);




		} else if ( "insert".equals(request.getParameter("name"))) {

			String[] result = PostgresConect.employeeListSelect("0");

			int count = result.length; // resultの長さを取得するコード
			String countString = Integer.toString(count); // intをStringに変換

			request.setAttribute("count", Integer.valueOf(countString));

			String[] resID = new String[count];
			String[] resName = new String[count];
			String[] resKananame = new String[count];

			String tmp = "";
			String[] tmpSplit = new String[3];

			// SQL中身を成形
			for (int i = 0; i < count; i++) {
				tmp = result[i];
				tmpSplit = tmp.split(",");

				resID[i] = tmpSplit[0];
				resName[i] = tmpSplit[1];
				resKananame[i] = tmpSplit[2];

			}
			request.setAttribute("resID", resID);
			request.setAttribute("resName", resName);
			request.setAttribute("resKananame", resKananame);
			RequestDispatcher dispatcher =  request.getRequestDispatcher("/insert.jsp");
			request.setAttribute("name", (String) session.getAttribute("name"));
			//フォワードの実行
			dispatcher.forward(request, response);
		} else if ( "setting".equals(request.getParameter("name"))) {

			RequestDispatcher dispatcher =  request.getRequestDispatcher("/Setting.jsp");
			request.setAttribute("name", (String) session.getAttribute("name"));
			//フォワードの実行
			dispatcher.forward(request, response);

		} else if ( "backup".equals(request.getParameter("name"))) {

			RequestDispatcher dispatcher =  request.getRequestDispatcher("/backup.jsp");
			request.setAttribute("name", (String) session.getAttribute("name"));

			//フォワードの実行
			dispatcher.forward(request, response);

		}

	}

}

