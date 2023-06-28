package com.stepdefinition;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.pages.Baseclass;

public class Sample extends Baseclass {
	public static void main(String[] args) {
	
	

//	public void booking() {
//		getDriver("Chrome");
//		maximizeWindow();
//		loadUrl("https://adactinhotelapp.com/");



		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "hr";
		String password = "vikravan";
		Connection connection = null;
	

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			try {
				connection = DriverManager.getConnection(url, username, password);

				String sql = "select * from SQLADACTIN where TESTCASE_NO='TC_1'";

				PreparedStatement ps = connection.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {

					String testCaseNo = rs.getString("TESTCASE_NO");
					String user = rs.getString("USERNAME");
					String pass = rs.getString("PASSWORD");
					Date date = rs.getDate("CHECK_IN_DATE");

					SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
					String doj = dateFormat.format(date);
					System.out.println(testCaseNo);
					System.out.println(user);
					System.out.println(pass);
					System.out.println(doj);

				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		finally {

			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		WebElement txtUser = driver.findElement(By.id("username"));
		txtUser.sendKeys("nithsh123");
		WebElement txtPass = driver.findElement(By.id("password"));
		txtPass.sendKeys("fdss");
		WebElement btnLogin = driver.findElement(By.id("login"));
		btnLogin.click();

	}


	}


