package com.estateagency.dao;

import com.estateagency.model.Contract;
import com.estateagency.model.Flat;

import java.util.List;

public interface ContractDao {
    void addContract(Contract contract);

    void updateContract(Contract contract);

    void removeContract(int id);

    Contract getContractById(int id);

    List<Contract> getContractByFlat(int flatId);

    @SuppressWarnings("unchecked")
    List<Contract> getContractByBuyer(int buyerId);

    @SuppressWarnings("unchecked")
    List<Contract> getContractBySeller(int sellerId);

    @SuppressWarnings("unchecked")
    List<Contract> getContractByRealtor(int realtorId);

    List<Contract> listContracts();
}
