package com.example.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class InsertController
 */
@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("Hello World");
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

		// ログイン用のパラメータをString[]で取得
		String[] sqldata = {request.getParameter("name"),request.getParameter("kananame"),request.getParameter("director"),request.getParameter("department")};
		// SQL発行


		// ここにインサートのやつをぶっこむ
		String result = PostgresConect.emInsert(sqldata);
		//PostgresConect.mainInsert(sqldata);

		if (result != null) {

			String sqlString = request.getParameter("name");
			result = PostgresConect.employeeSelect(sqlString);
			request.setAttribute("name", result);

			RequestDispatcher dispatcher =  request.getRequestDispatcher("/menu.jsp");

			//フォワードの実行
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher =  request.getRequestDispatcher("/login.jsp");
			request.setAttribute("err", "ユーザ名またはパスワードに誤りがあります。");
			//フォワードの実行
			dispatcher.forward(request, response);
		}

	}
}

