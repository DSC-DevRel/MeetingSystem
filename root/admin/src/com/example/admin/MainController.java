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
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String name = null;
	    HttpSession session = request.getSession(false);
	    // name属性が存在しない場合はセッション情報なしとして取り扱う
	    if (session != null && (name = (String) session.getAttribute("name")) == null) {
	      session = null;
	    }

		// 既にセッションが存在する場合は一度破棄する
	    //if (session != null) {
	    //  log("セッション破棄 セッションID=[" + session.getId() + "]");
	    //  session.invalidate();
	    //}

	    // セッション情報がないもしくは期待した状態でなければログイン画面に遷移する
	    if (session == null) {
	    	RequestDispatcher dispatcher =  request.getRequestDispatcher("/login.jsp");
			//フォワードの実行
			dispatcher.forward(request, response);
	    }

	    // ホーム画面に名前を表示する
	    request.setAttribute("name", name);

	    // ホーム画面を表示する
	    RequestDispatcher dispatcher =  request.getRequestDispatcher("/menu.jsp");

		//フォワードの実行
		dispatcher.forward(request, response);
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
		//response.getWriter().append("post1:").append(request.getParameter("name"));
		//response.getWriter().append("<BR />");
		//response.getWriter().append("post2:").append(request.getParameter("pas"));

		//パラメータの取得
		//String name = request.getParameter("namae");
		//String pas = request.getParameter("pas");


		// ログイン名をリクエストから取得する
	    HttpSession session = request.getSession(false);

	    // 既にセッションが存在する場合は一度破棄する
	    if (session != null) {
	      log("セッション破棄 セッションID=[" + session.getId() + "]");
	      session.invalidate();
	    }

	    try {
	      // セッションを新規で作成する
	      session = request.getSession(true);
	      log("セッション作成 セッションID=[" + session.getId() + "]");

	      // ログイン用のパラメータをString[]で取得
		  String[] sqldata = {request.getParameter("name"),request.getParameter("pas")};
		  // SQL発行
		  String result = PostgresConect.loginSelect(sqldata);
		  //PostgresConect.mainInsert(sqldata);

		  if (result != null) {

			if (result.startsWith("org")) {
				RequestDispatcher dispatcher =  request.getRequestDispatcher("/login.jsp");
				request.setAttribute("err", result);
				//フォワードの実行
				dispatcher.forward(request, response);
			} else if (result.startsWith("java")) {
				RequestDispatcher dispatcher =  request.getRequestDispatcher("/login.jsp");
				request.setAttribute("err", result);
				//フォワードの実行
				dispatcher.forward(request, response);
			} else {

				// idをセッションで保持する
				session.setAttribute("id", result);

				String sqlString = request.getParameter("name");
				result = PostgresConect.employeeSelect(sqlString);
				//request.setAttribute("name", result);

				// ログイン名をセッションで保持する
				session.setAttribute("name", result);


				//request.getRequestDispatcher("/menu.jsp").forward(request, response);
				RequestDispatcher dispatcher =  request.getRequestDispatcher("/menu.jsp");
				request.setAttribute("name", result);

				//フォワードの実行
				dispatcher.forward(request, response);
			}

		    } else {
				RequestDispatcher dispatcher =  request.getRequestDispatcher("/login.jsp");
				request.setAttribute("err", result + "ユーザ名またはパスワードに誤りがあります。");
				//フォワードの実行
				dispatcher.forward(request, response);
			}

	    } catch (Exception e) {
	      log("セッション作成 失敗");
	      // 例外によりセッションの作成に失敗
	      e.printStackTrace();
	    }




	}
}

