package com.pages;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.Properties;

import org.checkerframework.common.reflection.qual.ForName;
import org.openqa.selenium.Alert;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;


import io.github.bonigarcia.wdm.WebDriverManager;

public class Baseclass {

	public static WebDriver driver;

	public void getDriver(String browserType) {

		switch (browserType) {
		case "Chrome":
			WebDriverManager.chromedriver().setup();
			driver = new ChromeDriver();

			break;

		case "Firefox":
			WebDriverManager.firefoxdriver().setup();
			driver = new FirefoxDriver();

			break;

		case "Io":
			WebDriverManager.iedriver().setup();
			driver = new InternetExplorerDriver();
			break;

		case "Edge":
			WebDriverManager.edgedriver().setup();
			driver = new EdgeDriver();
			break;

		default:
			break;
		}

	}

	public void maximizeWindow() {

		driver.manage().window().maximize();

	}

	public void loadUrl(String url) {

		driver.get(url);

	}

	public byte[] screenshot() {

		TakesScreenshot screenshot = (TakesScreenshot) driver;

		byte[] screenshotAs = screenshot.getScreenshotAs(OutputType.BYTES);
		return screenshotAs;

	}

	public void quitWindow() {

		driver.quit();

	}

	public void insertValue(WebElement element, String data) {

		elementVisiblity(element);
		element.clear();
		element.sendKeys(data);

	}

	public void click(WebElement element) {
		elementVisiblity(element);
		element.click();

	}

	public void implicitWaits(long seconds) {

		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(seconds));

	}

	public void selectOptionByText(WebElement element, String text) {

		Select s = new Select(element);
		s.selectByVisibleText(text);

	}

	public String elementGetAttribute(WebElement element, String data) {

		String attribute = element.getAttribute("value");
		return attribute;

	}

	public Alert alert() {

		Alert alert = driver.switchTo().alert();
		return alert;

	}

	public String getProjectValue() {

		String property = System.getProperty("user.dir");
		return property;

	}

	public String getPropertieFileValue(String key) throws FileNotFoundException, IOException {

		Properties properties = new Properties();
		properties.load(new FileInputStream(getProjectValue() + "\\Confiq\\confiq.properties"));
		Object object = properties.get(key);
		String string = (String) object;
		return (String) properties.get(key);

	}

	/**
	 * 
	 * @see user should to maintain the elementVisiblity implement parts
	 * @param element
	 * 
	 */

	public void elementVisiblity(WebElement element) {

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOf(element));

	}

	public String elementGetText(WebElement element) {

		String text = element.getText();
		return text.trim();

	}

	public void quit() {

		driver.quit();

	}

	public  Employee getDatabaseValue() {

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "hr";
		String password = "vikravan";
		Connection connection = null;
		Employee employee = null;

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
					Date date = rs.getDate("DOJ");

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
		return employee;

	}
}
