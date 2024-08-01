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
@WebServlet("/MeetController")
public class MeetController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetController() {
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
		HttpSession session = request.getSession(false);


		try {

			// ログイン用のパラメータをString[]で取得
			//Map<String, String[]> paramMap = request.getParameterMap();
			//for (String paramName : paramMap.keySet()) {
			//    String[] paramValues = paramMap.get(paramName);
			//    for (String paramValue : paramValues) {
			//        System.out.println(paramName + ": " + paramValue);
			//    }
		    //}

			String menuData = request.getParameter("menudata");
			String meetDate = request.getParameter("meetdate");
			String Affiliation = request.getParameter("Affiliation");
			String emp_id = request.getParameter("Name");
			String situation = request.getParameter("situation");
			String opinion = request.getParameter("opinion");
			String transfer = request.getParameter("transfer");
			String analysis = request.getParameter("analysis");

			String bodyCondition = request.getParameter("bodyCondition1") + "," + request.getParameter("bodyCondition2") + "," + request.getParameter("bodyCondition3");
			String Relationship = request.getParameter("Relationship1") + "," + request.getParameter("Relationship2") + "," + request.getParameter("Relationship3");
			String companySystems = request.getParameter("companySystems1") + "," + request.getParameter("companySystems2") + "," + request.getParameter("companySystems3");
			String JobDescription = request.getParameter("JobDescription1") + "," + request.getParameter("JobDescription2") + "," + request.getParameter("JobDescription3");
			String progress = request.getParameter("progress1") + "," + request.getParameter("progress2") + "," + request.getParameter("progress3");
			String privateLife = request.getParameter("privateLife1") + "," + request.getParameter("privateLife2") + "," + request.getParameter("privateLife3");
			String entry = (String) session.getAttribute("id");

			if ( menuData.equals("insert") ) {



				// 所属チェックいらないかも
				//if (Affiliation.equals("0")) {
				//	RequestDispatcher dispatcher =  request.getRequestDispatcher("/meet.jsp");
				//	request.setAttribute("name", (String) session.getAttribute("name"));
				//	request.setAttribute("err", "所属部が選択されていません。");
				//	//フォワードの実行
				//	dispatcher.forward(request, response);
				//	return;
				//}

				// SQLData作成
				String[] sqldata = {Affiliation,emp_id,situation,opinion,transfer,analysis,bodyCondition,Relationship,companySystems,JobDescription,progress,privateLife,entry};

				// SQL発行
				// ここにインサートのやつをぶっこむ
				String result = PostgresConect.meetInsert(sqldata);
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

			} else if (menuData.equals("update")) {

				// SQLData作成
				String[] sqldata = {Affiliation,emp_id,situation,opinion,transfer,analysis,bodyCondition,Relationship,companySystems,JobDescription,progress,privateLife,entry,meetDate};

				// SQL発行
				// ここにインサートのやつをぶっこむ
				String result = PostgresConect.meetUpdate(sqldata);
				//PostgresConect.mainInsert(sqldata);

				if (result != null) {

					result = PostgresConect.employeeSelect(emp_id);
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

			} else if (menuData.equals("delete")) {
				// SQLData作成
				String[] sqldata = {Affiliation,emp_id,meetDate};

				// SQL発行
				// ここにインサートのやつをぶっこむ
				String result = PostgresConect.meetDelete(sqldata);
				//PostgresConect.mainInsert(sqldata);

				if (result != null) {

					result = PostgresConect.employeeSelect(emp_id);
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

		} catch (Exception e) {

		}
	}

}
