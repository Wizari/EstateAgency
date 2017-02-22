package com.estateagency.service;

import com.estateagency.dao.ContractDao;
import com.estateagency.dao.FlatDao;
import com.estateagency.model.Contract;
import com.estateagency.model.Flat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.soap.Addressing;
import java.util.List;

@Service
public class FlatServiceImpl implements FlatService {
    private FlatDao flatDao;

    @Autowired
    private ContractDao contractDao;

    public void setFlatDao(FlatDao flatDao) {
        this.flatDao = flatDao;
    }

    @Override
    @Transactional
    public void addFlat(Flat flat) {
        this.flatDao.addFlat(flat);
    }

    @Override
    @Transactional
    public void updateFlat(Flat flat) {
        this.flatDao.updateFlat(flat);
    }

    @Override
    @Transactional
    public void removeFlat(int id) {
        List<Contract> contracts = this.contractDao.getContractByFlat(id);
        if (contracts.size() > 0) {
            this.contractDao.removeContract(contracts.get(0).getId());
        }
        this.flatDao.removeFlat(id);
    }

    @Override
    @Transactional
    public Flat getFlatById(int id) {
        return this.flatDao.getFlatById(id);
    }

    @Override
    @Transactional
    public List<Flat> listFlats() {
        return this.flatDao.listFlats();
    }
}
