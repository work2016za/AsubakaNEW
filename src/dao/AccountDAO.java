package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.Login;
import utils.DBUtility;

public class AccountDAO {

	public Account findByLogin(Login login) {
		Account account = null;

		// MySQLのJDBCドライバをロード
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}

		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(DBUtility.JDBC_URL, DBUtility.DB_USER,
				DBUtility.DB_PASSWORD)) {

			// SELECT文を準備
			String sql = "SELECT NAME, PASS, MAIL, OBJECTIVE, REWARD, DAY, COUNT FROM ACCOUNT WHERE NAME = ? AND PASS = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, login.getName());
			pStmt.setString(2, login.getPass());

			// SELECTを実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();

			// 一致したユーザーが存在した場合
			// そのユーザーを表すAccountインスタンスを生成
			if (rs.next()) {
				// 結果表からデータを取得
				String name = rs.getString("NAME");
				String pass = rs.getString("PASS");
				String mail = rs.getString("MAIL");
				String objective = rs.getString("OBJECTIVE");
				String reward = rs.getString("REWARD");
				int day = rs.getInt("DAY");
				int count = rs.getInt("COUNT");
				account = new Account(name, pass, mail, objective, reward, day, count);
				return account;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		// 見つかったユーザーまたはnullを返す
		return null;
	}

	public List<String> getDataForDates(String userName) {
	    List<String> datesData = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        return datesData;
	    }

	    try (Connection conn = DriverManager.getConnection(DBUtility.JDBC_URL, DBUtility.DB_USER, DBUtility.DB_PASSWORD)) {
	        String sql = "SELECT DATE1, DATE2, DATE3, DATE4, DATE5, DATE6, DATE7, DATE8, DATE9, DATE10, " +
	                "DATE11, DATE12, DATE13, DATE14, DATE15, DATE16, DATE17, DATE18, DATE19, DATE20, " +
	                "DATE21, DATE22, DATE23, DATE24, DATE25, DATE26, DATE27, DATE28, DATE29, DATE30, " +
	                "DATE31, DATE32, DATE33, DATE34, DATE35, DATE36, DATE37, DATE38, DATE39, DATE40, " +
	                "DATE41, DATE42, DATE43, DATE44, DATE45, DATE46, DATE47, DATE48, DATE49, DATE50, " +
	                "DATE51, DATE52, DATE53, DATE54, DATE55, DATE56, DATE57, DATE58, DATE59, DATE60, " +
	                "DATE61, DATE62, DATE63, DATE64, DATE65, DATE66 FROM ACCOUNT WHERE NAME = ?";
	        PreparedStatement pStmt = conn.prepareStatement(sql);
	        pStmt.setString(1, userName);

	        ResultSet rs = pStmt.executeQuery();

	        if (rs.next()) {
	            // 日付列をループして、NULL値を処理します
	            for (int i = 1; i <= 66; i++) {
	                String date = rs.getString("DATE" + i);
	                if (date == null) {
	                    // NULL値を処理する（例: 空の文字列に置き換える）
	                    date = "NULL";
	                }
	                datesData.add(date);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return datesData;
	}

	public String getDatesAsJavaScriptArray(String userName) {
		List<String> datesData = getDataForDates(userName);

		// JavaScriptの配列形式に変換する
		StringBuilder jsArray = new StringBuilder();
		jsArray.append("const datesArray = [");

		for (int i = 0; i < datesData.size(); i++) {
			if (i != 0) {
				jsArray.append(",");
			}
			jsArray.append("'" + datesData.get(i) + "'");
		}

		jsArray.append("];");

		return jsArray.toString();
	}
}
