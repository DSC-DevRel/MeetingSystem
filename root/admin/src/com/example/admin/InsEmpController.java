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
 * Servlet implementation class InsEmpController
 */
@WebServlet("/InsEmpController")
public class InsEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsEmpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//コンテンツタイプの設定
				request.setCharacterEncoding("UTF8");
				response.setContentType("text/html; charset=UTF8");

				//セッション情報取得
				HttpSession session = request.getSession(false);

				// ログイン用のパラメータをString[]で取得

				String dir = "0";
				String getDir = request.getParameter("director");
				if (getDir != null && getDir.equals("on")) {
					dir = "1";
				}

				String[] sqldata = {request.getParameter("emp_id")
						,request.getParameter("name")
						,request.getParameter("kana")
						,dir,request.getParameter("department")
						,(String) session.getAttribute("id")};
				// SQL発行


				// ここにインサートのやつをぶっこむ
				String result = PostgresConect.emInsert(sqldata);
				//PostgresConect.mainInsert(sqldata);

				String getcheck = request.getParameter("admincheck");
				if (getcheck != null && getcheck.equals("on")) {

					String[] sqldata2 = {request.getParameter("emp_id")
							,request.getParameter("pass")
							,(String) session.getAttribute("id")};

					String result2 = PostgresConect.adminInsert(sqldata2);

					if (result2 != null) {
						//ここに落ちた時の処理
					}
				}

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
