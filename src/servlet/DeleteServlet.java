package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBUtility;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");

        // データベース接続の変数を定義
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // データベース接続を確立します
            connection = DriverManager.getConnection(DBUtility.JDBC_URL, DBUtility.DB_USER, DBUtility.DB_PASSWORD);
            System.out.println("データベース接続が正常に確立されました。");

            // アカウントを削除するSQLクエリを定義します
            String deleteQuery = "DELETE FROM account WHERE name = ?"; // 'your_table_name'を実際のテーブル名に置き換えてください

            // プリペアドステートメントを作成します
            preparedStatement = connection.prepareStatement(deleteQuery);

            // ユーザー名のパラメータを設定します
            preparedStatement.setString(1, username);

            // アカウントを削除するSQLクエリを実行します
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // アカウントが正常に削除された場合
                response.sendRedirect("index.jsp");
            } else {
                // アカウントが見つからないか、削除に失敗した場合
                // 必要に応じてこの場合を処理できます。たとえば、エラーメッセージを設定してエラーページにリダイレクトするなど
                response.sendRedirect("Error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("データベース接続エラー: " + e.getMessage());

            // エラーメッセージを設定してエラーページにリダイレクトします
            request.setAttribute("errorMessage", "データベース接続エラー: " + e.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
 finally {
            // finallyブロック内でデータベースリソースを閉じます
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // 必要に応じて例外を処理します
            }
        }
    }
}
