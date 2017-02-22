package com.estateagency.dao;

import com.estateagency.model.Seller;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SellerDaoImpl implements SellerDao {
    private static final Logger logger = LoggerFactory.getLogger(SellerDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addSeller(Seller seller) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(seller);
        logger.info("Seller successfully saved. Seller details: " + seller);
    }

    @Override
    public void updateSeller(Seller seller) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(seller);
        logger.info("Seller successfully update. Seller details: " + seller);
    }

    @Override
    public void removeSeller(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Seller seller = (Seller) session.load(Seller.class, new Integer(id));

        if(seller!=null){
            session.delete(seller);
        }
        logger.info("Seller successfully removed. Seller details: " + seller);
    }

    @Override
    public Seller getSellerById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Seller seller = (Seller) session.load(Seller.class, new Integer(id));
        logger.info("Seller successfully loaded. Seller details: " + seller);

        return seller;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Seller> listSellers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Seller> sellerList = session.createQuery("from Seller").list();

        for(Seller seller: sellerList){
            logger.info("Seller list: " + seller);
        }

        return sellerList;
    }
}
