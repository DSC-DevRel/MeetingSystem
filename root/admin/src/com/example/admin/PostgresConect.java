package com.example.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PostgresConect {
	public static void mainSelect(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列 DB接続用のメソッドを作りたい
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";

        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
            String sql = "SELECT count(id) FROM tbl_userid WHERE id = ''";
            rset = stmt.executeQuery(sql);

            //SELECT結果の受け取り
            while(rset.next()){
                String col = rset.getString(1);
                System.out.println(col);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }
    }


	public static void mainInsert(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";

        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            stmt = conn.createStatement();
            String sql = "INSERT INTO tbl_menu VALUES ( 2, '照会', 0, 0)";
            stmt.executeUpdate(sql);
            conn.commit();

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }
    }

	/* 社員情報登録
	 *
	 */
	public static String emInsert(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;
        String rString = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";

        try{
            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

          //SELECT文の実行
            String id =  args[0];
            String name =  args[1];
            String kana =  args[2];
            String dir       =  args[3];
            String depa      =  args[4];
            String login_id =  args[5];


            //SELECT文の実行
            stmt = conn.createStatement();
            String sql = "INSERT INTO tbl_employee (employee_id, name, kananame, director, department,create_date,create_id,update_date,update_id)"
            		   + " VALUES ( "
            		   + "'" + id + "', '"
            		   + name + "', '"
            		   + kana + "', "
            		   + dir + ", "
            		   + depa + ", "
                       + "to_char(current_timestamp, 'YYYYMMDD'), '"
            		   + login_id + "', "
                       + "to_char(current_timestamp, 'YYYYMMDD'), '"
                       + login_id + "' "
            		   + ")";
            stmt.executeUpdate(sql);
            conn.commit();

            //成功したら変数にOK入れる
            rString="OK";

        }
        catch (SQLException e){
        	rString="NG";
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }
        return rString;
    }

	/* 社員情報登録
	 *
	 */
	public static String adminInsert(String[] args) {
       Connection conn = null;
       Statement stmt = null;
       ResultSet rset = null;
       String rString = null;

       try {
       	Class.forName("org.postgresql.Driver");
       } catch(Exception e) {

       }

       //接続文字列
       String url = "jdbc:postgresql://localhost:5432/db-consultation";
       String user = "";
       String password = "";

       try{
           //PostgreSQLへ接続
           conn = DriverManager.getConnection(url, user, password);

           //自動コミットOFF
           conn.setAutoCommit(false);

         //SELECT文の実行
           String id =  args[0];
           String pass = args[1];
           String login_id =  args[2];

           //SELECT文の実行
           stmt = conn.createStatement();
           String sql = "INSERT INTO tbl_userid (id, employee_id, authority, create_date, create_id, update_date, update_id, del_flg)"
           		   + " VALUES ( "
        		   + "(SELECT (MAX(id)::integer + 1) FROM tbl_userid)::text ,"
           		   + "'" + id + "', "
           		   + "0, "
                   + "to_char(current_timestamp, 'YYYYMMDD'), '"
           		   + login_id + "', "
                   + "to_char(current_timestamp, 'YYYYMMDD'), '"
                   + login_id + "', 0"
           		   + ")";
           stmt.executeUpdate(sql);

           String sql2 = "INSERT INTO tbl_pass (employee_id, pass, create_date, create_id, update_date, update_id, del_flg)"
           		   + " VALUES ( "
           		   + "'" + id + "', "
           		   + "pgp_sym_encrypt('" + pass + "', 'dsc_pass'), "
                      + "to_char(current_timestamp, 'YYYYMMDD'), '"
           		   + login_id + "', "
                   + "to_char(current_timestamp, 'YYYYMMDD'), '"
                   + login_id + "', 0"
           		   + ")";
           stmt.executeUpdate(sql2);

           conn.commit();

           //成功したら変数にOK入れる
           rString="OK";

       }
       catch (SQLException e){
       	rString="NG";
       }
       finally {
           try {
               if(rset != null)rset.close();
               if(stmt != null)stmt.close();
               if(conn != null)conn.close();
           }
           catch (SQLException e){
               e.printStackTrace();
           }

       }
       return rString;
   }

	/* 面談情報登録
	 *
	 */
	public static String meetInsert(String[] args) {

       Connection conn = null;
       Statement stmt = null;
       ResultSet rset = null;
       String rString = null;

       try {
       	Class.forName("org.postgresql.Driver");
       } catch(Exception e) {

       }

       //接続文字列
       String url = "jdbc:postgresql://localhost:5432/db-consultation";
       String user = "";
       String password = "";

       try{

           //PostgreSQLへ接続
           conn = DriverManager.getConnection(url, user, password);

           //自動コミットOFF
           conn.setAutoCommit(false);

         //SELECT文の実行
           //String Affiliation =  args[0];
           String emp_id =  args[1];
           String situation =  args[2];
           String opinion =  args[3];
           String transfer =  args[4];
           String analysis =  args[5];
           String bodyCondition =  args[6];
           String Relationship =  args[7];
           String companySystems =  args[8];
           String JobDescription =  args[9];
           String progress =  args[10];
           String privateLife =  args[11];
           String entry = args[12];

           //SELECT文の実行
           stmt = conn.createStatement();
           String sql = "INSERT INTO tbl_meet_data (employee_id, meet_date, situation, opinion, transfer, analysis, check_1, check_2, check_3, check_4, check_5, check_6, create_date, update_date, entry)"
           		   + " VALUES ( "
           		   + "'" + emp_id + "',"
           		   + "to_char(current_timestamp, 'YYYYMMDD'), '"
           		   + situation + "', '"
           		   + opinion + "', '"
           		   + transfer + "', '"
           		   + analysis + "', '"
           		   + bodyCondition + "', '"
           		   + Relationship +  "', '"
           		   + companySystems +  "', '"
           		   + JobDescription +  "', '"
           		   + progress + "', '"
           		   + privateLife +  "', "
           		   + "to_char(current_timestamp, 'YYYYMMDD'), "
           		   + "to_char(current_timestamp, 'YYYYMMDD'), '"
           		   + entry
           		   + "')";
           stmt.executeUpdate(sql);
           conn.commit();

           //成功したら変数にOK入れる
           rString="OK";

       }
       catch (SQLException e){
       	rString="NG";
       }
       finally {
           try {
               if(rset != null)rset.close();
               if(stmt != null)stmt.close();
               if(conn != null)conn.close();
           }
           catch (SQLException e){
               e.printStackTrace();
           }

       }
       return rString;
   }

	/* 面談情報更新
	 *
	 */
	public static String meetUpdate(String[] args) {

      Connection conn = null;
      Statement stmt = null;
      ResultSet rset = null;
      String rString = null;

      try {
      	Class.forName("org.postgresql.Driver");
      } catch(Exception e) {

      }

      //接続文字列
      String url = "jdbc:postgresql://localhost:5432/db-consultation";
      String user = "";
      String password = "";

      try{

          //PostgreSQLへ接続
          conn = DriverManager.getConnection(url, user, password);

          //自動コミットOFF
          conn.setAutoCommit(false);

        //SELECT文の実行
          //String Affiliation =  args[0];
          String emp_id =  args[1];
          String situation =  args[2];
          String opinion =  args[3];
          String transfer =  args[4];
          String analysis =  args[5];
          String bodyCondition =  args[6];
          String Relationship =  args[7];
          String companySystems =  args[8];
          String JobDescription =  args[9];
          String progress =  args[10];
          String privateLife =  args[11];
          String entry = args[12];
          String meetDate = args[13];

          //SELECT文の実行
          stmt = conn.createStatement();
          String sql = "UPDATE tbl_meet_data "
          		   + " SET "
          		   + "  situation = '" + situation + "' "
          		   + ", opinion   = '" + opinion + "' "
          		   + ", transfer  = '" + transfer + "' "
          		   + ", analysis  = '" + analysis + "' "
          		   + ", check_1   = '" + bodyCondition + "' "
          		   + ", check_2   = '" + Relationship +  "' "
          		   + ", check_3   = '" + companySystems +  "' "
          		   + ", check_4   = '" + JobDescription +  "' "
          		   + ", check_5   = '" + progress + "' "
          		   + ", check_6   = '" + privateLife +  "' "
          		   + ", update_date = to_char(current_timestamp, 'YYYYMMDD') "
          		   + ", entry     = '" + entry +  "' "
          		   + " WHERE employee_id = '" + emp_id + "' "
          		   + "   AND meet_date   = '" + meetDate + "'";
          stmt.executeUpdate(sql);
          conn.commit();

          //成功したら変数にOK入れる
          rString="OK";

      }
      catch (SQLException e){
      	rString="NG";
      }
      finally {
          try {
              if(rset != null)rset.close();
              if(stmt != null)stmt.close();
              if(conn != null)conn.close();
          }
          catch (SQLException e){
              e.printStackTrace();
          }

      }
      return rString;
  }

	/* 面談情報削除
	 *
	 */
	public static String meetDelete(String[] args) {

     Connection conn = null;
     Statement stmt = null;
     ResultSet rset = null;
     String rString = null;

     try {
     	Class.forName("org.postgresql.Driver");
     } catch(Exception e) {

     }

     //接続文字列
     String url = "jdbc:postgresql://localhost:5432/db-consultation";
     String user = "";
     String password = "";

     try{

         //PostgreSQLへ接続
         conn = DriverManager.getConnection(url, user, password);

         //自動コミットOFF
         conn.setAutoCommit(false);

       //SELECT文の実行
         //String Affiliation =  args[0];
         String emp_id =  args[1];
         String meetDate = args[2];

         //SELECT文の実行
         stmt = conn.createStatement();
         String sql = "DELETE FROM tbl_meet_data "
         		   + " WHERE employee_id = '" + emp_id + "' "
         		   + "   AND meet_date   = '" + meetDate + "'";
         stmt.executeUpdate(sql);
         conn.commit();

         //成功したら変数にOK入れる
         rString="OK";

     }
     catch (SQLException e){
     	rString="NG";
     }
     finally {
         try {
             if(rset != null)rset.close();
             if(stmt != null)stmt.close();
             if(conn != null)conn.close();
         }
         catch (SQLException e){
             e.printStackTrace();
         }

     }
     return rString;
 }


	/*
	 * ログイン用
	 */
	public static String loginSelect(String[] args) {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";
        String rString = null;

        try{
        	//forName("org.postgresql.Driver");
        	rString="DB接続はできてない";

            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);
            rString="DB接続はできた";
            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            String loginID =  args[0];
            String loginPass =  args[1];
            stmt = conn.createStatement();
            String sql = "SELECT tid.employee_id "
            		  +  "  FROM tbl_userid AS tid "
            		  +  "     , (SELECT tbl_pass.employee_id, pgp_sym_decrypt(tbl_pass.pass, 'dsc_pass') AS pass FROM tbl_pass) AS tpass"
            		  +  " WHERE tid.employee_id = tpass.employee_id"
            		  +  "   AND tid.employee_id = '" + loginID + "'"
            		  +  "   AND tpass.pass = '" + loginPass + "'";

            rset = stmt.executeQuery(sql);
            rString = null;

            //SELECT結果の受け取り
            while(rset.next()){
                rString = rset.getString("employee_id");
                System.out.println(rString);
            }

        }
        catch (SQLException e){
        	rString=e.toString();
            //e.printStackTrace();
        }

        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
            	rString=e.toString();
                //e.printStackTrace();
            }
        }
        return rString;
		//return rString;

	}

	/*
	 * ログイン社員情報取得
	 */
	public static String employeeSelect(String args) {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";
        String rString = null;

        try{
        	//forName("org.postgresql.Driver");

            //PostgreSQLへ接続
            conn = DriverManager.getConnection(url, user, password);

            //自動コミットOFF
            conn.setAutoCommit(false);

            //SELECT文の実行
            String id =  args;
            stmt = conn.createStatement();
            String sql = "SELECT tbl_employee.* FROM tbl_employee, tbl_userid "
            		    + "WHERE tbl_userid.employee_id = tbl_employee.employee_id "
            		    + "  AND tbl_userid.employee_id = '"
            		+ id + "'";

            rset = stmt.executeQuery(sql);

            //SELECT結果の受け取り
            while(rset.next()){
                rString = rset.getString("name");
                System.out.println(rString);
            }

            //INSERT文の実行
            //sql = "INSERT INTO jdbc_test VALUES (1, 'AAA')";
            //stmt.executeUpdate(sql);
            //conn.commit();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }

		return rString;

	}


	/*
	 * 社員情報一覧取得
	 */
	public static String[] employeeListSelect(String args) {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;
        String[] rString = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";


        try{

        	Connection connection = DriverManager.getConnection(url, user, password);

        	String sql = "SELECT * FROM tbl_employee";
        	Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        	ResultSet resultSet = statement.executeQuery(sql);

        	// レコードの数を数える
        	int rowCount = 0;
        	while (resultSet.next()) {
        	    rowCount++;
        	}

        	// 結果セットを初期化
        	resultSet.beforeFirst();

        	rString = new String[rowCount]; // 配列を初期化

        	int index = 0;
        	while (resultSet.next()) {
        		String emp_id = resultSet.getString("employee_id");
        	    String name = resultSet.getString("name");
        	    String kananame = resultSet.getString("kananame");
        	    String department = resultSet.getString("department");
        	    rString[index] = emp_id + "," + name + "," + kananame + "," + department ;
        	    index++;
        	}

            connection.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }

		return rString;
	}

	/*
	 * 社員ミーティング情報取得
	 */
	public static String[] employeeMeetSelect(String args) {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;
        String[] rString = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";

        try{
            //PostgreSQLへ接続
        	Connection connection = DriverManager.getConnection(url, user, password);

        	//自動コミットOFF
        	connection.setAutoCommit(false);

            //SELECT文の実行
            String id =  args;


            String sql = "SELECT * FROM tbl_meet_data "
                        + " WHERE employee_id = '"
                        + id + "'";

            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        	ResultSet resultSet = statement.executeQuery(sql);

         // レコードの数を数える
        	int rowCount = 0;
        	while (resultSet.next()) {
        	    rowCount++;
        	}

        	// 結果セットを初期化
        	resultSet.beforeFirst();

        	rString = new String[rowCount]; // 配列を初期化

        	int index = 0;
        	while (resultSet.next()) {
        		String emp_id = resultSet.getString("employee_id");
        		String meet_date = resultSet.getString("meet_date");
        	    rString[index] = emp_id + "," + meet_date ;
        	    index++;
        	}

            connection.close();

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }

		return rString;

	}
	/*
	 * 社員ミーティング情報取得
	 */
	public static String[] employeeMeetDateSelect(String[] args) {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;
        String[] rString = null;

        try {
        	Class.forName("org.postgresql.Driver");
        } catch(Exception e) {

        }

        //接続文字列
        String url = "jdbc:postgresql://localhost:5432/db-consultation";
        String user = "";
        String password = "";

        try{
            //PostgreSQLへ接続
        	Connection connection = DriverManager.getConnection(url, user, password);

        	//自動コミットOFF
        	connection.setAutoCommit(false);

            //SELECT文の実行
            String id =  args[0];
            String date =  args[1];


            String sql = "SELECT * FROM tbl_meet_data "
                        + " WHERE employee_id = '"
                        + id + "'"
                        + "   AND meet_date = '"
                        + date + "'";

            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        	ResultSet resultSet = statement.executeQuery(sql);

         // レコードの数を数える
        	int rowCount = 0;
        	while (resultSet.next()) {
        	    rowCount++;
        	}

        	// 結果セットを初期化
        	resultSet.beforeFirst();

        	rString = new String[rowCount]; // 配列を初期化

        	int index = 0;
        	while (resultSet.next()) {
        		String emp_id = resultSet.getString("employee_id");
        		String meet_date = resultSet.getString("meet_date");
        		String situation = resultSet.getString("situation");
        		String opinion = resultSet.getString("opinion");
        		String transfer = resultSet.getString("transfer");
        		String analysis = resultSet.getString("analysis");
        		String check_1 = resultSet.getString("check_1");
        		String check_2 = resultSet.getString("check_2");
        		String check_3 = resultSet.getString("check_3");
        		String check_4 = resultSet.getString("check_4");
        		String check_5 = resultSet.getString("check_5");
        		String check_6 = resultSet.getString("check_6");

        	    rString[index] = emp_id
        	    		+ "," + meet_date
        	    		+ "," + situation
        	    		+ "," + opinion
        	    		+ "," + transfer
        	    		+ "," + analysis
        	    		+ "," + check_1
        	    		+ "," + check_2
        	    		+ "," + check_3
        	    		+ "," + check_4
        	    		+ "," + check_5
        	    		+ "," + check_6;
        	    index++;
        	}

            connection.close();

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                if(rset != null)rset.close();
                if(stmt != null)stmt.close();
                if(conn != null)conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
            }

        }

		return rString;

	}
}
