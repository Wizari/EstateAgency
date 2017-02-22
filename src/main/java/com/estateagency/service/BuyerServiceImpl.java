package com.estateagency.service;

import com.estateagency.dao.BuyerDao;
import com.estateagency.dao.ContractDao;
import com.estateagency.model.Buyer;
import com.estateagency.model.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BuyerServiceImpl implements BuyerService {
    private BuyerDao buyerDao;

    @Autowired
    private ContractDao contractDao;

    public void setBuyerDao(BuyerDao buyerDao) {
        this.buyerDao = buyerDao;
    }

    @Override
    @Transactional
    public void addBuyer(Buyer buyer) {
        this.buyerDao.addBuyer(buyer);
    }

    @Override
    @Transactional
    public void updateBuyer(Buyer buyer) {
        this.buyerDao.updateBuyer(buyer);
    }

    @Override
    @Transactional
    public boolean removeBuyer(int id) {
        List<Contract> contracts = this.contractDao.getContractByFlat(id);
        if (contracts.size() > 0) {
            return false;
        }
        this.buyerDao.removeBuyer(id);
        return true;
    }

    @Override
    @Transactional
    public Buyer getBuyerById(int id) {
        return this.buyerDao.getBuyerById(id);
    }

    @Override
    @Transactional
    public List<Buyer> listBuyers() {
        return this.buyerDao.listBuyers();
    }
}
