package com.estateagency.dao;

import com.estateagency.model.Buyer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BuyerDaoImpl implements BuyerDao {
    private static final Logger logger = LoggerFactory.getLogger(BuyerDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBuyer(Buyer buyer) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(buyer);
        logger.info("Buyer successfully saved. Buyer details: " + buyer);
    }

    @Override
    public void updateBuyer(Buyer buyer) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(buyer);
        logger.info("Buyer successfully update. Buyer details: " + buyer);
    }

    @Override
    public void removeBuyer(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Buyer buyer = (Buyer) session.load(Buyer.class, new Integer(id));

        if(buyer!=null){
            session.delete(buyer);
        }
        logger.info("Buyer successfully removed. Buyer details: " + buyer);
    }

    @Override
    public Buyer getBuyerById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Buyer buyer = (Buyer) session.load(Buyer.class, new Integer(id));
        logger.info("Buyer successfully loaded. Buyer details: " + buyer);

        return buyer;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Buyer> listBuyers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Buyer> buyerList = session.createQuery("from Buyer").list();

        for(Buyer buyer: buyerList){
            logger.info("Buyer list: " + buyer);
        }

        return buyerList;
    }
}
