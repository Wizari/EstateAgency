package com.estateagency.dao;

import com.estateagency.model.Realtor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RealtorDaoImpl implements RealtorDao {
    private static final Logger logger = LoggerFactory.getLogger(RealtorDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addRealtor(Realtor realtor) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(realtor);
        logger.info("Realtor successfully saved. Realtor details: " + realtor);
    }

    @Override
    public void updateRealtor(Realtor realtor) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(realtor);
        logger.info("Realtor successfully update. Realtor details: " + realtor);
    }

    @Override
    public void removeRealtor(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Realtor realtor = (Realtor) session.load(Realtor.class, new Integer(id));

        if(realtor!=null){
            session.delete(realtor);
        }
        logger.info("Realtor successfully removed. Realtor details: " + realtor);
    }

    @Override
    public Realtor getRealtorById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Realtor realtor = (Realtor) session.load(Realtor.class, new Integer(id));
        logger.info("Realtor successfully loaded. Realtor details: " + realtor);

        return realtor;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Realtor> listRealtors() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Realtor> realtorList = session.createQuery("from Realtor").list();

        for(Realtor realtor: realtorList){
            logger.info("Realtor list: " + realtor);
        }

        return realtorList;
    }
}
