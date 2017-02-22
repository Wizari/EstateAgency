package com.estateagency.service;

import com.estateagency.dao.ContractDao;
import com.estateagency.dao.RealtorDao;
import com.estateagency.model.Contract;
import com.estateagency.model.Realtor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RealtorServiceImpl implements RealtorService {
    private RealtorDao realtorDao;
    @Autowired
    private ContractDao contractDao;

    public void setRealtorDao(RealtorDao realtorDao) {
        this.realtorDao = realtorDao;
    }

    @Override
    @Transactional
    public void addRealtor(Realtor realtor) {
        this.realtorDao.addRealtor(realtor);
    }

    @Override
    @Transactional
    public void updateRealtor(Realtor realtor) {
        this.realtorDao.updateRealtor(realtor);
    }

    @Override
    @Transactional
    public boolean removeRealtor(int id) {
        List<Contract> contracts = this.contractDao.getContractByFlat(id);
        if (contracts.size() > 0) {
            return false;
        }
        this.realtorDao.removeRealtor(id);
        return true;
    }

    @Override
    @Transactional
    public Realtor getRealtorById(int id) {
        return this.realtorDao.getRealtorById(id);
    }

    @Override
    @Transactional
    public List<Realtor> listRealtors() {
        return this.realtorDao.listRealtors();
    }
}
