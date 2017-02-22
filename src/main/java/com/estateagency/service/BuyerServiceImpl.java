package com.estateagency.service;

import com.estateagency.dao.BuyerDao;
import com.estateagency.model.Buyer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BuyerServiceImpl implements BuyerService {
    private BuyerDao buyerDao;

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
    public void removeBuyer(int id) {
        this.buyerDao.removeBuyer(id);
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
