package com.voidmain.dao;

import java.util.List;

import com.voidmain.pojo.Article;
import com.voidmain.pojo.Mentor;
import com.voidmain.pojo.Query;
import com.voidmain.pojo.StartupRequest;
import com.voidmain.pojo.User;

public class HibernateDAO {

	public static boolean isValidUser(String username,String password)
	{
		User user=getUserById(username);

		if(user!=null)
		{
			return true;
		}

		return false;
	}

	public static boolean isValidMentor(String username,String password)
	{
		Mentor mentor=getMentorById(username);

		if(mentor!=null && mentor.getPassword().equals(password) && mentor.getStatus().equals("yes"))
		{
			return true;
		}

		return false;
	}

	//============================================================================

	public static User getUserById(String id)
	{
		return (User)HibernateTemplate.getObject(User.class,id);
	}

	public static int deleteUser(int id)
	{
		return HibernateTemplate.deleteObject(User.class,id);
	}

	public static List<User> getUsers()
	{
		List<User> users=(List)HibernateTemplate.getObjectListByQuery("From User");

		return users;
	}

	//=========================================================================

	public static Mentor getMentorById(String id)
	{
		return (Mentor)HibernateTemplate.getObject(Mentor.class,id);
	}

	public static int deleteMentor(int id)
	{
		return HibernateTemplate.deleteObject(Mentor.class,id);
	}

	public static List<Mentor> getMentors()
	{
		List<Mentor> mentors=(List)HibernateTemplate.getObjectListByQuery("From Mentor");

		return mentors;
	}

	//=========================================================================

	public static Article getArticleById(int id)
	{
		return (Article)HibernateTemplate.getObject(Article.class,id);
	}

	public static int deleteArticle(int id)
	{
		return HibernateTemplate.deleteObject(Article.class,id);
	}

	public static List<Article> getArticles()
	{
		List<Article> articles=(List)HibernateTemplate.getObjectListByQuery("From Article");

		return articles;
	}

	//=========================================================================

	public static Query getQueryById(int id)
	{
		return (Query)HibernateTemplate.getObject(Query.class,id);
	}

	public static int deleteQuery(int id)
	{
		return HibernateTemplate.deleteObject(Query.class,id);
	}

	public static List<Query> getQuerys()
	{
		List<Query> queries=(List)HibernateTemplate.getObjectListByQuery("From Query");

		return queries;
	}

	//=========================================================================

	public static StartupRequest getStartupRequestById(int id)
	{
		return (StartupRequest)HibernateTemplate.getObject(StartupRequest.class,id);
	}

	public static int deleteStartupRequest(int id)
	{
		return HibernateTemplate.deleteObject(StartupRequest.class,id);
	}

	public static List<StartupRequest> getStartupRequests()
	{
		List<StartupRequest> startupRequests=(List)HibernateTemplate.getObjectListByQuery("From StartupRequest");

		return startupRequests;
	}

	//=========================================================================
}
