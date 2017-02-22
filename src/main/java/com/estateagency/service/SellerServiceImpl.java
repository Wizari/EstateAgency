package com.estateagency.service;

import com.estateagency.model.Seller;
import com.estateagency.dao.SellerDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SellerServiceImpl implements SellerService {
    private SellerDao sellerDao;

    public void setSellerDao(SellerDao sellerDao) {
        this.sellerDao = sellerDao;
    }

    @Override
    @Transactional
    public void addSeller(Seller seller) {
        this.sellerDao.addSeller(seller);
    }

    @Override
    @Transactional
    public void updateSeller(Seller seller) {
        this.sellerDao.updateSeller(seller);
    }

    @Override
    @Transactional
    public void removeSeller(int id) {
        this.sellerDao.removeSeller(id);
    }

    @Override
    @Transactional
    public Seller getSellerById(int id) {
        return this.sellerDao.getSellerById(id);
    }

    @Override
    @Transactional
    public List<Seller> listSellers() {
        return this.sellerDao.listSellers();
    }
}
