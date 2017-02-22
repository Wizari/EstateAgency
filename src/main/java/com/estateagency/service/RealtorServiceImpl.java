package com.estateagency.service;

import com.estateagency.dao.RealtorDao;
import com.estateagency.model.Realtor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RealtorServiceImpl implements RealtorService {
    private RealtorDao realtorDao;

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
    public void removeRealtor(int id) {
        this.realtorDao.removeRealtor(id);
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
