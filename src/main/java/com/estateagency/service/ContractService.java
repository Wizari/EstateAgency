package com.estateagency.service;

import com.estateagency.model.Contract;

import java.util.List;

public interface ContractService {
    void addContract(Contract contract);

    void updateContract(Contract contract);

    void removeContract(int id);

    Contract getContractById(int id);

    List<Contract> listContracts();
}
