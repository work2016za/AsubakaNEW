package model;


public class Account {
	private String name;
	private String pass;
	private String mail;
	private String objective;
	private String reward;
	private int day;
	private int count;

	public Account(String name, String pass, String mail,
			String objective, String reward, int day, int count) {
		this.name = name;
		this.pass = pass;
		this.mail = mail;
		this.objective = objective;
		this.reward = reward;
		this.day = day;
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public String getPass() {
		return pass;
	}

	public String getMail() {
		return mail;
	}

	public String getObjective() {
		return objective;
	}

	public String getReward() {
		return reward;
	}

	public void setReward(String reward) {
		this.reward = reward;
	}

	public int getDay() {
		return day;
	}

	public int getCount() {
		return count;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public void setCount(int count) {
		this.count = count;
	}

}