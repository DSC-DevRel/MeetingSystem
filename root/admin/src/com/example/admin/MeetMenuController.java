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
@WebServlet("/MeetMenuController")
public class MeetMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetMenuController() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession(false);

		String reqCheck = request.getParameter("check");

		String reqId = request.getParameter("ids" + reqCheck);
		String reqName = request.getParameter("names" + reqCheck);
		//reqName = new String(reqName.getBytes("ISO-8859-1"), "UTF-8");


		String[] result = PostgresConect.employeeMeetSelect(reqId);
		int count = result.length; // resultの長さを取得するコード
		String countString = Integer.toString(count); // intをStringに変換



		String[] resID = new String[count];
		String[] resDate = new String[count];

		String tmp = "";
		String[] tmpSplit = new String[2];

		// SQL中身を成形
		for (int i = 0; i < count; i++) {
			tmp = result[i];
			tmpSplit = tmp.split(",");

			resID[i] = tmpSplit[0];
			resDate[i] = tmpSplit[1];

		}

		request.setAttribute("count", Integer.valueOf(countString));
		request.setAttribute("resID", resID);
		request.setAttribute("resDate", resDate);
		request.setAttribute("resName", reqName);

		RequestDispatcher dispatcher =  request.getRequestDispatcher("/meetList.jsp");
		request.setAttribute("name", (String) session.getAttribute("name"));
		//フォワードの実行
		dispatcher.forward(request, response);


	}

}

