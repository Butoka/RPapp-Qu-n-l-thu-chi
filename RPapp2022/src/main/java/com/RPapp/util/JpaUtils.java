package com.RPapp.util;

import javax.persistence.*;

public class JpaUtils {
	private static EntityManagerFactory factory;

	static public EntityManager getEntityManager() {
		if (factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("RPapp");
		}
		return factory.createEntityManager();
	}

	static public void shutDown() {
		if (factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
