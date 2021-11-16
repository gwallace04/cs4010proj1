package edu.umsl.math.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.UnavailableException;

import edu.umsl.math.beans.Problem;

public class ProblemDao {
	private Connection connection;
	private PreparedStatement results;
	private PreparedStatement total;

	public ProblemDao() throws Exception {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mathprobdb", "root", "");
				results = connection.prepareStatement(
						"SELECT pid, content, order_num " + "FROM problem ORDER BY order_num DESC");
				total = connection.prepareStatement(
						"SELECT count(*) row_count FROM problem");
			} catch (Exception exception) {
				exception.printStackTrace();
				throw new UnavailableException(exception.getMessage());
			}
	}
	
	public List<Problem> getProblemList() throws SQLException {
		List<Problem> problist = new ArrayList<Problem>();
		
		try {
			ResultSet resultsRS = results.executeQuery();

			while (resultsRS.next()) {
				Problem prob = new Problem();

				prob.setPid(resultsRS.getInt(1));
				prob.setContent(resultsRS.getString(2));
				prob.setOrder_num(resultsRS.getInt(3));

				problist.add(prob);
			}
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}
		
		return problist;
	}
	
	public int getTotalNumberOfProblems() throws SQLException {
		int count = 0;
		try {
			ResultSet rs = total.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}
		return count;
	}
}
