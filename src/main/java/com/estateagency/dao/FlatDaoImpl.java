package com.estateagency.dao;

import com.estateagency.model.Flat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FlatDaoImpl implements FlatDao {
    private static final Logger logger = LoggerFactory.getLogger(FlatDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addFlat(Flat flat) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(flat);
        logger.info("Flat successfully saved. Flat details: " + flat);
    }

    @Override
    public void updateFlat(Flat flat) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(flat);
        logger.info("Flat successfully update. Flat details: " + flat);
    }

    @Override
    public void removeFlat(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Flat flat = (Flat) session.load(Flat.class, new Integer(id));

        if(flat!=null){
            session.delete(flat);
        }
        logger.info("Flat successfully removed. Flat details: " + flat);
    }

    @Override
    public Flat getFlatById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Flat flat = (Flat) session.load(Flat.class, new Integer(id));
        logger.info("Flat successfully loaded. Flat details: " + flat);

        return flat;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Flat> listFlats() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Flat> flatList = session.createQuery("from Flat").list();

        for(Flat flat: flatList){
            logger.info("Flat list: " + flat);
        }

        return flatList;
    }
}
