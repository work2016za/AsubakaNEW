package test;

import dao.AccountDAO;
import model.Account;
import model.Login;

public class AccountDAOTest {
  public static void main(String[] args) {
    testFindByLogin1(); // ユーザーが見つかる場合のテスト
    testFindByLogin2(); // ユーザーが見つからない場合のテスト
    }

  public static void testFindByLogin1() {
	    Login login = new Login("せり", "Admin123");
	    AccountDAO dao = new AccountDAO();
	    Account result = dao.findByLogin(login);
	    if (result != null &&
	            result.getName().equals("せり") &&
	            result.getPass().equals("Admin123") &&
	            result.getMail().equals("seri@au.com") &&
	            result.getObjective().equals("走る") &&
	            result.getReward().equals("バナナ")) {
	      System.out.println("findByLogin1:成功しました");
	    } else {
	      System.out.println("findByLogin1:失敗しました");
	    }
	  }

  public static void testFindByLogin2() {
    Login login = new Login("おの", "Asubaka1z23");
    AccountDAO dao = new AccountDAO();
    Account result = dao.findByLogin(login);
    if (result == null) {
      System.out.println("findByLogin2:成功しました");
    } else {
      System.out.println("findByLogin2:失敗しました");
    }
  }
}