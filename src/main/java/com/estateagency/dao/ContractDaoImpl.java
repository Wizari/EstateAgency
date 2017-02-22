package com.estateagency.dao;

import com.estateagency.model.Contract;
import com.estateagency.model.Flat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ContractDaoImpl implements ContractDao {
    private static final Logger logger = LoggerFactory.getLogger(ContractDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addContract(Contract contract) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(contract);
        logger.info("Contract successfully saved. Contract details: " + contract);
    }

    @Override
    public void updateContract(Contract contract) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(contract);
        logger.info("Contract successfully update. Contract details: " + contract);
    }

    @Override
    public void removeContract(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Contract contract = (Contract) session.load(Contract.class, new Integer(id));

        if(contract!=null){
            session.delete(contract);
        }
        logger.info("Contract successfully removed. Contract details: " + contract);
    }

    @Override
    public Contract getContractById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Contract contract = (Contract) session.load(Contract.class, new Integer(id));
        logger.info("Contract successfully loaded. Contract details: " + contract);

        return contract;
    }
    @Override
    @SuppressWarnings("unchecked")
    public List<Contract> getContractByFlat(int flat) {
        Session session =this.sessionFactory.getCurrentSession();
        List<Contract> contracts = session.createQuery("from Contract where flats_id = " + flat).list();
        return contracts;
    }
    @Override
    @SuppressWarnings("unchecked")
    public List<Contract> getContractByBuyer(int buyerId) {
        Session session =this.sessionFactory.getCurrentSession();
        List<Contract> contracts = session.createQuery("from Contract where buyers_id = " + buyerId).list();
        return contracts;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Contract> getContractBySeller(int sellerId) {
        Session session =this.sessionFactory.getCurrentSession();
        List<Contract> contracts = session.createQuery("from Contract where sellers_id = " + sellerId).list();
        return contracts;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Contract> getContractByRealtor(int realtorId) {
        Session session =this.sessionFactory.getCurrentSession();
        List<Contract> contracts = session.createQuery("from Contract where realtors_id = " + realtorId).list();
        return contracts;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Contract> listContracts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Contract> contractList = session.createQuery("from Contract").list();

        for(Contract contract: contractList){
            logger.info("Contract list: " + contract);
        }

        return contractList;
    }
}
