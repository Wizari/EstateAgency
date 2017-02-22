package com.estateagency.service;

import com.estateagency.dao.ContractDao;
import com.estateagency.model.Contract;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {
    private ContractDao contractDao;

    public void setContractDao(ContractDao contractDao) {
        this.contractDao = contractDao;
    }

    @Override
    @Transactional
    public void addContract(Contract contract) {
        this.contractDao.addContract(contract);
    }

    @Override
    @Transactional
    public void updateContract(Contract contract) {
        this.contractDao.updateContract(contract);
    }

    @Override
    @Transactional
    public void removeContract(int id) {
        this.contractDao.removeContract(id);
    }

    @Override
    @Transactional
    public Contract getContractById(int id) {
        return this.contractDao.getContractById(id);
    }

    @Override
    @Transactional
    public List<Contract> listContracts() {
        return this.contractDao.listContracts();
    }
}
