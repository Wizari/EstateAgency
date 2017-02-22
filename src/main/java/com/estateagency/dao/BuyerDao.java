package com.estateagency.dao;

import com.estateagency.model.Buyer;

import java.util.List;

public interface BuyerDao {
    void addBuyer(Buyer buyer);

    void updateBuyer(Buyer buyer);

    void removeBuyer(int id);

    Buyer getBuyerById(int id);

    List<Buyer> listBuyers();
}
