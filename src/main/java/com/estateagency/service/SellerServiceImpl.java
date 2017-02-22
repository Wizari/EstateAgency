package com.estateagency.service;

import com.estateagency.dao.ContractDao;
import com.estateagency.model.Contract;
import com.estateagency.model.Seller;
import com.estateagency.dao.SellerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SellerServiceImpl implements SellerService {
    private SellerDao sellerDao;

    @Autowired
    private ContractDao contractDao;

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
    public boolean removeSeller(int id) {
        List<Contract> contracts = this.contractDao.getContractByFlat(id);
        if (contracts.size() > 0) {
            return false;
        }
        this.sellerDao.removeSeller(id);
        return true;
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
